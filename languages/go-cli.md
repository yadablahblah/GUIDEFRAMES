# Go CLI / Service

Loaded when the target is a command-line tool or backend service and the AI
chooses Go. Instructions to the AI.

## Stack

- **Runtime**: Go 1.22+.
- **CLI**: `cobra` (or stdlib `flag` for simple tools).
- **HTTP**: stdlib `net/http` (or `chi`/`echo` if needed).
- **Testing**: stdlib `testing`.

## Layout

```
cmd/<app>/main.go
internal/
├── core/            # business logic
├── cli/             # command wiring
└── ...
```

## Rules

- Return errors, don't panic; wrap with `fmt.Errorf("...: %w", err)`.
- Validate input at boundaries.
- Use `context.Context` for cancellation/timeouts on all IO.
- No secrets in source; read from env.
- `go vet` clean; `gofmt` applied.

## Quality gates

```
go build ./...
go vet ./...
go test ./...
gofmt -l .          # must output nothing
```

All must pass before reporting completion (see `universal/testing.md`).

## Packaging

Single static binary per OS/arch; ship via GitHub Releases with checksums.