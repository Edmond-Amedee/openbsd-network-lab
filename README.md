# BSD Stealth Network Lab

Ce dépôt fournit un environnement OpenBSD prêt à l'emploi pour tester la sécurité réseau et développer des services modulaires. Il s'inscrit dans la vision du **BSD Stealth Network Lab** détaillée dans [docs/VISION.md](docs/VISION.md).

## Objectifs

- Mettre en place un laboratoire facilement déployable sous OpenBSD.
- Préparer l'orchestration de modules légers et d'outils réseau.
- Explorer des techniques discrètes inspirées de la vision "BSD Stealth Network Lab".

## Prérequis rapides

- VMware Workstation Pro 17 (ou solution équivalente).
- Image ISO OpenBSD récente (ex. `install73.iso`).
- Virtualisation activée (VT‑x/AMD‑V) et au moins 4 Go de RAM.

## Documentation

- [Guide d'installation complet – français](docs/fr/README_FR.md)
- [Full installation guide – English](docs/en/README_EN.md)
- [Tutoriel Réseau & SSL – français](docs/fr/NETWORK_CHECK_FR.md)
- [Networking & SSL Tutorial – English](docs/en/NETWORK_CHECK_EN.md)
- [Vision "BSD Stealth Network Lab"](docs/VISION.md)
- [Architecture Overview](docs/architecture.md)
- [Aperçu de l'architecture](docs/fr/ARCHITECTURE_FR.md)

## Usage rapide

Un script `manage.sh` est fourni à la racine du projet pour simplifier certaines actions.
Pour installer un jail Alpine, exécutez :

```sh
./manage.sh create-alpine-jail
```

## Licence

Ce projet est distribué sous la licence MIT. Consultez le fichier [LICENSE](LICENSE) pour les détails.
