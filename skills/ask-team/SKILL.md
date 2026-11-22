---
name: ask-team
description: Get a request done by the right AI Team members, visibly — pick members from the routing table, address each with an @mention and a short brief in the group chat (never through hidden agent calls), then combine their answers into one reply with conflicts and decisions for the founder. Use for any request that needs a specialist.
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
4. **Order.** In a group chat, address independent members in one message (`@lawyer … @accountant
   …`); each answers once, visibly. Dependent questions: ask the first now and the next one after
   its answer is in (usually the founder's next message).
5. **Brief each member inside your message**, short:
   ```
   @accountant (R-0007): <the founder's request in their words>. Need: <decision / estimate / draft>.
   Context: ai-team/company/profile.md, ai-team/company/products/<p>.md.
   ```
6. **No hidden channels.** Never use the Agent tool or subagents to reach members. Outside a group
   chat (terminal, one-to-one), end with `For @<member>: <question>` lines and suggest a group chat
   with those members in HPAIF Messenger. Ask once; never start a back-and-forth among members
   without the founder.
7. **Read each reply critically** when it arrives. Keep caveats (UNVERIFIED, escalation, risks).
   If a reply is off-target or incomplete, say so to the founder and propose the sharper question
   rather than filling the gap yourself.
8. **Synthesize** in the answer format from the rules: short answer → per-member summary →
   agreements/conflicts → the founder's decisions (with options) → next actions with owners →
   board status. Link to the files members wrote (memos, drafts, reviews).
9. **Close.** Update the board row (`waiting on founder` if decisions are open, else `done`, with
   a one-line answer and links), then `ai-lead:log-job`.
