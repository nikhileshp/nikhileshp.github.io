---
layout: page
title: Procedural Concept Induction from Video Scene Graphs
description: Neurosymbolic framework that induces procedural concepts as interpretable logical rules from egocentric cooking video.
img: assets/img/12.jpg
importance: 1
category: research
---

*Mar 2026 - Present*

A neurosymbolic framework that induces procedural concepts as interpretable logical rules from egocentric cooking video (CaptainCook4D, 384 HoloLens2 recordings).

**Stage one** fine-tunes an open-vocabulary scene graph generator (GroundingDINO + SAM 3.1 with a cooking-adapted relation head) on step-boundary keyframes, then links per-step graphs across time by object identity to form a sparse spatio-temporal graph over each recording.

**Stage two** grounds graph nodes and relations into symbolic atoms and runs Popper (ILP) with predicate invention to learn per-recipe step rules and cross-recipe higher-order concepts.

Unlike USG, PVSG, and holistic spatio-temporal scene graph work, which focus on graph generation and perception-level semantics, the contribution is symbolic concept induction over graph evolution with interpretable, rule-level output.
