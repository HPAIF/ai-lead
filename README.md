# AI Lead

The **team lead and single entry point** of the [AI Team](https://github.com/HPAIF/ai-team). You
bring every request here; the lead gets it done by the right specialists, brings back one answer,
and keeps track of everything.

- **Routes** each request to the installed members — lawyer, accountant, cto, devops, security,
  product, marketing, sales — visibly: it @mentions them in the group chat, never through hidden
  agent calls, and never starts a discussion among them without you.
- **Combines** their answers, keeps their caveats, and shows where they disagree and what you need
  to decide.
- **One board** of all requests (`ai-team/lead/board.md`), **one agenda** of every member's
  deadlines, **one inbox** for all your documents.
- Never acts for you: approvals, sending, signing, deploying stay with you.

## Install

```
/plugin marketplace add HPAIF/ai-team
/plugin install ai-lead@ai-team
```

Or install only this member, straight from its repository:

```
/plugin marketplace add HPAIF/ai-lead
/plugin install ai-lead@ai-lead
```

Then, in your company folder: **"set up the AI lead"**. Install the specialists you need the same
way (`/plugin install ai-lawyer@ai-team` …) and set each up — the lead only routes to members
listed in `ai-team/team.md`.

## Use it

Start your sessions with the lead as the main agent:

```bash
claude --agent ai-lead:lead
```

| You say | What happens (skill) |
|---|---|
| "Should we register as an LLC and which tax regime?" | asks lawyer + accountant, combines, lists your decision (`ask-team`) |
| "Review the contract in the inbox" | moves it to the lawyer (money terms → accountant), then asks them (`triage-inbox`, `ask-team`) |
| "What's open?" / "What are you waiting on me for?" | board report (`board`) |
| "What's due this week?" | every member's deadlines in one list (`agenda`) |
| "Who's on the team? What should I add?" | installed members, gaps, pending improvements (`team`) |

Each session in a company folder starts with the team picture: members, board items waiting on
you, urgent deadlines across members, files in the inbox.

## How it is built

```
RULES.md          routing table, hard rules (route don't replace, report faithfully, the founder decides…)
agents/lead.md    the entry-point agent
skills/           setup · ask-team · board · agenda · team · triage-inbox · log-job · improve
hooks/            team-wide session context
```

Workspace (private, in your company folder): `ai-team/lead/` — `board.md`, `learnings.md`,
`history/`, `digests/`, `inbox/`. See the
[workspace contract](https://github.com/HPAIF/ai-team/blob/main/docs/workspace.md).

## Privacy and self-improvement
Same as every member: the plugin is public, your workspace is private; the lead learns routing
lessons in `learnings.md` and proposes anonymised improvements with `improve`, only with your
approval of the exact text.

## Upgrading
`/plugin marketplace update ai-team`, then `/plugin update ai-lead@ai-team`, restart Claude Code.

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md). License: [MIT](LICENSE).
