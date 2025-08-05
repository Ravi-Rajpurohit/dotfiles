## TypeScript Usage

- Use TypeScript for all code; prefer types over interfaces.
- Avoid enums; use JavaScript objects or TypeScript unions instead.
- Use functional components with TypeScript types.

### Type Inference
- Infer React component types instead of explicit React.FC declarations
- Avoid unnecessary React imports when types can be inferred
- Prefer type inference for hooks like useState and useEffect
- Only import React types when explicit typing is required
- For components with fewer than 5 props, type props directly in the component definition; for 5 or more props, define a separate props type

## Syntax and Formatting

- Use the "function" keyword for pure functions.
- Use declarative JSX.
