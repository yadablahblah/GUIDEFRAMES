# Version Control (universal)

Loaded for every project. Instructions to the AI.

## Default

Use Git unless the project specifies otherwise.

## Initial setup (before any code)

Set up local version control before writing code or the project outline:

- Walk the user through `git init` in the project directory, explaining each
  command in plain language and confirming before running it.
- **Set the commit identity** (if not already set): `git config user.name` and
  `git config user.email`. Recommend the GitHub no-reply email
  (`<id>+<username>@users.noreply.github.com`, from GitHub → Settings → Emails)
  to keep the real email private while still linking commits to the profile.
  Use local (per-repo) config, not `--global`, unless the user wants it
  everywhere.
- Create a `.gitignore` appropriate to the target (build output, secrets,
  `FRAMEWORKS/` if it is temporary, OS/editor files).
- Make an initial commit of the baseline (guides + `.gitignore` + any scaffold).
- Do not create a remote or push unless the user asks.
- This baseline makes every later increment recoverable from the first change.

## Working practice

- Inspect the repository before making changes.
- Preserve existing user modifications.
- Use logical, descriptive commit messages.
- Review staged changes before committing.
- Create checkpoints before substantial or risky changes.
- Keep unrelated changes separate.
- Avoid committing secrets, generated files, or unnecessary artifacts.
- Report relevant commits and uncommitted changes at the end of work.

## Checkpoints

Use checkpoints to make substantial changes recoverable. Before any rollback:

1. Identify the changes to reverse.
2. Check the current repository state.
3. Protect unrelated and uncommitted user work.
4. Consider effects on dependencies, databases, external systems.
5. Explain the recovery method.

## Prohibited without explicit authorisation

- Force-push, rewriting shared history, discarding user changes.
- Pushing to a remote the user has not already authorised.
- Committing secrets.

## Commit discipline

- Commit only when the user explicitly asks.
- Stage only intended files — never `git add .` blindly.
- Write a concise message matching the repo style.
- If a commit fails or hooks reject it, fix the issue and create a new commit;
  do not amend the failed commit.

## Frequent local commits (with confirmation)

Pair with incremental delivery (see `agent-conduct.md`): commit after each
verified increment so progress is recoverable, but **only after the user
confirms** the step is good.

- After a change builds and passes its tests, briefly report what was done and
  ask the user to confirm before committing.
- On confirmation, make a local commit for that increment with a descriptive
  message.
- Do not commit unconfirmed work — the user may want changes first.
- Do not push to a remote unless the user has authorised that remote and workflow.
- Frequent small commits make rollback trivial: each increment is a restore point.
- If the user wants to batch several increments into one commit, follow their
  preference — the goal is recoverability, not commit count.

## New projects from a template

A new project gets its own independent Git repository and history. Never reuse
or inherit a template's `.git` directory or remote.