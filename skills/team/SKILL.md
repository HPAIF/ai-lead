---
name: team
description: Team health check — who is installed (ai-team/team.md vs the routing table), which members are missing for recent requests, each member's pending general learnings, open improvement proposals, and plugin versions. Use for "who's on the team?", "what should I add?", "is everyone up to date?".
---

# team

1. **Installed:** read `ai-team/team.md` (members, versions at setup). Compare with the routing
   table in `${CLAUDE_PLUGIN_ROOT}/RULES.md`.
2. **Gaps:** scan `ai-team/lead/board.md` for requests that needed a missing member; list which
   plugin would have covered them and how to add it:
   `/plugin install ai-<member>@ai-team`, then "set up the AI <member>".
3. **Learning:** for each member, count rows in `ai-team/<member>/learnings.md` with scope
   `general` and status `pending`; suggest that member's `improve` skill when there are 3+.
4. **Versions (optional):** if the founder asks, compare versions in `team.md` with the installed
   plugins (`claude plugin list`) and suggest `/plugin marketplace update ai-team` then
   `/plugin update <plugin>@ai-team`.
5. Report as a short table: member · installed · version · open obligations · pending learnings.
