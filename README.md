# Windows Autopilot Hardware Hash

Projet opérationnel pour récupérer le hash matériel Windows Autopilot d'un ordinateur neuf ou réinitialisé depuis l'écran OOBE, enregistrer le fichier CSV sur une clé USB, puis l'importer dans Microsoft Intune.

## Ce que contient le projet

- `Get-AutopilotHash.bat` : fichier unique à placer sur la clé USB.
- `collect-hardware-hash.md` : procédure de collecte depuis l'OOBE.
- `import-into-intune.md` : procédure d'import et de vérification dans Intune.

## Utilisation rapide

1. Copiez `Get-AutopilotHash.bat` à la racine d'une clé USB.
2. Démarrez le PC et restez sur l'écran OOBE.
3. Connectez le PC à Internet et branchez la clé USB.
4. Appuyez sur `Shift + F10` (ou `Shift + Fn + F10`).
5. Dans l'invite de commandes, ouvrez la clé USB, par exemple `E:`, puis lancez `Get-AutopilotHash.bat`.
6. Confirmez la collecte lorsque le script le demande.
7. Vérifiez que `AutopilotHWID.csv` se trouve sur la clé USB.
8. Importez le CSV dans Microsoft Intune en suivant [la procédure d'import](import-into-intune.md).

> Ne terminez pas l'installation de Windows et ne créez pas de compte Microsoft personnel avant la collecte.

## Fonctionnement du script

Le script utilise automatiquement le lecteur depuis lequel le fichier `.bat` est exécuté. Il installe le script Microsoft `Get-WindowsAutopilotInfo` depuis PowerShell Gallery, récupère le hash matériel, puis écrit `AutopilotHWID.csv` sur la même clé USB.

Une connexion Internet est nécessaire. PowerShell peut demander d'installer NuGet ou de faire confiance à PSGallery.

## Limite du zero touch

Cette méthode simplifie l'intervention, mais nécessite toujours une action technique sur l'appareil avant son attribution à l'utilisateur. Pour un déploiement réellement sans intervention préalable, le fournisseur ou le partenaire doit enregistrer l'appareil dans Windows Autopilot avant sa livraison.

## Sécurité et validation

- Exécutez le script uniquement sur des appareils appartenant à votre organisation ou pour lesquels vous êtes autorisé à collecter les informations matérielles.
- Ne modifiez pas les en-têtes ou les valeurs du CSV avant l'import.
- Après l'import, vérifiez le numéro de série, l'appartenance au groupe Microsoft Entra et l'affectation du profil Autopilot.
