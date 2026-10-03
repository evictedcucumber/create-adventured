# Create Adventured

A [Create](https://modrinth.com/project/LNytGWDc) inspired modpack with elements of adventuring, managed with [packwiz](https://github.com/evictedcucumber/packwiz) (the `evictedcucumber/packwiz` fork, not the upstream project).

| | |
|---|---|
| **Minecraft** | 1.21.1 |
| **Loader** | NeoForge 21.1.250 |
| **Pack format** | `evictedcucumber-packwiz:1.0.0` |

## Playing

Install the pack from [Modrinth](https://modrinth.com/modpack/create-adventured). The Modrinth page description lives in [docs/README-modrinth.md](docs/README-modrinth.md).

- Full mod list with versions: [MODS.md](MODS.md)
- Release history: [CHANGELOG.md](CHANGELOG.md)

## Repository layout

| Path | Purpose |
|---|---|
| `pack.toml`, `index.toml` | packwiz pack definition and file index |
| `mods/` | One `.pw.toml` per mod |
| `configureddefaults/` | Default configs applied via Configured Defaults |
| `resourcepacks/` | Bundled resource packs |
| `docs/` | Documentation, including the Modrinth README |

## Development

This repo uses the [evictedcucumber/packwiz](https://github.com/evictedcucumber/packwiz) fork, which the Nix flake provides in the dev shell. Don't use upstream packwiz, as the pack format differs.

Run the command below to enable direnv so the flake dev environment gets activated automatically.

```bash
direnv allow
```

If you don't have direnv or don't want to use it, run the following instead:

```bash
nix develop
```

Then install the pre-commit hooks once the dev shell is active.

```bash
lefthook install
```

Common packwiz commands:

```bash
packwiz modrinth add <mod>
packwiz update --all
packwiz refresh
```

## Contributing

Use the [issue templates](.github/ISSUE_TEMPLATE) for bug reports, config changes, feature requests, and mod management.

## License

See [LICENSE](LICENSE).
