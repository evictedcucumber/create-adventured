# Create Adventured

Create inspired modpack with elements of adventuring.

## Setup

### Client

Recommended to use 12GB of RAM (12288MB).

Please use the extra java arguments below.

```bash
-XX:+UseZGC
```

### Server

Recommended to use 16GB of RAM (16384MB).

Please use the extra java arguments below.

```bash
-XX:+UseZGC
```

## Dev

Run the command below to enable direnv so the flake dev environment gets activated automatically.

```bash
direnv allow
```

If you don't have direnv/do not want to use direnv. You can just run the following:

```bash
nix develop
```

Then you need to install the pre-commit hooks once the dev shell is active.

```bash
lefthook install
```
