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

### Core Framework & Language

- Next.js 15 App Router
- TypeScript
- React 19

### DB

- MongoDB
- mongoose

### UI & Styling

- Tailwind CSS 3
- Shadcn UI
- Framer Motion
- Geist Font
- Lucide React Icons
- class-variance-authority
- tailwind-merge

### Form & Data Management

- React Hook Form 7.52
- Zod 3.23
- SWR 2.1

### Rich Text Editing

- Tiptap
- React Markdown 9

### Development Tools

- ultracite
- Biome
- Husky
- lint-staged
- Turbo
- dotenvx

### Error Handling & Monitoring

- Sentry
- TypeScript Strict Mode

### Authentication & Security

- JWT (jose)
- bcrypt
- crypto-js

### UI Components & Features

- React Virtualized 9
- React Use Websocket 4

### Date & Utilities

- date-fns 3
- lodash-es 4
- nanoid

### State Management

- Zustand 5
