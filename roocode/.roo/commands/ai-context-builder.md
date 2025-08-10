---
description: Perform context engineering and create a {feature|bugfix}-context.md file based on actual code exploration, not assumptions.
argument-hint: <file-name>
---

Build a minimal AI context by creating/updating context.md file. DO NOT EDIT THE CODE IN REPO:
- Only include files you've actually explored in the codebase
- No guesswork - only list files that exist and are relevant
- Ask clarifying questions when unclear.
- Stop after context.md is ready.
- Rewrite request as first-person intent ("I want to …").
- List relative file paths by priority (high/medium/low).
- Summarize clear, testable requirements.

# When to use

Run before implementation to prepare a concise context file based on actual code exploration, not assumptions. Use for:
- Bug fixes
- Feature enhancements
- Adding new features
- Code refactoring

# Inputs

Optional:
- prompt: free-form task/goal
- topic: optional narrower focus


Examples:
- / ai-context-builder "add mobile recorder stop button"
- / ai-context-builder "fix login redirect bug"
- / ai-context-builder "refactor recorder store for testability" recorder
- / ai-context-builder "implement dark mode toggle"
- / ai-context-builder "enhance user profile page"
- / ai-context-builder

# Output

Markdown with three sections: User Intent,Implementation Requirements, Relevant Files and Code Structure.
Only relative paths; no file contents unless explicitly requested.

# Output Format (schema)

```markdown
I want to <concise-first-person-intent>…

# Implementation Requirements
- Clear, actionable requirements (not necessarily testable specs)
- Focus on what needs to be implemented, not how to test it

# Relevant Files and Code Structure / All Relevant Files (Clickable)

For easy navigation in VS Code, here are all relevant files:

[high-priority]
- [high](critical-file-path-1)
- [high](critical-file-path-2)
[/high-priority]

[med-priority]
- [med](supporting-file-path-1)
- [med](supporting-file-path-2)
[/med-priority]

[low-priority]
- [low](context-file-path-1)
- [low](context-file-path-2)
[/low-priority]

# All Relevant Files (Plain Paths)

For copying or referencing, here are all relevant file paths:

critical-file-path-1
critical-file-path-2
supporting-file-path-1
supporting-file-path-2
context-file-path-1
context-file-path-2

```

# Priority Definitions

- High: Directly implements core functionality or blocks task completion
- Medium: Supports, configures, or is closely related to the main task
- Low: Background, context, or rarely referenced files

# Rules

- "User Intent" must start with "I want to …"
- Use relative paths only (no absolute paths)
- Include exactly three priority groups: [high-priority], [medium-priority], [low-priority]
- No file contents unless explicitly requested
- Keep descriptions concise, precise, and actionable
- NO GUESSWORK: Only include files you've actually explored in the codebase
- If the user request contains any snippets filepaths, mentions, logs, information which should be added as is, please add it as is

# Execution Steps

1) Parse prompt/topic → infer intent.
2) Explore relevant codebase files to identify actual dependencies
3) Write one clear "I want to …" sentence.
4) List only files you've actually explored (relative paths).
5) Write clear requirements based on code exploration.
6) Review for completeness and accuracy - NO GUESSWORK.