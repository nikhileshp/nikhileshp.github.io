---
layout: page
title: Neurosymbolic Imitation Learning with Human Attention
description: End-to-end neurosymbolic framework treating expert gaze as privileged information for imitation learning.
img: assets/img/1.jpg
importance: 4
category: research
github: https://github.com/nikhileshp/Gaze-Based-Neurosymbolic-Imitation-Learner
---

*Sep 2025 - Feb 2026* — [[code](https://github.com/nikhileshp/Gaze-Based-Neurosymbolic-Imitation-Learner)]

An end-to-end neurosymbolic framework treating expert gaze as privileged information for imitation learning.

A neural perception module grounds raw Atari frames into probabilistic first-order atoms, and gaze-derived saliency scores reweight atom valuations to suppress task-irrelevant objects before a differentiable forward-chaining reasoner (NSFR) learns interpretable rule-weighted policies.

Unlike pixel-level regularization methods (e.g., GABRIL), gaze operates at the *symbolic grounding level*, filtering which relational atoms enter reasoning.

**Results:** Achieves 2.5× the score of the unmodulated baseline and 20× behavior cloning on Asterix, matching full-data performance with 10% of training data.
