# APIs & Integrations (universal)

Loaded when the project exposes or consumes an API. Instructions to the AI.

## Designing an API (when you expose one)

- Use a documented, versioned interface (REST + OpenAPI, or GraphQL).
- Validate all incoming data; never trust the client.
- Use appropriate authentication and authorisation (tokens, sessions, OAuth).
- Apply rate limits to prevent abuse.
- Return consistent error responses with useful (non-sensitive) messages.
- Set timeouts; handle unexpected client behaviour gracefully.
- Document every endpoint: purpose, input, output, errors.

## Consuming an API (when you call one)

- Never assume the external service is always available — handle failures,
  timeouts, and retries (with backoff) gracefully.
- Validate and sanitise responses before using them.
- Use timeouts on every request; avoid hanging the app.
- Avoid unnecessary repeated requests; cache where appropriate.
- Keep API keys/secrets out of source; use env vars / a secret store.
- Abstract the external service behind an interface so it is mockable in tests
  and swappable if it changes.

## Rules

- Do not couple core business logic directly to an external service where an
  abstraction improves resilience or testability.
- Log requests/responses at an appropriate level without exposing secrets or PII.
- Pin to stable API versions; handle deprecation.

## Per-target notes

The matching `languages/*` doc names the idiomatic HTTP client/server
(reqwest, Axum, HttpClient, fetch, etc.). This doc stays universal.