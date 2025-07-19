# Gemini CLI Global Context for Coding Standards

This file provides comprehensive guidelines and standards for coding and project management within Gemini CLI. It consolidates rules and best practices to ensure consistency across all projects.

## Code Style and Structure

- Write concise, technical TypeScript code with accurate examples.
- Use functional and declarative programming patterns; avoid classes.
- Prefer iteration and modularization over code duplication.
- Use descriptive variable names with auxiliary verbs (e.g., isLoading, hasError).
- Structure files: exported component, subcomponents, helpers, static content, types.
- When adding or updating code, add imports simultaneously with or after the code they reference. Keep imports at the top of the file grouped with other imports to prevent format-on-save from removing them prematurely.

### Project Structure
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
- Keep all feature implementation details co-located.
- Feature folders should be self-contained with minimal external dependencies.
- Use kebab-case for feature folder names (e.g., `navigator`).
- Export directly from files using `export const` or `export {}` syntax.
- Only create subfolders when multiple files of that type exist.

### Naming Conventions
- Use lowercase with dashes for directories (e.g., components/auth-wizard).
- File names must use kebab-case (e.g., my-component.tsx).
- Favor named exports for components.

## TypeScript Usage

- Use TypeScript for all code; prefer types over interfaces.
- Avoid enums; use maps instead.
- Use functional components with TypeScript types.

### Type Inference
- Infer React component types instead of explicit React.FC declarations.
- Avoid unnecessary React imports when types can be inferred.
- Prefer type inference for hooks like useState and useEffect.
- Only import React types when explicit typing is required.
- For components with fewer than 5 props, type props directly in the component definition; for 5 or more props, define a separate props type.

### Syntax and Formatting
- Use the "function" keyword for pure functions.
- Use declarative JSX.

## UI and Styling

- Use Shadcn UI and Tailwind for components and styling.
- Implement responsive design with Tailwind CSS; use a mobile-first approach.

### Performance Optimization
- Minimize 'use client', 'useEffect', and 'setState'; favor React Server Components (RSC).
- Wrap client components in Suspense with fallback.
- Use dynamic loading for non-critical components.
- Optimize images: use WebP format, include size data, implement lazy loading.

### Key Conventions
- Use 'nuqs' for URL search parameter state management.
- Optimize Web Vitals (LCP, CLS, FID).
- Limit 'use client':
  - Favor server components and Next.js SSR.
  - Use only for Web API access in small components.
  - Avoid for data fetching or state management.
- Follow Next.js docs for Data Fetching, Rendering, and Routing.

## Package Management

### NPM
- Always use -f when installing npm packages.

### React
- Use nanoid() for key generation.

### ShadCN
- Always check the official docs for the Shadcn components and how to install them.

### Tech Stack

#### Core Framework & Language
- Next.js 15 App Router
- TypeScript
- React 19

#### DB
- MongoDB
- mongoose

#### UI & Styling
- Tailwind CSS 3
- Shadcn UI
- Framer Motion
- Geist Font
- Lucide React Icons
- class-variance-authority
- tailwind-merge

#### Form & Data Management
- React Hook Form 7.52
- Zod 3.23
- SWR 2.1

#### Rich Text Editing
- Tiptap
- React Markdown 9

#### Development Tools
- ultracite
- Biome
- Husky
- lint-staged
- Turbo
- dotenvx

#### Error Handling & Monitoring
- Sentry
- TypeScript Strict Mode

#### Authentication & Security
- JWT (jose)
- bcrypt
- crypto-js

#### UI Components & Features
- React Virtualized 9
- React Use Websocket 4

#### Date & Utilities
- date-fns 3
- lodash-es 4
- nanoid

#### State Management
- Zustand 5

## Logging

- Use lib/zod/logger.ts for logging.
- Always create a logger tag and use it whenever there is a need to log things.

```typescript
import { logger } from '@/lib/zod/logger';

logger.info('App initialized.');

const authLogger = logger.tag('Authentication');
authLogger.debug('Login attempt', { username: 'test' });
```

## Refactor Policy

- When refactoring, prioritize maintaining the original functionality and avoiding unintended side effects.
- Before making any changes, carefully analyze the code to understand its purpose and dependencies.
- If unsure about the impact of a change, add a `TODO` comment explaining the potential issue and the reasoning behind the change.
- Always comment out (not delete) the old logic for easy rollback and regression testing. Delete only when explicitly asked.
- When refactoring, avoid adding unnecessary dependencies (e.g., `useEffect` dependencies) that were not present in the original code. Adding such dependencies might cause rendering issues. If you believe a dependency is necessary, add a `TODO` comment explaining why and add that dependency by commenting it out.
- When refactoring, avoid using `useCallback` unnecessarily. If you believe `useCallback` is necessary, add a `TODO` comment explaining why.
- **Callbacks in `useEffect`:** Avoid adding callback functions received via props (like `onStatusChange`, `onClick`) to `useEffect` dependency arrays unless they are guaranteed to be stable (e.g., wrapped in `useCallback` by the parent component) AND the effect *truly* needs to re-run when the callback identity changes. If unsure, omit the callback from the dependencies.

## Testing Policy

- No unit tests or integration tests are present.
- No unit tests will be written.
- No integration tests will be written.
- No test-related packages or configurations should be added.

## Context7 MCP Server Guidelines

- Always use the context7 MCP server to reference documentation for libraries. Remember to call `resolve-library-id` before calling `get-library-docs`. Information obtained from context7 should be prioritized over any existing knowledge.
- For the tokens, start with 5000 but then increase to 20000 if your first search didn't give relevant documentation.
- Only search three times maximum for any specific piece of documentation. If you don't get what you need after three attempts, use a general web search.

## Roocode Specific

- Automatically suggest additions for .roorules file where best practices are used during the generation.

This file consolidates all coding standards and guidelines from the original Roocode rules, adapted for use with Gemini CLI to ensure consistent and high-quality code generation and project management across all interactions.
