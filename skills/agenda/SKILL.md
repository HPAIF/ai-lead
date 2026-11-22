---
name: agenda
description: One combined agenda for the whole team — every member's open obligations (overdue, next 30 days, undated) plus board items waiting on the founder, in a single list. Use for "what's due?", "what should I do this week?", weekly overviews.
---

# agenda

1. Find every `ai-team/*/history/obligations.md` (one per member). Each has a table whose rows start
   with `| O-` and whose 6th column is the status (`open` / `done` / `dropped`).
2. Collect `open` rows: member, ID (as `member:O-xxxx`), due date, type, what.
3. Add board rows from `ai-team/lead/board.md` with status `waiting on founder`.
4. Output, most urgent first:
   ```
   # Agenda — YYYY-MM-DD
   ## Overdue
   ## This week (next 7 days)
   ## Next 30 days
   ## Waiting on your decision (board)
   ## Undated open items (by member)
   ```
   Merge duplicates that two members track for the same thing (say both IDs).
5. Point out conflicts (e.g. two members proposing different deadlines for the same filing) and
   anything with no owner.
6. If asked for a snapshot, save it to `ai-team/lead/digests/YYYY-MM-DD-agenda.md`, then `log-job`.

Never change other members' obligation rows — ask the member (via `ask-team`) to update them.
