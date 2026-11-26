# C# Desktop (.NET)

Loaded when the target is a Windows (or cross-platform) desktop app and the AI
chooses C#/.NET. Instructions to the AI.

## Stack

- **Runtime**: .NET 8+ (LTS).
- **UI**: WPF (Windows-only) or Avalonia (cross-platform). WinUI 3 for modern
  Windows-only.
- **Build**: `dotnet` CLI.
- **Testing**: xUnit or NUnit.

## Layout

```
src/<App>/
├── Program.cs
├── ViewModels/      # MVVM
├── Views/           # XAML
├── Models/
└── Services/
tests/<App>.Tests/
```

## Rules

- Follow MVVM; keep logic out of code-behind.
- Use `async`/`await` for IO; never `.Result`/`.Wait()` on the UI thread.
- Validate input at boundaries; use `ArgumentNullException` / custom exceptions.
- Store config under `%APPDATA%` (Windows) or `~/.config` (cross-platform).
- Never log secrets; use `Microsoft.Extensions.Configuration` with env vars.

## Quality gates

```
dotnet build
dotnet test
dotnet format --verify-no-changes
```

All must pass before reporting completion (see `universal/testing.md`).

## Packaging

See `packaging/windows.md` (or linux/macos for Avalonia).