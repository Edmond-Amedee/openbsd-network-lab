# Vue d'architecture

Ce document illustre comment l'hôte FreeBSD interagit avec des jails Alpine, une VM Alpine basée sur bhyve exécutant kraftkit et Docker, ainsi qu'une VM DragonFlyBSD supplémentaire.

## Composants

- **Hôte FreeBSD** – système de base qui gère bhyve et les jails.
- **Jails Alpine** – conteneurs légers utilisés pour de petits services.
- **VM Alpine (bhyve)** – exécute kraftkit et Docker pour des charges plus lourdes.
- **VM DragonFlyBSD** – environnement séparé pour les tests.

Le trafic réseau peut circuler entre les jails, les machines virtuelles et l'hôte. Le diagramme ASCII ci-dessous donne une vue d'ensemble de ces interactions.

```
                        +--------------------------------+
                        |          FreeBSD Host          |
                        |  +--------------------------+  |
                        |  |       Alpine jails       |  |
                        |  +--------------------------+  |
                        |            Services            |
                        +---------------|----------------+
                                        |
          +-------------------+         |      +---------------------+
          |     Alpine VM     |<--------+----->|   DragonFlyBSD VM   |
          +-------------------+                +---------------------+
```
