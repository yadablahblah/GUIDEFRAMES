# Python

Loaded when the target is a script, CLI, daemon, or backend and the AI chooses
Python. Instructions to the AI.

## Stack

- **Runtime**: Python 3.11+.
- **Packaging**: `pyproject.toml` (PEP 621); `uv` or `pip`.
- **CLI**: `argparse` (stdlib) or `typer`/`click`.
- **Testing**: `pytest`.

## Layout

```
src/<package>/
├── __init__.py
├── cli.py           # entry point
├── core/            # business logic
└── ...
tests/
pyproject.toml
```

## Rules

- Type hints on public functions; run `mypy` if configured.
- Use `pathlib.Path` for filesystem work, not string concatenation.
- Validate inputs at boundaries; raise specific exceptions, not bare `except`.
- Never log secrets; read config from env vars or a protected `.env`.
- Prefer stdlib; add a dependency only when clearly justified.

## Quality gates

```
python -m pytest
ruff check .          # or flake8
mypy src/             # if type checking is configured
```

All must pass before reporting completion (see `universal/testing.md`).

## Packaging

- CLI: publish to PyPI or ship as a `zipapp`/container.
- Daemon: systemd unit (Linux) — see `packaging/linux-appimage.md` notes on
  service files if relevant.