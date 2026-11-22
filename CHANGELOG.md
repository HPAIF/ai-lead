# Changelog

Versions follow semver: patch = fixes and wording, minor = new skill / new member in the routing
table / new workspace file, major = breaking workspace change. Entries that need a workspace change
list a **Migration** step; `setup` (upgrade mode) applies it.

## 0.1.0 — 2026-11-22
- First version: agent `lead` (single entry point), rules with the team routing table, skills
  setup, ask-team, board, agenda, team, triage-inbox, log-job, improve.
- Workspace folder `ai-team/lead/` (board, company-wide inbox, history, learnings).
- Team-wide session hook (members, board, all members' urgent obligations, inbox).
