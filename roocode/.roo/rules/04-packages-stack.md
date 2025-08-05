## Package Management

### NPM

- Always use -f when installing npm packages

### React Key Generation

- Keys must be unique among siblings and stable across renders
- Never generate keys during render (e.g. Math.random(), nanoid())
  - Bad: `<li key={Math.random()}>` 
  - Bad: `<li key={nanoid()}>` 
- Preferred sources:
  - Database IDs for persisted data
    - Good: `<li key={user.id}>` 
  - Pre-generated IDs (crypto.randomUUID() or nanoid()) created once and stored
    - Good: `const id = crypto.randomUUID(); items.push({id, name})`
    - Good: `<li key={item.id}>`
- Use array indexes only when:
  - List order/length is static
  - No IDs available AND list won't reorder
    - OK: `{['Home', 'About', 'Contact'].map((page, i) => <li key={i}>)}`
- For dynamic lists without IDs, generate and store IDs when data is created, not during render
  - Good: `const addItem = (name) => setItems([...items, {id: nanoid(), name}])`

### ShadCN

- always check the official docs for the shadcn components and how to install them.

## Tech Stack

### Core Framework & Language (Last verified: 2025-07-19)
- Next.js 15 App Router (v15.1.3)
- TypeScript (v5.4.2)
- React 19 (v19.2.0)

### Database
- MongoDB (v7.0)
- mongoose (v8.2.1)

### UI & Styling
- Tailwind CSS 3 (v3.4.1)
- Shadcn UI (v0.8.0)
- Framer Motion (v10.18.0)
- Lucide React Icons (v0.314.0)
- class-variance-authority (v0.7.0)
- tailwind-merge (v2.2.0)

### Form & State Management
- React Hook Form 7.52 (v7.52.1)
- Zod 3.23 (v3.23.0)
- Zustand 5 (v5.1.0)
- nuqs (v1.12.0)

### Data Fetching
- SWR 2.1 (v2.1.5)

### Development Tooling
- Turborepo (v2.15.1)
- Biome (v1.7.3)
- Husky (v9.0.11)
- lint-staged (v15.2.2)
- dotenvx (v0.25.0)

### Error Handling
- Sentry (v7.108.0)
- TypeScript Strict Mode

### Authentication
- JWT (jose v5.2.4)
- bcrypt (v5.1.1)
- crypto-js (v4.2.0)

### Utilities
- date-fns 3 (v3.3.1)
- lodash-es (v4.17.21)
- nanoid (v5.0.5)
