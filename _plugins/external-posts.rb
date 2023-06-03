require 'feedjira'
require 'httparty'
require 'jekyll'
require 'net/http'
require 'json'
require 'date'

module ExternalPosts
  class ExternalPostsGenerator < Jekyll::Generator
    safe true
    priority :high


    
    
    def generate(site)
      uri = URI.parse("https://api.notion.com/v1/databases/66e4dc0bf46f480a903408b7725e9ecd/query")
      request = Net::HTTP::Post.new(uri)
      request.content_type =  "application/json"
      # request["Authorization"] = ENV['NOTION_API_KEY']
      request["Authorization"] = 'secret_tn7WHwJcnH57na08yt52eTn0yiEXA6gp7cHE3J5mtyp'
      request["Notion-Version"] = "2022-06-28"
      request.body = JSON.dump({
        "sorts" => [
          {
            "property" => "Created time",
            "direction" => "ascending"
          }
        ]
      })
      
      
      req_options = {
        use_ssl: uri.scheme == "https",
      }
      
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      
      status = response.code

      if(status=="200")
      
        page = response.body
        results = JSON.parse(page)["results"]

        
        
        results.each do |e|
          p "...fetching #{e["url"]}"
          slug = e["properties"]["Paper"]["files"].first()["name"].delete(".pdf")
          path = e["url"]
          # path = site.in_source_dir("_posts/newpost.md")
          

          if e["properties"]["Status"]["status"]["name"] != "Not started"
            
            doc = Jekyll::Document.new(
              path, { :site => site, :collection => site.collections['posts'] }
            )
            doc.data['external_source'] = e["properties"]["Authors"]["rich_text"].first()["plain_text"];
            doc.data['feed_content'] = e["url"];
            doc.data["date"] = Time.parse(e["properties"]["Created time"]["created_time"])
            doc.data["tags"] = Array.new
            e["properties"]["Topics"]["multi_select"].each do |topic|
              doc.data["tags"].append(topic["name"])
            end
            doc.data['title'] = "Paper Summary: " + e["properties"]["Name"]["title"].first()["plain_text"]
            # ["properties"]["Name"]["title"]["plain_text"]
            
            if  e["properties"]["Abstract"]["rich_text"].first()["text"]["content"].length > 381
              doc.data['description'] = "<u><b>Abstract:</u></b> <font size=2>" + e["properties"]["Abstract"]["rich_text"].first()["text"]["content"].slice(0,380) + "...</font>"
            else
              doc.data['description'] = "<u><b>Abstract:</u></b> <small>" + e["properties"]["Abstract"]["rich_text"].first()["text"]["content"]+ "</small>"
            end
            doc.data['redirect'] = e["url"];
            site.collections['posts'].docs << doc
          end
        end
      end

      
      # if site.config['external_sources'] != nil
      #   site.config['external_sources'].each do |src|
      #     p "Fetching external posts from #{src['name']}:"
      #     xml = HTTParty.get(src['rss_url']).body
      #     feed = Feedjira.parse(xml)
      #     feed.entries.each do |e|
      #       p "...fetching #{e.url}"
      #       slug = e.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      #       path = site.in_source_dir("_posts/#{slug}.md")
      #       doc = Jekyll::Document.new(
      #         path, { :site => site, :collection => site.collections['posts'] }
      #       )
      #       doc.data['external_source'] = src['name'];
      #       doc.data['feed_content'] = e.content;
      #       doc.data['title'] = "#{e.title}";
      #       doc.data['description'] = e.summary;
      #       doc.data['date'] = e.published;
      #       doc.data['redirect'] = e.url;
      #       site.collections['posts'].docs << doc
      #     end
      #   end
      # end
    end
  end

end
