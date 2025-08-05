---
description: Do context engineering and create a context.md file with updated prompt of what is asked with relative filepaths.
---

Build a minimal AI context by creating/updating context.md file. DO NOT EDIT THE CODE IN REPO:
- Ask clarifying questions when unclear.
- Stop after context.md is ready.
- Rewrite request as first-person intent (“I want …”).
- List relative file paths by priority (high/medium/low).
- Summarize clear, testable requirements.

# When to use

Run before implementation to prepare a concise context file.

# Inputs

Optional:
- prompt: free-form task/goal
- topic: optional narrower focus


Examples:
- / ai-context-builder "add mobile recorder stop button"
- / ai-context-builder "refactor recorder store for testability" recorder
- / ai-context-builder

# Output

Markdown with three sections: User Intent,Implementation Requirements, Relevant Files and Code Structure.
Only relative paths; no file contents unless explicitly requested.

# Output Format (schema)

```markdown
I want to <concise-first-person-intent>…

# Implementation Requirements
- <clear, testable spec 1>
- <clear, testable spec 2>

# Relevant Files and Code Structure
<files>
[high-priority]
- <critical-file-path-1>
[/high-priority]

[medium-priority]
- <supporting-file-path-1>
[/medium-priority]

[low-priority]
- <context-file-path-1>
[/low-priority]

[Optional file-content sections only if specifically requested]
</files>
```

# Priority Definitions

- High: directly implements or blocks the task
- Medium: supports or configures critical parts
- Low: helpful background/context

# Rules

- “User Intent” starts with “I want …”
- Use relative paths only
- Exactly three groups: [high-priority], [medium-priority], [low-priority]
- No file contents unless requested
- Keep concise, precise, actionable

# Execution Steps

1) Parse prompt/topic → infer intent.
2) Write one “I want …” sentence.
3) List files by priority (relative paths).
4) Write clear requirements.