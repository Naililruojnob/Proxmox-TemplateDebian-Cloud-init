Voici un fichier README pour votre script, expliquant les différentes possibilités de configuration à travers les variables :

```markdown
# Proxmox Template Creation Script

Ce script Bash automatise le processus de création d'un template Debian sur un serveur Proxmox. Il inclut la personnalisation de l'image Debian pour ajouter l'agent invité QEMU et la configuration de la VM selon des spécifications prédéfinies.

## Prérequis

- Un serveur Proxmox en fonctionnement
- `wget` et `virt-customize` installés sur le serveur (le script les installera automatiquement s'ils ne sont pas présents)

## Utilisation

1. Clonez ou téléchargez ce dépôt sur votre serveur Proxmox.
2. Modifiez les variables du script si nécessaire pour répondre à vos besoins de configuration.
3. Exécutez le script avec les privilèges root : `sudo ./create_template.sh`

## Variables de Configuration

Le script utilise plusieurs variables pour permettre une personnalisation facile. Voici une description de chaque variable et de son rôle :

- `id` : Identifiant unique de la VM/template sur Proxmox. Exemple : `9999`
- `vm_name` : Nom de la VM/template. Exemple : `"Template-debian"`
- `memory` : Quantité de mémoire (RAM) allouée à la VM en Mo. Exemple : `4096` pour 4 Go de RAM
- `cores` : Nombre de cœurs CPU alloués à la VM. Exemple : `2`
- `disk_size` : Taille du disque dur de la VM. Exemple : `"20G"` pour 20 Go
- `debian_image_url` : URL de l'image Debian à télécharger. Exemple : `"https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"`
- `debian_image_name` : Nom de l'image Debian téléchargée. Exemple : `"debian-12-generic-amd64.qcow2"`
- `storage_pool` : Pool de stockage Proxmox où le disque sera importé. Exemple : `"local-lvm"`
- `network_bridge` : Pont réseau utilisé par la VM. Exemple : `"vmbr0"`
- `scsihw_type` : Type de contrôleur SCSI. Exemple : `"virtio-scsi-pci"`
- `cloudinit_drive` : Périphérique de disque Cloud-Init. Exemple : `"local:cloudinit"`

## Fonctionnement du Script

1. **Vérification de l'existence de la VM/Template** : Le script vérifie si une VM ou un template avec l'ID spécifié existe déjà. Si c'est le cas, il la supprime.
2. **Installation des outils nécessaires** : Le script vérifie et installe `wget` et `virt-customize` si nécessaire.
3. **Téléchargement de l'image Debian** : L'image Debian est téléchargée à partir de l'URL spécifiée.
4. **Personnalisation de l'image** : L'image Debian est personnalisée pour inclure l'agent invité QEMU.
5. **Création de la VM** : Une nouvelle VM est créée avec les spécifications fournies.
6. **Importation et redimensionnement du disque** : Le disque téléchargé est importé et redimensionné selon la taille spécifiée.
7. **Configuration de la VM** : La VM est configurée avec les options CPU, RAM, Cloud-Init, et autres spécifications.
8. **Conversion en template** : La VM est convertie en template Proxmox.
9. **Nettoyage** : L'image Debian téléchargée est supprimée.

## Exemple de Personnalisation

Pour créer une VM avec 8 Go de RAM, 4 cœurs CPU, un disque de 50 Go et un nom personnalisé, modifiez les variables comme suit :

```bash
id=1234
vm_name="Custom-Template"
memory=8192
cores=4
disk_size="50G"
```

Enregistrez les modifications et exécutez le script.

## Remarques

- Assurez-vous que l'ID de la VM est unique pour éviter les conflits.
- Vérifiez que l'URL de l'image Debian est correcte et accessible depuis le serveur Proxmox.
- Le script doit être exécuté avec les privilèges root pour effectuer les modifications système nécessaires.

## License

Ce script est distribué sous la licence MIT. Voir le fichier LICENSE pour plus de détails.
```

Ce README fournit une explication complète des variables de configuration, de l'utilisation du script et des différentes étapes impliquées dans le processus de création du template Proxmox. Vous pouvez l'ajuster davantage selon vos besoins spécifiques.