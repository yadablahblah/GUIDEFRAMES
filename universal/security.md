# Security (universal)

Loaded for every project. Instructions to the AI.

## Principles

- Least privilege: the app gets only the access it needs.
- Secure defaults: deny by default, allow explicitly.
- Validate all untrusted input at the boundary.
- Protect credentials and sensitive data.
- Do not expose unnecessary services or data.

## Secrets

- **Never** hardcode or commit real credentials, API keys, passwords, private
  keys, or tokens.
- Treat `.env` files and other sensitive files as protected. Do not read,
  display, transmit, or modify their contents unless explicitly authorised and
  necessary.
- If a credential is exposed, report it and recommend revocation and rotation.
- Do not copy secrets into reports, docs, test fixtures, logs, or generated
  files.

## Application security

- Use appropriate authentication and authorisation.
- Consider common vulnerabilities (injection, path traversal, insecure
  deserialization, etc.) for the target platform.
- Avoid logging secrets or sensitive personal information.
- Review third-party dependencies and integrations for known issues.
- Never weaken existing security controls.

## File-system apps (common case)

- Validate source and destination paths; reject overlapping/nested paths where
  that would cause recursion or data loss.
- Do not silently substitute a location or treat an unavailable destination as
  empty — report the error.
- Use restrictive permissions on app-created config/state/log directories
  (e.g. `0700` on Unix) and files (`0600`).
- Prefer atomic writes (temp file + rename) so a failure never leaves a
  half-written file.

## Per-target notes

The AI loads `languages/*` and `packaging/*` for platform-specific security
concerns. This doc stays universal.