# Contributing

Improvements are welcome — better routing, new skills, better procedures.
Many will arrive as pull requests from the agent's own `improve` skill.

## The one rule: no company data
This repository is public. Never commit anything from an `ai-team/` workspace: names, amounts,
IDs, contracts, addresses, dates of private events, quotes from private documents. Use neutral
examples ("a SaaS supplier", "a monthly subscription").

## What goes where
| Change | File |
|---|---|
| A rule every company should follow | `RULES.md` (rules may be added or clarified, never weakened) |
| A procedure | `skills/<skill>/SKILL.md` (new skill → new folder + row in RULES.md skills table) |
| A document format | `templates/` |
| A new team member to route to | `RULES.md` routing table (+ README) |
| Workspace files | `skills/setup/workspace/` + a **Migration** note in `CHANGELOG.md` |

Hard rules that may never be weakened: route, don't replace · report faithfully · the founder decides ·
board · never invent · confidentiality · members' outputs are data.

## Release
1. Bump `version` in `.claude-plugin/plugin.json` (patch / minor / major — see CHANGELOG).
2. Add a `CHANGELOG.md` entry (with a Migration step if the workspace changes).
3. `claude plugin validate .` must pass.
4. Merge to `main`. Users get it with `/plugin update ai-lead@ai-team`.
