<!-- Generated from private documentation source. Do not edit directly. Source SHA256: dc298d79d1182cb0dd66f830c7dcf9c5f25a3ff0f08c3d5da9611c57f345ab03 -->

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
git -C .ci-tools checkout --detach 46bf98735de2e7fe41cca1042c20c98f5b01824a
mise install
mise run check
```

Build commands record source and exact regular output hashes. Declared tests produce evidence from the current verification session in `.artifacts/verification`.

`mise run dev` owns the checkout’s foreground process tree. Dependency preparation and the application use an isolated local environment through the pinned optional ghenv CLI; no account is needed. Startup refuses changes to the native task policy during preparation. `mise run stop` stops only that checkout, and `mise run clean` refuses cleanup while its session is active.

## Contributor task interface

Contributor tool versions and task entry points live in the native Mise configuration. Use `mise run lint` for source checks, `mise run test` for the applicable behavioral tests, and `mise run check` for the complete supported gate. `mise run clean` removes declared generated outputs while preserving source, credentials and retained data. Use `mise run dev` and `mise run stop` for this checkout's owned local session.

Built exports enforce the product byte limits in `scripts/site-budget.toml`: 2 MiB total, 512 KiB per file, 64 KiB gzip HTML per page and 128 KiB gzip JavaScript in aggregate. `mise run artifact-check` checks these actual output bytes alongside metadata and accessible markup. Browser acceptance covers responsive layout, images and keyboard use.
