# Data & Databases (universal)

Loaded when the project stores data beyond simple files. Instructions to the AI.

## When to use a database

Use a database when data needs: dynamic management, relationships, frequent
updates, user editing, or query flexibility. Do **not** add a database for
simple config or a handful of files — use flat files (JSON/YAML/TOML) instead.

## Choosing a store

- **SQLite**: single-user, local, embedded — default for desktop/mobile.
- **PostgreSQL**: multi-user, concurrent, relational — default for web services.
- **MySQL/MariaDB**: alternative relational server.
- **Document store (MongoDB, etc.)**: only when the data is genuinely
  document-shaped and relationships are minimal.
- **Key-value (Redis, etc.)**: caching, sessions, queues — not primary storage.

State the choice and reason in the project outline. Do not introduce a database
server without justification.

## Rules

- Always use parameterised queries / an ORM — never string-concatenate SQL.
- Validate and constrain data at the boundary; use schema constraints in the DB.
- Provide schema management / migrations (e.g. Alembic, Flyway, EF migrations,
  sqlx migrate). Never make destructive schema changes without a backup and
  recovery plan.
- Keep secrets (DB credentials) out of source; use env vars / a protected config.
- Handle connection failures gracefully; use timeouts and pooling.
- Back up and document recovery for any non-trivial store.

## Per-target notes

The matching `languages/*` doc names the idiomatic data layer (EF Core,
ActiveRecord, sqlx, Room, etc.). This doc stays universal.