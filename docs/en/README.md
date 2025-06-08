# Utilities and Scripts

This folder stores additional helpers for the OpenBSD lab.

## Alpine Jail

The `scripts/setup_jail_alpine.sh` script installs Alpine Linux inside a FreeBSD jail. It creates the jail, mounts a package directory and starts the new environment.

Run:

```sh
doas sh scripts/setup_jail_alpine.sh
```
