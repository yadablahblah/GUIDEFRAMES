# Walkthrough Shot List & Narration

Use this alongside `walkthrough.tape` (the VHS terminal render) to produce a
full walkthrough video. The tape covers the terminal-side steps; this doc covers
the chat-side steps and the narration to record over each shot.

## How to produce

1. Render the terminal portion: `vhs walkthrough.tape` → `walkthrough.gif`.
2. Capture the chat-side screenshots (steps 1–2, 5 below) with Flameshot/GNOME
   Screenshot.
3. Assemble in Kdenlive/Shotcut: alternate chat screenshots and the terminal
   GIF, with the narration below as voiceover (or on-screen captions).
4. Export as MP4 (1080p, 30fps).

## Shots & narration

### Shot 1 — The novice's prompt (screenshot of chat)
**Narration:** "You start with one plain-language prompt. What you want to
build, what system it runs on, and any detail that matters. No technical terms
needed."

### Shot 2 — AI classifies and selects guides (screenshot of chat)
**Narration:** "The AI works out the project type, then picks the guides it
needs from the library. You never choose the language or framework — the AI
does, and records the choice in the outline."

### Shot 3 — Novice copies files into FRAMEWORKS/ (terminal — VHS tape)
**Narration:** "You copy the named files into a FRAMEWORKS folder. This is the
only technical action you take. The folder is temporary — delete it when the
project is done."

### Shot 4 — AI reads guides, sets up git (terminal — VHS tape)
**Narration:** "The AI reads the guides, then walks you through git init and an
initial commit. This gives the project a baseline so every later change is
recoverable. No remote is created unless you ask."

### Shot 5 — AI presents the project outline (screenshot of chat)
**Narration:** "Now informed by the guides, the AI presents a plain-language
outline: what it will do, what it won't, the tech it picked, the test plan, and
any defaults you might want to change. Nothing is coded until you approve."

### Shot 6 — Build incrementally, commit after confirmation (terminal — VHS tape)
**Narration:** "You approve, and the AI builds in small steps — one component
at a time, each verified and committed after you confirm it's good. You see the
project take shape and can steer at every step."

### Shot 7 — Final state (terminal — VHS tape)
**Narration:** "The app builds, tests pass, and each step is a committed restore
point. If anything goes wrong, you roll back to the last good commit."

## Notes

- Keep total runtime 2–3 minutes.
- The VHS tape produces the terminal shots; record narration separately and
  sync in the editor.
- Update screenshots if the flow changes; the tape is re-runnable for the
  terminal portion.