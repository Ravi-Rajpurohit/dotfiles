## Logging

- use lib/zod/logger.ts for logging
- Always create a logger tag and use it whenever there is a need to log things.

```typescript
import { logger } from '@/lib/zod/logger';

logger.info('App initialized.');

const authLogger = logger.tag('Authentication');
authLogger.debug('Login attempt', { username: 'test' });
