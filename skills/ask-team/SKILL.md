---
name: ask-team
description: Get a request done by the right AI Team members — pick members from the routing table, brief each one through the Agent tool (in parallel or in sequence), then combine their answers into one reply with conflicts and decisions for the founder. Use for any request that needs a specialist.
---

# ask-team

1. **Understand the request.** Restate it in one line. If one missing fact changes who should
   work on it, ask the founder that one question first.
2. **Board.** Make sure it has an R-number (`ai-lead:board`); status `with members`.
3. **Pick members** from the routing table in `${CLAUDE_PLUGIN_ROOT}/RULES.md`, using only members
   listed in `ai-team/team.md`. Check for hidden angles founders often miss: tax on any money
   question, legal on contracts/data/claims, security on anything touching customer data,
   product on anything that changes what is built.
   - Needed member missing → say so (rule 2), continue with the available ones.
4. **Order.** Independent questions → delegate in parallel (several Agent calls in one message).
   Dependent ones → sequence them and pass the earlier answer forward (e.g. product spec → cto
   feasibility → security review).
5. **Brief each member** (Agent tool, `subagent_type` = its agent, e.g. `ai-accountant:accountant`):
   ```
   Board: R-xxxx · From the team lead on behalf of the founder.
   Request (founder's words): …
   What I need from you: … (decision, draft, review, estimate…) · Format: your standard answer format.
   Relevant context: paths in ai-team/ (company/profile.md, products/<p>.md, other members' files).
   Other members involved: … (what they are doing / said, if sequential).
   Follow your own rules (verification, logging). Do not contact anyone or take external actions.
   ```
6. **Read each reply critically.** Keep caveats (UNVERIFIED, escalation, risks). If a reply is
   off-target or incomplete, ask that member once more with a sharper brief rather than filling
   the gap yourself.
7. **Synthesize** in the answer format from the rules: short answer → per-member summary →
   agreements/conflicts → the founder's decisions (with options) → next actions with owners →
   board status. Link to the files members wrote (memos, drafts, reviews).
8. **Close.** Update the board row (`waiting on founder` if decisions are open, else `done`, with
   a one-line answer and links), then `ai-lead:log-job`.
