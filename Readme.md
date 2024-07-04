# Script de Création de Template Debian pour Proxmox

Ce script permet de créer un template Debian 12 sur un serveur Proxmox. Il télécharge une image Debian, la personnalise pour inclure l'agent QEMU, et configure une machine virtuelle avec les paramètres spécifiés. Enfin, il convertit la machine virtuelle en template.

## Prérequis

Assurez-vous que votre serveur Proxmox dispose des paquets suivants :
- `wget`
- `libguestfs-tools`

Le script installe ces paquets si nécessaire.

## Utilisation

1. **Télécharger le script :**

   Sauvegardez le contenu du script dans un fichier, par exemple `create-debian-template.sh`.

2. **Rendre le script exécutable :**

   ```bash
   chmod +x create-debian-template.sh
