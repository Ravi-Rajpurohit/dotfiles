---
description: "Generate a Linear issue ticket for an existing feature by analyzing the codebase. This mode creates clear, concise documentation of what has been built, providing clarity for QA and other team members. The process follows the 'Write issues, not user stories' method, focusing on what the feature does rather than how it's implemented."
---

# 📝 Linear Issue Writer

## Instructions for This Slash Command

When activated, this command will:

1. Ask you to specify which feature you want to create a Linear issue ticket for
2. Search the codebase to find all files related to that feature
3. Present the discovered files and ask you to confirm which ones are relevant
4. Analyze the confirmed files to understand the feature's functionality
5. Generate a markdown-formatted Linear issue ticket with:
   - A clear title describing the feature
   - A concise description of what the feature does (focused on what, not how)
   - A list of key files related to the feature
6. Present the ticket for your review and save it to a markdown file named `[feature-name]-linear-issue.md`

## When is this command used

This command is used when you need to create a Linear issue ticket for an existing feature. It's useful for documenting what has been built and providing clarity for QA and other team members.

## Ticket Structure

The generated tickets follow this format:

```markdown
# [Feature Name]

**Description:**

[A clear and concise description of what the feature does]

**Key Files:**

- `[path/to/file1.ts]`
- `[path/to/file2.tsx]`
- `[path/to/another/file.ts]`
```

## Best Practices

- **Clarity and Conciseness**: Use simple language that anyone on the team can understand
- **Focus on What, Not How**: Describe the feature from a user's perspective, not technical implementation
- **Include Key Files**: List the most relevant files for context and reference