## 🌌 CONTEXTE GÉNÉRAL DU PROJET

Ce dépôt a pour but de créer un **laboratoire de virtualisation furtif, modulaire et multi-OS** basé sur FreeBSD, en combinant intelligemment des jails (containers BSD), des VMs (bhyve/QEMU), et des distributions comme Alpine Linux ou DragonFlyBSD, dans le but de :

* ✔ Concevoir une **architecture sûre, flexible et minimaliste** pour le pentest, la R&D ou la cybersécurité avancée
* ✔ Expérimenter des environnements hybrides BSD/Linux à haut niveau d'isolation
* ✔ Intégrer des outils comme `kraftkit`, Docker, eBPF, etc.
* ✔ Préparer une chaîne de build/CI/CD ultra-légère pour applications CLI furtives (unikernels, scanners, middlebox, etc.)

---

## ⚖️ PRINCIPES DE BASE POUR CODEX

1. **Toujours respecter l’essence du projet** :

   * Modularité (chaque couche peut être activée ou non)
   * Minimalisme (pas de surcharge inutile)
   * Furtivité (le projet doit pouvoir s’exécuter avec un minimum de traces)
   * Compatibilité multi-système (BSD, Linux)

2. **Conserver une mémoire interne de l’architecture actuelle** :

   * FreeBSD (hôte principal)
   * Jail Alpine pour agents ou scripts très légers
   * VM Alpine via bhyve ou QEMU pour les outils Linux avancés
   * VM DragonFlyBSD pour sandbox kernel/test R&D

3. **Ne jamais ajouter de complexité sans raison technique valable**. Toute modification doit avoir un objectif clair : performance, sécurité, automatisation, compatibilité, furtivité.

4. **Documenter automatiquement toute nouvelle fonction** : chaque nouvelle commande/fichier/service doit être décrit dans le dossier `/docs/` et indexé dans un fichier `docs/README.md`.

5. **Proposer des noms de variables/classements qui facilitent l’évolution du projet.** Par exemple :

   * `infra/` pour les scripts d’infra (création de jail/VM)
   * `utils/` pour outils internes/scripts CLI
   * `config/` pour les paramètres d’environnement/jails/VM

6. **Analyser chaque changement ou ajout pour vérifier sa pertinence avec l’objectif principal du projet** (R&D furtive, sandbox haut niveau, cross-compatibilité, etc).

---

## 🔹 TÂCHES SPÉCIFIQUES POUR CODEX (modifiable au fil du projet)

* [ ] Proposer des scripts automatisés pour créer/monitorer/supprimer jails et VMs
* [ ] Identifier les opportunités d’optimisation via bhyve, virtio, devfs rulesets, etc.
* [ ] Convertir les expérimentations manuelles en fichiers `.sh`, `.yaml` ou `.conf`
* [ ] Détecter les répétitions ou incohérences dans la doc
* [ ] Créer une commande CLI unique `orchestrator.sh` ou `manage.sh` pour tout gérer
* [ ] Aider à maintenir une logique de `modular bootstrap` (chaque brique exécutable seule)

---

## 🚀 OBJECTIF FINAL

Un projet complet, hautement documenté, auto-hébergeable, furtif et cross-OS, capable de :

* Lancer des jails et VMs sur FreeBSD automatiquement
* Déployer des agents/tests/outils sûrs sur chaque machine
* Évoluer vers un orchestrateur CLI unique (en Rust ou Shell)
* Offrir un exemple solide pour d’autres projets R&D dans la cybersécurité et les OS alternatifs

---

> Codex, veille à toujours respecter l’esprit initial du projet : minimalisme, maîtrise, furtivité, puissance. Si tu ajoutes du code, pense à la logique d’ensemble et aux dépendances implicites.
