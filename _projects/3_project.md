---
layout: page
title: Hierarchical-AutoToS (HAToS)
description: Extension of AutoToS to multi-agent planning through hierarchical code synthesis.
img: assets/img/7.jpg
importance: 3
category: research
---

*Apr 2026 - Present*

An extension of AutoToS (AAAI 2025) to multi-agent planning through hierarchical code synthesis, where an LLM produces the entire planning stack as executable Python — goal decomposer, per-subtask joint-action successor, subtask completion tests, and top-level goal predicate — validated via AutoToS-style automated unit-test feedback against a ground-truth transition model.

Architecture inspired by MaRePReL (AAMAS 2025): decomposes `DeliverAllBoxes` over a relational subtask vocabulary (`DeliverBoxSolo`, `DeliverBoxTogether`) with partial-freeze semantics for non-active agents.

**Four strategy variants** benchmarked on a warehouse multi-robot delivery domain (Gemini-3-Flash, DeepSeek-V3, Claude Sonnet; 10 seeds × scales S1–S4):

1. Monolithic single-shot joint successor
2. Sequential hierarchical with per-subtask BFS
3. Parallel hierarchical with per-agent queues driving a joint meta-BFS over (world, progress) meta-states
4. Templates-with-outer-search (LLM emits subtask templates only; framework enumerates agent assignments × orderings)

Monolithic fails catastrophically on joint-action coordination at S1 (0/10) while hierarchical with integration-level feedback recovers single-agent AutoToS-level accuracy (7/10 at S1).

Unlike TwoStep, LaMMA-P, LLM+P, and LLM+DM — all of which delegate domain modeling to the LLM via PDDL — HAToS is the first evaluation of LLM-produced Python multi-agent transition models under automated feedback, isolating whether current LLMs can generate correct joint-action successors directly.
