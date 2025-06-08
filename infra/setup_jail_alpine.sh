#!/bin/sh
# SPDX-License-Identifier: MIT
#
# Script d'installation d'Alpine Linux dans un jail FreeBSD.
# Les étapes essentielles sont commentées pour faciliter la compréhension.

set -e

JAIL_NAME="alpine"
JAIL_ROOT="/usr/jails/${JAIL_NAME}"
ALPINE_VERSION="3.18"
ARCH="x86_64"
TARBALL="alpine-minirootfs-${ALPINE_VERSION}.0-${ARCH}.tar.gz"
MIRROR="https://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/releases/${ARCH}/${TARBALL}"

# 1. Création du répertoire du jail
mkdir -p "$JAIL_ROOT"

# 2. Téléchargement du mini rootfs Alpine
fetch -o "/tmp/${TARBALL}" "$MIRROR"

# 3. Extraction dans l'arborescence du jail
mkdir -p "$JAIL_ROOT"
tar -xzf "/tmp/${TARBALL}" -C "$JAIL_ROOT"
rm "/tmp/${TARBALL}"

# 4. Copie de la configuration DNS pour permettre les accès réseaux
cp /etc/resolv.conf "$JAIL_ROOT/etc/"

# 5. Configuration basique du jail
cat <<EOC > /etc/jail.conf.d/${JAIL_NAME}.conf
${JAIL_NAME} {
    path = "${JAIL_ROOT}";
    host.hostname = "${JAIL_NAME}";
    mount.devfs;
    exec.start = "/sbin/init";
    exec.stop = "/bin/sh /etc/rc.shutdown";
}
EOC

# 6. Montage de /dev et du répertoire des paquets (exemple pour /usr/ports/packages)
mount -t devfs devfs "${JAIL_ROOT}/dev"
mkdir -p "${JAIL_ROOT}/packages"
mount -t nullfs /usr/ports/packages "${JAIL_ROOT}/packages" || true

# 7. Lancement du jail
sysrc jail_enable=YES >/dev/null
service jail start "${JAIL_NAME}"
