---
name: setup
description: Set up (or repair/upgrade) the AI team lead in the current company folder — joins or creates the private ai-team/ workspace (shared company files + ai-team/lead/ with the board and company-wide inbox) and registers the lead in team.md. Use on first use, when the lead's folder is missing, or after a plugin update that changes the workspace.
---

# setup

Template files are in `${CLAUDE_PLUGIN_ROOT}/skills/setup/workspace/`. Never overwrite an existing
file in `ai-team/` — the workspace may already hold real history.

1. **Explain** in two lines: the lead becomes the single entry point; it creates `ai-team/lead/`
   (board, inbox, memory); nothing leaves the machine.
   **Location:** if an `ai-team/` already exists in this folder or a parent folder, join it —
   never create a second one. Otherwise ask where to create it: in this folder (default), or in a
   parent company folder when this project is one of several products (layout
   `<company>/ai-team/` next to `<company>/projects/<product>/`).
2. **Create shared files if missing** (another member may have created them): `ai-team/README.md`,
   `ai-team/team.md`, `ai-team/company/profile.md`, `ai-team/company/documents.md`,
   `ai-team/company/products/_template.md`. New workspace → ask the answer language and fill
   `team.md` (date, `workspace_contract: 1`).
3. **Create** `ai-team/lead/` from the template's `lead/` folder: `board.md`, `learnings.md`,
   `history/{journal,decisions,obligations}.md`, `digests/README.md`, `inbox/README.md`.
4. **Register** a row in `team.md`: `lead | ai-lead | ai-lead:lead | ai-team/lead/ | <plugin
   version> | <today> | entry point: routing, board, agenda, inbox triage`.
5. **Team check:** list installed members from `team.md`; for the most useful missing ones, show
   `/plugin install ai-<member>@ai-team` and "set up the AI <member>". Don't install anything.
6. **Offer, don't force:**
   - **Entry point:** suggest starting sessions with `claude --agent ai-lead:lead` in the company
     folder, and adding to the company `CLAUDE.md`: "Route requests through `ai-lead:lead`."
     (Edit `CLAUDE.md` only if the founder agrees.)
   - **Privacy:** if the folder is a git repo, make sure `ai-team/*/inbox/*` (except README) is in
     `.gitignore`.
7. **Upgrade mode** (workspace exists): create only missing files, apply migrations from
   `CHANGELOG.md` newer than the version in `team.md`, update the version, log what changed.
8. First journal entry `J-0001 · <today> · setup`; then `log-job`; finish with a two-line summary
   and three example requests to try.
