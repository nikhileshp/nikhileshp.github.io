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
      request["Authorization"] = ENV["NOTION_API_KEY"]
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
      
      req_options = {
        use_ssl: uri.scheme == "https",
      }
      
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
      
      page = response.body
      results = JSON.parse(page)["results"]

      
      path = site.in_source_dir("_posts/newpost.md")
      # slug = 'new_post'
      # path = site.in_source_dir("_posts/#{slug}.md")

      results.each do |e|
        if e["properties"]["Status"]["status"]["name"] != "Not started"
          doc = Jekyll::Document.new(
            path, { :site => site, :collection => site.collections['posts'] }
          )
          doc.data['external_source'] = e["properties"]["Authors"]["rich_text"].first()["plain_text"];
          doc.data['feed_content'] = 'bs';
          doc.data["date"] = Date.parse(e["properties"]["Created time"]["created_time"])
          doc.data["tags"] = Array.new
          e["properties"]["Topics"]["multi_select"].each do |topic|
            doc.data["tags"].append(topic["name"])
          end
          doc.data['title'] = "Paper Summary: " + e["properties"]["Name"]["title"].first()["plain_text"]
          # ["properties"]["Name"]["title"]["plain_text"]

          doc.data['description'] = "";
        
          doc.data['redirect'] = e["url"];
          site.collections['posts'].docs << doc
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
