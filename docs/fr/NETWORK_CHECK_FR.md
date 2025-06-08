# Tutoriel Réseau et SSL sur OpenBSD 🚀

Ce tutoriel couvre l’essentiel pour vérifier la connectivité réseau, la résolution DNS et la gestion des certificats SSL racine sur votre VM OpenBSD. Il est conçu pour les débutants, avec des commandes étape par étape et des explications.

---

## Étape 1 – Vérifier la connectivité réseau

1. **Afficher l’interface réseau et l’adresse IP**

   ```sh
   ifconfig em0
   ```

   Vérifiez que vous voyez une adresse IPv4 ou IPv6 valide sous `em0`.

2. **Tester la connectivité IP**

   ```sh
   ping -c 4 1.1.1.1
   ```

   Des réponses réussies indiquent que le réseau de la VM et de l’hôte VMware est correctement configuré.

3. **Tester la résolution DNS**

   ```sh
   ping -c 4 openbsd.org
   ```

   Si vous recevez des réponses, la résolution DNS fonctionne.

4. **Vérifier la configuration des résolveurs**

   ```sh
   cat /etc/resolv.conf
   ```

   Vous devez voir au moins une ligne `nameserver x.x.x.x`.

5. **Optionnel : tracer le chemin réseau**

   ```sh
   traceroute openbsd.org
   ```

   Affiche chaque saut du réseau de votre VM vers la destination.

---

## Étape 2 – Gestion du bundle de certificats SSL sur OpenBSD 7.7

### Pourquoi `ca_root_nss` n’apparaît pas

* Le paquet `ca_root_nss` n’est plus distribué séparément pour OpenBSD 7.7 en amd64.
* Les certificats racine sont désormais inclus dans le système de base, dans `/etc/ssl/cert.pem`.

### Vérifier le bundle de certificats

1. **Contrôler la présence de `cert.pem`**

   ```sh
   ls -l /etc/ssl/cert.pem
   ```

   Le fichier existe et contient plusieurs certificats racine concaténés.

2. **Tester une connexion HTTPS**

   ```sh
   curl -I https://www.openbsd.org/
   ```

   Doit renvoyer `HTTP/1.1 200 OK` si les certificats sont valides.

### Ajouter un certificat interne (si nécessaire)

Si vous devez faire confiance à une autorité interne :

```sh
doas sh -c 'cat /chemin/vers/mon-ca-interne.pem >> /etc/ssl/cert.pem'
```

Puis retestez :

```sh
curl -I https://intranet.exemple.local/
```

---

## Résumé

* Vérification réseau avec `ifconfig`, `ping`, DNS et `traceroute`.
* Les certificats racine sont inclus dans `/etc/ssl/cert.pem` sur OpenBSD 7.7.
* Pour ajouter d’autres CA, il suffit de concaténer leur PEM à ce fichier, sans installer de paquet supplémentaire.

N’hésitez pas à intégrer ce tutoriel dans votre documentation pour offrir un guide complet et pédagogique ! 🚀
