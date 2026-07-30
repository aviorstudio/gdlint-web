# gdlint web

The public site for [gdlint](https://github.com/aviorstudio/gdlint), the
project-local GDScript hygiene checker. One static Astro page: what the tool
checks, what it ships enabled, and where to install it from.

There is no authentication, no application state, no backend and no runtime
environment configuration. The page ships no JavaScript, which is why there are
no integrations in `astro.config.mjs` and why CI checks for a `<script src>` in
the build output.

## Commands

| Command | Action |
| --- | --- |
| `bun install` | Install dependencies |
| `bun dev` | Start the Astro development server |
| `bun run build` | Generate the static site in `dist/` |
| `bun preview` | Preview the static build |

## What is on the page, and where it came from

Nothing on the page is invented. Everything traceable to the `gdlint` repository
is listed here so it can be re-checked when the tool changes.

**The terminal frame** is a real run, not a mock-up. It is `gdlint -warn` against
[`gd-router`](https://github.com/aviorstudio/gd-router) with `ignore_patterns`
extended to skip `tests/` and `addon/src/nodes/`, and every rule enabled except
`comments`. The text is reproduced verbatim — including the `...` truncation at
60 characters, the two-space gap after `⚠️`, and the exit status — and the colours
are the ANSI codes `src/operations/display.go` emits, mapped one for one:

| gdlint | Site |
| --- | --- |
| red (`\033[31m`) | errors, error headings, `❌` summary line |
| yellow (`\033[33m`) | warning heading and counts |
| cyan (`\033[36m`) | `=== SUMMARY ===` |
| grey (`\033[90m`) | the `•` location lines |
| bold | `-fix` in the summary hint |

A screenshot would have been easier and worse: this stays selectable, scales
with the reader's font, and cannot go blurry on a display it was not captured
for.

**The rules table** is the whole rule set, with the `on`/`off` value taken from
`NewDefaultConfig` in `src/models/config.go`. Four rules ship on —
`print_statements`, `pass_statements`, `orphaned_uids`, `indentation` — and the
table says `off` for the other twelve as plainly as it says `on` for those. A
feature list that only named the enabled rules would misdescribe a fresh install.

**The `-fix` caveat** in that section is the README's own warning, kept rather
than softened: `-fix` deletes code and files that static analysis believes are
unused, and static analysis cannot see a `call()` built from a string.

**"Unused means nothing points at it"** describes what `src/core/file_references.go`
actually follows: `preload`, `load` and file-path `extends` in `.gd`, the
`ext_resource type="Script"` and `script = "res://…"` paths in `.tscn`, and the
`*res://….gd` autoload entries in `project.godot`.

## Colour

The accent is the Godot editor blue. `gdlint` refuses to run anywhere that is
not a Godot project root — it looks for `project.godot` and exits if it is not
there — so the site wears the colour of the thing it plugs into rather than
inventing a brand the tool does not have. `--blue-deep` is the darkened form
used for text on paper, since the editor blue is a dark-UI accent and does not
carry small type on a light background.

Fonts are the platform's own. No font is fetched, so no visitor's IP reaches a
font CDN and no CSP exception is needed to render the page.

## Domain

`src/layouts/Full.astro`, `public/robots.txt` and `public/sitemap.xml` assume
`https://gdlint.dev`, following `komizo.dev` and `ormos.dev`. If the site lands
somewhere else, those three files are the only places the host appears.
