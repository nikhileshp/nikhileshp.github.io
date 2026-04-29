---
layout: page
title: Automated Predicate Discovery for Relational RL
description: Discovering relational symbolic abstractions from RL experience without hand-written domain knowledge.
img: assets/img/3.jpg
importance: 2
category: research
---

*Apr 2026 - Present*

A framework for automatically discovering relational symbolic abstractions from RL experience, without hand-written domain knowledge or expert demonstrations. Addresses the core bottleneck of RePReL (AAMAS 2025): hand-coded D-FOCI predicates.

Reward-adjacent trajectory segmentation identifies subtask boundaries, clusters breakpoint contexts across episodes to learn a predicate vocabulary (including role-relative predicates like `at_pickup_loc`), and derives per-operator state abstractions that enable zero-shot generalization to novel object counts.

Initial validation on relational Taxi recovers the full operator hierarchy and predicate set from reward signal alone.
