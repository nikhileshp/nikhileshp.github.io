---
layout: about
title: about
permalink: /
subtitle: Ph.D. Student <br> <a href='http://www.utdallas.edu'>The University of Texas at Dallas</a>

profile:
  align: right
  image: prof_pic.jpg
  image_circular: true # crops the image to make it circular
  # address: >
  #   <p>555 your office number</p>
  #   <p>123 your address street</p>
  #   <p>Your City, State 12345</p>

news: false   # includes a list of news items
latest_posts: false # includes a list of the newest posts
selected_papers: false # includes a list of papers marked as "selected={true}"
social: true  # includes social icons at the bottom of the page
---

I'm a CS Ph.D. student at the University of Texas at Dallas, working in the [StARLinG Lab](https://starling-lab.github.io/) with Dr. Sriraam Natarajan. My research is on reinforcement learning and neurosymbolic AI: relational abstractions that let planners and RL agents share structure, and imitation learning that grounds pixels into symbols and learns interpretable rules from a handful of demonstrations. I'm interested in interpretability, learning from human guidance, transfer across environments, and multi-agent systems.

Three threads occupy me at the moment, all growing out of my earlier work on relational planning for multi-agent RL (MaRePReL, AAMAS 2025) and gaze-guided neurosymbolic imitation learning (GRAIL, IJCLR 2026). The first treats human gaze as privileged information about task structure rather than only as an attention prior: gaze segments demonstrations into subtasks, binds the object each option acts on, and picks the predicates each option may use, giving a hierarchical neurosymbolic policy that is trained with gaze and deployed without it, on Atari and CARLA. The second lifts LLM-synthesised programmatic world models such as PoE-World from per-game object types to rules over functional roles like hazard or climbable, with weights tied across games, so that what an agent learns in Montezuma's Revenge carries over to Kangaroo or Pitfall. The third asks how an agent should learn an action model when demonstrations are scarce but an expert who knows the environment can be queried, and what the right questions to ask are.

Outside the lab I play blitz chess. A Maia2 model fine-tuned on my games lives under [play my chess bot](/chess-clone/) if you want a game.

If you would like to collaborate, please feel free to reach out through [email](mailto:nikhilesh.prabhakar@utdallas.edu).
