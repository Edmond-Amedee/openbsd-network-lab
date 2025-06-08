# Utilitaires et scripts

Ce dossier contient divers compléments pour le laboratoire OpenBSD.

## Jail Alpine

Le script `scripts/setup_jail_alpine.sh` automatise l'installation d'Alpine Linux dans un jail FreeBSD. Il crée le jail, monte un répertoire de paquets et lance l'environnement prêt à l'emploi.

Exécutez :

```sh
doas sh scripts/setup_jail_alpine.sh
```
