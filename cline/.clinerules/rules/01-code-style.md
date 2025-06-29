## Code Style and Structure

- Write concise, technical TypeScript code with accurate examples.
- Use functional and declarative programming patterns; avoid classes.
- Prefer iteration and modularization over code duplication.
- Use descriptive variable names with auxiliary verbs (e.g., isLoading, hasError).
- Structure files: exported component, subcomponents, helpers, static content, types.
- When adding or updating code, add imports simultaneously with or after the code they reference. Keep imports at the top of the file grouped with other imports to prevent format-on-save from removing them prematurely.

## Project Structure
- Organize feature-related code in dedicated feature folders using this structure:
  ```
  features/
    feature-name/
      components/      # Only if multiple components exist
      hooks/           # Only if multiple hooks exist
      types/           # Only if multiple types exist
      utils/           # Only if multiple utilities exist
      services/        # Only if multiple services exist
  ```
- Keep all feature implementation details co-located
- Feature folders should be self-contained with minimal external dependencies
- Use kebab-case for feature folder names (e.g. `navigator`)
- Export directly from files using `export const` or `export {}` syntax
- Only create subfolders when multiple files of that type exist

## Naming Conventions

- Use lowercase with dashes for directories (e.g., components/auth-wizard).
- File names must use kebab-case (e.g., my-component.tsx).
- Favor named exports for components.
