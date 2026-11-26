# C# Web (ASP.NET Core)

Loaded when the target is a web service and the AI chooses C#/.NET.
Instructions to the AI.

## Stack

- **Runtime**: .NET 8+ (LTS).
- **Web**: ASP.NET Core (minimal APIs or controllers).
- **Data**: EF Core with a parameterised provider (Npgsql, Sqlite, etc.).
- **Testing**: xUnit + `WebApplicationFactory` for integration.

## Layout

```
src/<Api>/
├── Program.cs
├── Endpoints/ or Controllers/
├── Data/            # DbContext, migrations
├── Models/
└── Services/
tests/<Api>.Tests/
```

## Rules

- Validate all input (query, body, headers); never trust client data.
- Use parameterised queries / EF Core (no string-concatenated SQL).
- Set security headers; serve HTTPS in production.
- Secrets in env vars / user-secrets, never in source.
- Use async all the way; no blocking calls on request threads.

## Quality gates

```
dotnet build
dotnet test
dotnet format --verify-no-changes
```

All must pass before reporting completion (see `universal/testing.md`).

## Packaging

See `packaging/web-deploy.md`.