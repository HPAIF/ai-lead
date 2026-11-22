---
name: log-job
description: Record a job in the team lead's memory — journal entry plus board update, team-level decisions, the lead's own follow-ups and learnings. Use at the end of every request the lead handled.
---

# log-job

History is **append-only**: add entries/rows; to correct, add an entry that references the old one.
Get today's date with `date +%F`. Paths are under `ai-team/lead/`.

1. **Journal** — append to `history/journal.md` (next J-number, format at the top of the file):
   request, board ID, members asked, outcome, files produced (by members), follow-ups.
2. **Board** — make sure the request's row and status are current (`board` skill).
3. **Decisions** — the founder decided something that spans members (e.g. "launch in Q2, legal
   form LLC") → append to `history/decisions.md`, naming which members' records hold the details.
4. **Obligations** — the lead's own follow-ups (e.g. "ask lawyer again after founder sends the
   contract") → `history/obligations.md` (standard table; due date `YYYY-MM-DD` or `—`).
   Members' deadlines stay in the members' own files.
5. **Company facts** — only if the founder stated a new fact and no member recorded it: update
   `ai-team/company/` and say so in the journal.
6. **Learnings** — routing or synthesis lessons → `learnings.md` (scope `company` or `general`).
7. Confirm in one line what was recorded (e.g. "Logged J-0004, R-0007 → waiting on founder").
