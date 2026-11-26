# VHS Tape: F-sync Framework Walkthrough
# Render: vhs walkthrough.tape  (produces walkthrough.gif)
# Requires: vhs (go install github.com/charmbracelet/vhs@latest)

Output walkthrough.gif
Set FontSize 16
Set Width 1200
Set Height 800
Set Theme "Dracula"
Set TypingSpeed 40ms

# --- Step 1: The novice's prompt ---
Type "I want to build: a tool that copies my photos to a backup drive"
Enter
Type "It should run on: Linux"
Enter
Type "Detail: I want to see what will be copied before it happens"
Enter
Sleep 1s

# --- Step 2: AI classifies and selects guides ---
Type "# AI: Project type = desktop file-sync utility, target = Linux"
Sleep 500ms
Type "# AI selects guides:"
Enter
Type "universal/agent-conduct.md"
Enter
Type "universal/architecture.md"
Enter
Type "universal/project-outline.md"
Enter
Type "universal/testing.md"
Enter
Type "universal/security.md"
Enter
Type "universal/version-control.md"
Enter
Type "universal/documentation.md"
Enter
Type "universal/ux.md"
Enter
Type "languages/rust-desktop.md"
Enter
Type "packaging/linux-appimage.md"
Enter
Sleep 1s

# --- Step 3: Novice copies files into FRAMEWORKS/ ---
Type "mkdir -p FRAMEWORKS/universal FRAMEWORKS/languages FRAMEWORKS/packaging"
Enter
Type "# (novice copies the named files into FRAMEWORKS/)"
Sleep 500ms
Type "tree FRAMEWORKS/"
Enter
Sleep 1s

# --- Step 4: AI reads guides, sets up git ---
Type "# AI reads the guides..."
Sleep 1s
Type "git init"
Enter
Sleep 500ms
Type "echo 'target/' > .gitignore"
Enter
Type "echo 'FRAMEWORKS/' >> .gitignore"
Enter
Type "git add .gitignore FRAMEWORKS/"
Enter
Type "git commit -m 'Initial baseline: framework guides'"
Enter
Sleep 1s

# --- Step 5: AI presents the project outline ---
Type "# AI presents outline for approval:"
Enter
Type "  What it will do: copy new/changed photos to backup drive"
Enter
Type "  What it won't do: delete from backup, two-way sync, cloud"
Enter
Type "  Tech: Rust + GTK4 (native dialogs, AppImage)"
Enter
Type "  Tests: engine unit tests + one end-to-end copy test"
Enter
Type "  Packaging: Linux AppImage"
Enter
Type "  Default: conflict handling = skip (changeable)"
Enter
Type "  Approve? (yes / tell me what to change)"
Sleep 2s

# --- Step 6: Build incrementally, commit after confirmation ---
Type "yes"
Enter
Sleep 500ms
Type "# AI: building engine core (no UI deps)..."
Sleep 1s
Type "cargo test"
Enter
Sleep 2s
Type "git add src/engine/ && git commit -m 'Add sync engine core with preview'"
Enter
Sleep 1s
Type "# AI: building UI (one panel at a time)..."
Sleep 1s
Type "cargo build --release"
Enter
Sleep 2s
Type "git add src/ui/ && git commit -m 'Add two-pane UI with status dots'"
Enter
Sleep 1s

# --- Step 7: Final state ---
Type "# Done. App builds, tests pass, each step committed."
Sleep 500ms
Type "git log --oneline"
Enter
Sleep 2s