# agent-team-bug-hunt

https://avasdream.com/blog/agent-team-bug-hunt

```txt
Use a team of subagents to audit this codebase for bugs. Cover state
management, networking, and streaming, plus any other risky areas you
find (persistence, concurrency, security). Spawn one agent per area so
they run in parallel.

Each agent must:
- read the real source for its area, not assume behavior
- for every suspected bug, check it against the code and drop anything
  it cannot confirm
- report only confirmed findings, each with a severity, the file and
  line range, what is wrong, why it matters, and a concrete trigger

Per area, produce one Markdown report and one HTML report built with the
/visual-explainer skill. Then write a main Markdown and HTML dashboard
that summarizes every area and links to each report.
```