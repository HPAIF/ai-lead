---
name: triage-inbox
description: Route documents the founder drops into the company-wide inbox (ai-team/lead/inbox/) to the right member's inbox — contracts, invoices, statements, letters, specs, designs — and tell the founder who will handle each. Use for "process the inbox", "I dropped some files", or when the session hook reports files waiting.
---

# triage-inbox

For each file in `ai-team/lead/inbox/` (except README.md), oldest first:

1. **Look at it** (name, type, first page/lines). Don't extract or copy its contents elsewhere.
2. **Decide the owner** from the routing table:
   - contracts, terms, authority/legal letters → lawyer (money terms also → accountant)
   - invoices, receipts, bank statements, payslips, tax letters → accountant
   - architecture docs, code exports → cto · infra/incident files → devops · pentest/security
     reports → security · research notes, specs → product · brand/content → marketing ·
     prospect/customer lists → sales
3. **Move** (`mv`, never copy, never overwrite — add `_2` if the name exists) to
   `ai-team/<member>/inbox/` if that member is installed. If the owner isn't installed, leave the
   file and tell the founder which plugin is needed. A file for two members goes to the primary
   owner; note the second in the board row.
4. **Board:** one row per batch ("Inbox triage: 3 files"), listing file → member.
5. **Hand over:** offer to run `ask-team` so each member processes its inbox now
   (e.g. accountant `record-document`, lawyer `contract-review`).
6. `log-job`.
