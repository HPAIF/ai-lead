---
name: board
description: Keep the team board (ai-team/lead/board.md) — one row per founder request with R-number, members working on it, status and answer. Use when a request arrives, when it moves, and for "what's open?", "status of R-0004", "what are you waiting on me for?".
---

# board

File: `ai-team/lead/board.md` (format at the top of the file). Rows are never deleted.

**Add** — next free `R-0001` number, today's date (`date +%F`), the request in one line, the
members involved, status `open`.

**Update** — change status and the "Answer / link" cell; append an event line under "Events":
`R-xxxx · YYYY-MM-DD · what happened`.

Statuses: `open` → `with members` → `waiting on founder` → `done` (or `dropped`, with reason).

**Report** ("what's open?"):
```
Waiting on you (decisions/approvals): R-… — what you need to decide
With members: R-… — who, since when
Open, not started: R-…
Done this week: R-… — one-line answer
```
Items `waiting on founder` for more than 7 days → mention them at the top.
