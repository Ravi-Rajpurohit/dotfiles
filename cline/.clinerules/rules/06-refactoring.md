## Refactor Policy

- When refactoring, prioritize maintaining the original functionality and avoiding unintended side effects.
- Before making any changes, carefully analyze the code to understand its purpose and dependencies.
- If unsure about the impact of a change, add a `TODO` comment explaining the potential issue and the reasoning behind the change.
- Always comment out (not delete) the old logic for easy rollback and regression testing. Delete only when explicitly asked.
- When refactoring, avoid adding unnecessary dependencies (e.g., `useEffect` dependencies) that were not present in the original code. Adding such dependencies might cause rendering issues. If you believe a dependency is necessary, add a `TODO` comment explaining why and add that dependency by commenting it out.
- When refactoring, avoid using `useCallback` unnecessarily. If you believe `useCallback` is necessary, add a `TODO` comment explaining why.
- **Callbacks in `useEffect`:** Avoid adding callback functions received via props (like `onStatusChange`, `onClick`) to `useEffect` dependency arrays unless they are guaranteed to be stable (e.g., wrapped in `useCallback` by the parent component) AND the effect *truly* needs to re-run when the callback identity changes. If unsure, omit the callback from the dependencies.
