# Release & Distribution (universal)

Loaded for every project that will be distributed or deployed. Instructions to
the AI.

## Versioning

- Use semantic versioning (MAJOR.MINOR.PATCH) pre-1.0; 0.x for unstable.
- Bump MAJOR for breaking changes, MINOR for features, PATCH for fixes.
- Tag releases in git (`v1.2.3`); keep a `CHANGELOG.md` of user-facing changes.
- App data/schema migrations: version them and provide an upgrade path; never
  break existing user data on update.

## License & open source

- The project must have a license. If the user has not chosen one, recommend a
  permissive default (MIT/Apache-2.0) and record the choice in the outline.
- Do not publish a public repo or package without explicit user approval.
- Respect third-party license compatibility when bundling dependencies.

## Privacy & user data

- Collect the minimum user data necessary; state what is collected and why.
- Do not log or transmit PII without a clear purpose and user awareness.
- Provide a way to clear/delete user data where feasible.
- Disclose any telemetry; default to none unless the user opts in.
- Treat GDPR-style concerns (consent, retention, right-to-delete) as relevant
  for any app handling personal data.

## Paid / external services

- Do not introduce a paid or metered external service without explicit approval
  (cost implications).
- Prefer free/self-hosted alternatives where they meet the requirement.

## Release approval gates

Explicit user approval is required before:

- Deploying to production.
- Publishing or distributing a release.
- Exposing a service to the public internet.
- Opening firewall ports / changing network exposure.
- Changing production DNS or infrastructure.
- Running destructive production migrations.
- Creating public repositories or publishing packages.

Do not treat silence as approval. A successful local build does not authorise
deployment.

## Production release gate

Before proposing a production release, verify and report:

- Required tests, quality checks, and release builds passed in CI.
- The deployed artifact matches the reviewed source and has been smoke-tested
  in an environment representative of production.
- High or critical security findings are fixed or explicitly assessed and
  resolved before release; do not silently waive them.
- Configuration, monitoring, alert ownership, backup/restore, and rollback
  procedures are ready for this release.
- Any database or data migration has a tested upgrade and recovery plan.

If a required item is incomplete, report the release as blocked and identify
what remains. Only the user may authorize deployment, and approval does not
turn a failed or unverified check into a pass.

## Release artefacts

- Produce the build artefact(s) for the target (AppImage, installer, container,
  static bundle) plus a SHA256 checksum.
- Write release notes: what changed, known issues.
- Publish to GitHub Releases (or the relevant channel) with the artefact +
  checksum + notes.
- Verify the artefact in a clean environment after release where possible.

## Rollback

- Document the rollback procedure before the first release (redeploy previous
  artefact / image tag / version).
- Version control does not replace data backups (see `operations.md`).