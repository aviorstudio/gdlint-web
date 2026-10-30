<!-- Generated from private documentation source. Do not edit directly. Source SHA256: acb9a018ff22f9cd2ecd0182ef925e65700fe065173daaea17e9a82692cf5cff -->

# gdlint-web

Static website built with Astro.

Install [mise](https://mise.jdx.dev/) and run `mise install`, then run:

```sh
mise run dev                 # Development server
mise run check               # Complete applicable source, build and output checks
mise run build           # Generate dist/
mise tasks ls            # Inspect tools and available commands
```

Ctrl-C stops development. This website needs no runtime credentials or credential `.env` file.

## Install the CLI

With curl:

```sh
curl -fsSL https://gdlint.dev/install | sh
```

Or with mise:

```sh
mise use --global github:aviorstudio/gdlint@latest
```

An icon-only copy control sits on the right inside each install-command outline and shows a checkmark after copying. If clipboard access is unavailable, the command remains selectable for manual copying.

See [gdlint](https://github.com/aviorstudio/gdlint#readme) for setup and installation options.

For contributor verification, prepare the pinned helper source before running native tasks:

```sh
git clone https://github.com/nicodes/tools.git .ci-tools
git -C .ci-tools checkout --detach 0f95a6df60f740b527596ed2c7f4590e3f2d5820
mise install
mise run check
```

Build commands record source and exact regular output hashes. Declared tests produce evidence from the current verification session in `.artifacts/verification`.

`mise run dev` owns the checkout’s foreground process tree. Dependency preparation and the application use an isolated local environment through the pinned optional ghenv CLI; no account is needed. Startup refuses changes to the native task policy during preparation. `mise run stop` stops only that checkout, and `mise run clean` refuses cleanup while its session is active.
