# openbsd-network-lab
📘 Complete OpenBSD lab installation guide with PF, user management and modular tools.
# Installer OpenBSD sur VMware Workstation Pro 17 🚀

Ce guide est conçu spécialement pour les débutants et explique étape par étape comment créer et configurer une machine virtuelle OpenBSD. Cette configuration sera idéale pour démarrer des projets réseau avancés, incluant potentiellement eBPF, surveillance réseau, sécurité et analyse. Chaque étape est décrite clairement et méthodiquement afin que chacun puisse réussir son installation.

---

## 📌 Prérequis

Pour bien débuter, assurez-vous d'avoir :

* **VMware Workstation Pro 17** installé
* Téléchargé le fichier ISO **OpenBSD** (exemple : `install73.iso`) depuis [openbsd.org](https://www.openbsd.org/)
* Un processeur avec virtualisation activée (**VT-x/AMD-V**)
* Au moins **4 Go de RAM** disponibles
* Une connexion réseau stable, idéalement en mode **Bridged** (pontée)

---

## 🛠️ ÉTAPE 1 – Créer la Machine Virtuelle

1. **Lancez VMware Workstation Pro 17**.
2. Cliquez sur **File** → **New Virtual Machine** puis choisissez **Custom (Advanced)**.
3. Sélectionnez la dernière **Hardware Compatibility** disponible.
4. Sélectionnez **I will install the operating system later** (installer l’OS plus tard).
5. Dans **Guest operating system**, choisissez **Other** puis **OpenBSD 64-bit**.
6. Nommez votre machine virtuelle, par exemple : `openbsd-lab`.
7. Choisissez **1 CPU** avec **2 Cores** (vous pourrez modifier ceci plus tard).
8. Attribuez au minimum **4096 Mo (4 Go)** de RAM.
9. Dans les paramètres réseau, choisissez **Bridged** (pontée).

   * Optionnellement, vous pouvez ajouter une seconde carte réseau (NAT ou Host-Only).
10. Sélectionnez **LSI Logic** comme contrôleur I/O.
11. Configurez le disque dur virtuel :

    * Type : **SCSI**
    * Taille : **10 à 20 Go** minimum
    * Format : **VMDK**

---

## 📀 ÉTAPE 2 – Installation d’OpenBSD

1. Lancez votre nouvelle machine virtuelle.
2. Sélectionnez l’ISO `install73.iso` au démarrage.
3. Suivez l’installateur OpenBSD avec ces recommandations :

### 🔧 Choix d'installation détaillés :

* **Clavier (Keyboard layout)** : choisissez `fr` pour français ou `us` pour anglais.
* **Hostname** : utilisez `openbsd-lab`.
* **Interface réseau** : choisissez `em0` et activez **DHCP** (ou définissez manuellement votre IP).
* **Mot de passe root** : créez un mot de passe fort (au moins 8 caractères, mélangeant lettres, chiffres, symboles).
* **Utilisateur supplémentaire** : créez un utilisateur nommé `admin`.
* **Groupes** : Ajoutez l’utilisateur `admin` au groupe `wheel` (ceci est nécessaire pour utiliser `doas`).
* **Sets à installer** : choisissez tout sauf `games` et ceux commençant par `x*` (installation minimale recommandée).
* **Source des sets** : choisissez `HTTP` (miroir automatique).
* **Partitionnement** :

  * Utilisez le choix simple (`Auto layout`) recommandé pour débutants.
  * Si vous voulez personnaliser :

    * `/home` séparé
    * `/tmp` et `/var` avec options `nosuid,nodev`
    * `/usr` suffisamment grand pour installer des outils futurs

---

## 🔒 ÉTAPE 3 – Configuration de Base après installation

### Configuration de `doas` (gestion des privilèges)

1. Connectez-vous en tant que `root`.
2. Écrivez la commande suivante dans le terminal :

```sh
sh -c 'echo "permit persist keepenv :wheel" > /etc/doas.conf'
```

### Ajouter `admin` au groupe `wheel`

Toujours en tant que `root`, exécutez :

```sh
usermod -G wheel admin
id admin
```

### Vérifiez votre configuration

Connectez-vous avec l’utilisateur `admin` :

```sh
su - admin
doas ls /
```

### Mise à jour du système

Toujours sous `admin`, exécutez ces commandes :

```sh
syspatch
```

---

## 🛡️ ÉTAPE 4 – Configuration Simple du Pare-feu (PF)

### Créer le fichier de configuration PF

1. Ouvrez le fichier `/etc/pf.conf` avec l'éditeur `vi` :

```sh
vi /etc/pf.conf
```

2. Insérez ces lignes dans le fichier :

```pf
# Configuration minimale de PF
set skip on lo0

block in all
pass out all keep state
```

3. Pour sauvegarder et quitter, appuyez sur `ÉCHAP`, tapez `:wq` puis `Entrée`.

### Activer le pare-feu (PF)

Tapez ces commandes pour activer et vérifier votre pare-feu :

```sh
doas rcctl enable pf
doas pfctl -f /etc/pf.conf
doas pfctl -e
doas pfctl -s info
```

Vous devriez voir s’afficher : `Status: Enabled`.

---

🎯 Félicitations, votre VM OpenBSD est maintenant prête à l’usage ! Ce README constitue une base solide pour débutants, et d’autres documents seront bientôt disponibles pour vous guider dans des configurations avancées telles que l'utilisation d'eBPF, outils d’analyse, IDS et sandbox.

---

**Toutes contributions et retours sont les bienvenus ! 🚀**
