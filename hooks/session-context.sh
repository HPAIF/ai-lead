#!/bin/bash
# AI Lead — SessionStart hook.
# Prints the team-wide picture: installed members, board items waiting on the founder,
# every member's overdue / next-7-days obligations, and files in the company-wide inbox.
# Silent when no ai-team/lead workspace exists in the project folder or a parent folder.
set -u
dir="${CLAUDE_PROJECT_DIR:-$PWD}"
WS=""
while [ -n "$dir" ] && [ "$dir" != "/" ]; do
  if [ -d "$dir/ai-team/lead" ]; then WS="$dir/ai-team"; break; fi
  dir=$(dirname "$dir")
done
[ -n "$WS" ] || exit 0

version=$(grep -m1 '"version"' "${CLAUDE_PLUGIN_ROOT:-.}/.claude-plugin/plugin.json" 2>/dev/null | sed 's/.*"version": *"\([^"]*\)".*/\1/')
today=$(date +%F)
week=$(date -v+7d +%F 2>/dev/null || date -d '+7 days' +%F)

echo "=== AI TEAM LEAD ${version:+v$version }— team context (${today}) ==="
echo "Rules: ${CLAUDE_PLUGIN_ROOT:-<plugin>}/RULES.md (agent ai-lead:lead). Route requests to members (ask-team), keep the board, never act for the founder."
echo "Workspace: $WS  (every ai-team/... path in the rules and skills means this folder)"

members=$(awk -F'|' '/^\| [a-z]+ +\| ai-/ {gsub(/ /,"",$2); printf "%s ", $2}' "$WS/team.md" 2>/dev/null)
echo "Team: ${members:-(none registered)}"
echo

echo "--- Board ---"
if [ -f "$WS/lead/board.md" ]; then
  awk -F'|' '/^\| R-/ {s=$6; gsub(/^ +| +$/,"",s); c[s]++; if (s=="waiting on founder") { r=$4; gsub(/^ +| +$/,"",r); id=$2; gsub(/ /,"",id); w = w "  " id " " r "\n" } }
    END { printf "open %d · with members %d · waiting on founder %d · done %d\n", c["open"], c["with members"], c["waiting on founder"], c["done"]; if (w!="") printf "Waiting on you:\n%s", w }' "$WS/lead/board.md"
fi
echo

echo "--- Team obligations: overdue or due by ${week} ---"
found=0
for f in "$WS"/*/history/obligations.md; do
  [ -e "$f" ] || continue
  m=$(basename "$(dirname "$(dirname "$f")")")
  out=$(awk -F'|' -v today="$today" -v week="$week" -v m="$m" '
    /^\| O-/ {
      id=$2; due=$3; what=$5; status=$7
      gsub(/^ +| +$/, "", id); gsub(/^ +| +$/, "", due); gsub(/^ +| +$/, "", what); gsub(/^ +| +$/, "", status)
      if (status == "open" && due ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/ && due <= week) {
        flag = (due < today) ? "OVERDUE " : ""
        printf "%s%s:%s  %s  %s\n", flag, m, id, due, substr(what, 1, 110)
      }
    }' "$f")
  [ -n "$out" ] && { echo "$out"; found=1; }
done
[ $found -eq 0 ] && echo "(none)"
echo

inbox=$(find "$WS/lead/inbox" -type f ! -name 'README.md' ! -name '.*' 2>/dev/null | wc -l | tr -d ' ')
pending=$(cat "$WS"/*/learnings.md 2>/dev/null | grep -c '^| L-[0-9]* .*| general .*| pending' || true)
echo "Company inbox: ${inbox:-0} file(s)$( [ "${inbox:-0}" -gt 0 ] && echo ' → offer triage-inbox') · Pending general learnings (all members): ${pending:-0}"
exit 0
