---
layout: page
permalink: /interests/
title: interests
description: Things I enjoy outside of research.
nav: false
nav_order: 6
---

<div class="interests-grid">
  <div class="interest-card">
    <h3>Chess</h3>
    <p>
      Casual but committed. I follow elite-level play and study openings, endgames, and tactics
      whenever I get the chance. Always up for a game online or over the board.
    </p>
  </div>

  <div class="interest-card">
    <h3>Basketball</h3>
    <p>
      Long-time NBA fan and pickup-game regular. I enjoy the game both as a player and as a
      spectator who appreciates the strategy behind rotations, spacing, and play design.
    </p>
  </div>

  <div class="interest-card">
    <h3>Sports Analytics</h3>
    <p>
      Fascinated by the intersection of data and sport &mdash; from advanced basketball metrics
      to player tracking, expected value models, and predictive analytics. Side projects in this
      space let me apply my ML interests in a domain I genuinely love.
    </p>
  </div>

  <div class="interest-card">
    <h3>Reading &amp; Tech Tinkering</h3>
    <p>
      I read broadly across non-fiction, AI research, and the occasional novel. On the side I
      tinker with home-lab projects, automation, and small ML experiments that don't need to
      become papers.
    </p>
  </div>
</div>

<style>
  .interests-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 1.25rem;
    margin-top: 1.5rem;
  }

  .interest-card {
    padding: 1.25rem 1.4rem;
    border: 1px solid var(--global-divider-color);
    border-radius: 0.5rem;
    background-color: var(--global-card-bg-color);
    transition: all 0.2s ease-in-out;
  }

  .interest-card:hover {
    border-color: var(--global-theme-color);
    transform: translateY(-2px);
  }

  .interest-card h3 {
    margin-top: 0;
    margin-bottom: 0.5rem;
    color: var(--global-theme-color);
    font-size: 1.15rem;
  }

  .interest-card p {
    margin-bottom: 0;
    font-size: 0.95rem;
    line-height: 1.5;
  }
</style>
