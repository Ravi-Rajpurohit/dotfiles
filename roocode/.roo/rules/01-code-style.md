## Code Style and Structure

- Write concise, technical TypeScript code with accurate examples.
- Use functional and declarative programming patterns; avoid classes.
- Prefer iteration and modularization over code duplication.
- Use descriptive variable names with auxiliary verbs (e.g., isLoading, hasError).
- Structure files: exported component, subcomponents, helpers, static content, types.
- When adding or updating code, add imports simultaneously with or after the code they reference. Keep imports at the top of the file grouped with other imports to prevent format-on-save from removing them prematurely.

## Monorepo Management

- Follow best practices using Turbo for monorepo setups.
- Ensure packages are properly isolated and dependencies are correctly managed.
- Use shared configurations and scripts where appropriate.
- Utilize the workspace structure as defined in the root `package.json`.
- Keep all feature implementation details co-located
- Use kebab-case for feature folder names (e.g. `navigator-calls`)
- Export directly from files using `export const` or `export {}` syntax

## Naming Conventions

- Use lowercase with dashes for directories (e.g., components/auth-wizard).
- File names must use kebab-case (e.g., my-component.tsx).
- Favor named exports for components.
