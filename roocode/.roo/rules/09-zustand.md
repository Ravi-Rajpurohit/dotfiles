# Zustand State Management - AI Instruction

NEVER use object destructuring in Zustand selectors. Instead, use independent selectors:

```typescript
// BAD - causes unnecessary re-renders
const { token, tenantId, userId } = useDashboardContext((s) => s);

// GOOD - only re-renders when specific values change
const token = useDashboardContext((s) => s.token);
const tenantId = useDashboardContext((s) => s.tenantId);
const userId = useDashboardContext((s) => s.userId);
```

Benefits: Optimal re-renders, better debugging, improved performance.

When editing code, if you find the bad practice pattern, refactor it to use the best practice.