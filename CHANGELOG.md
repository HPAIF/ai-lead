# Changelog

Versions follow semver: patch = fixes and wording, minor = new skill / new member in the routing
table / new workspace file, major = breaking workspace change. Entries that need a workspace change
list a **Migration** step; `setup` (upgrade mode) applies it.

## 0.2.0 — 2026-11-23
- Routes visibly: @mentions members in the group chat; no hidden agent calls; one hop, then the
  founder decides. **Migration:** none.

## 0.1.3 — 2026-11-23
- Missed questions: an unanswered question that still matters is repeated briefly under
  "Still open:" at the end of the next answer.

## 0.1.2 — 2026-11-23
- Never send the founder to a member; when a member's reply ends with "Question for @x", route it
  yourself in the same request.

## 0.1.1 — 2026-11-23
- Rule "Be concise": shortest answer that keeps all important information (warnings, numbers,
  dates, sources, decisions); long only when the content needs it.

## 0.1.0 — 2026-11-22
- First version: agent `lead` (single entry point), rules with the team routing table, skills
  setup, ask-team, board, agenda, team, triage-inbox, log-job, improve.
- Workspace folder `ai-team/lead/` (board, company-wide inbox, history, learnings).
- Team-wide session hook (members, board, all members' urgent obligations, inbox).
