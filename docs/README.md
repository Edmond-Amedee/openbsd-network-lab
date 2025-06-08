# Documentation Index

This folder contains guides for setting up and using the OpenBSD network lab.

- [Installer OpenBSD sur VMware Workstation Pro 17](fr/README_FR.md) - Guide d'installation en français.
- [Installing OpenBSD on VMware Workstation Pro 17](en/README_EN.md) - English installation guide.
- [Tutoriel Réseau et SSL sur OpenBSD](fr/NETWORK_CHECK_FR.md) - Guide réseau en français.
- [OpenBSD Networking & SSL Setup Tutorial](en/NETWORK_CHECK_EN.md) - English networking tutorial.
- [Project Vision](VISION.md) - Long-term project goals.
- [Architecture Overview](architecture.md) - How FreeBSD, jails and VMs interact.
- [Project Guidelines](../PROMPT.md) - Contribution primer.
- [Codex Contribution Guidelines](../PROMPT.md) - Reference for AI-assisted changes.
- [Aperçu de l'architecture](fr/ARCHITECTURE_FR.md) - Vue d'ensemble en français.
- [Utilitaires et scripts – français](fr/README.md) - Notes rapides sur les scripts fournis.
- [Utilities and scripts – English](en/README.md) - Short documentation for helper scripts.
- [Management CLI](../manage.sh) - Simple orchestrator script.
- [.gitignore](../.gitignore) - Patterns for temporary files, build artifacts, and VM/jail directories.

To quickly install an Alpine jail from the project root, run:

```sh
./manage.sh create-alpine-jail
```
