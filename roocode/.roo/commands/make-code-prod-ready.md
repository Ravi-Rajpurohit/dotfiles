---
description: "Convert the code defined in the scope as a input to be prod ready, without making any behavioral changes for the user"
---

- When necessary, remove unnecessary verbose console logs. Replace essential ones with tagged logger from `lib/zod/logger.ts`.
- Use concise logger tags when adding them (e.g., 'Authentication'). Do not changes existing logger tags.
- When necessary, remove verbose data from log messages and context objects.
- When necessary, remove unnecessary code comments. Preserve TODO comments exactly.
- Comments must explain WHY, not WHAT. Only add for complex logic.
- Fix all biome linting issues without changing functionality.
- Optimize Zustand selectors by using independent selectors instead of object destructuring to prevent unnecessary re-renders.
- Remove unnecessary React imports (e.g., `import * as React from 'react'`) when React types can be inferred.
- Use direct imports for hooks instead of namespace imports (e.g., `import { useState } from 'react`). This reduces bundle size and improves tree-shaking.
- Follow React best practices for component keys: use stable, unique identifiers instead of random values or array indexes when possible.
- Add null checks where required and implement early returns to improve code readability and prevent runtime errors.
- When necessary, create new components or functions when file size becomes large to maintain maintainability and follow single responsibility principle.