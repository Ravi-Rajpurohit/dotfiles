# Logging

## Logger Usage

- Always use `lib/zod/logger.ts` for logging
- Always create a logger tag and use it whenever there is a need to log things
- If there's no tag, add it
- If there are console logs, convert them to use logger with tags
- If a logger tag is used in multiple places within a file, create it at the top of the file
- If a logger tag is used across multiple files, define it at the top of a main file and export it for reuse

```typescript
import { logger } from '@/lib/zod/logger';

// Basic usage with tag
const authLogger = logger.tag('Authentication');
authLogger.debug('Login attempt', { username: 'test' });

// Convert console.log to logger
console.log('User logged in'); // BAD
authLogger.info('User logged in'); // GOOD

// Convert console.error to logger
console.error('Login failed'); // BAD
authLogger.error('Login failed', { error }); // GOOD

// Convert console.warn to logger
console.warn('Rate limit approaching'); // BAD
authLogger.warn('Rate limit approaching'); // GOOD
```

When editing code, if you find console logs, refactor them to use the appropriate logger method with a descriptive tag.