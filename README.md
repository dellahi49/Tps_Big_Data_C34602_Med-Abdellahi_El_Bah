# TP Hadoop - Déploiement et Manipulation de Données sur HDFS

Ce dépôt contient l'ensemble des scripts et configurations permettant de déployer un cluster Hadoop via Docker, et de manipuler des données volumineuses sur HDFS.

## 📂 Structure du projet

- `docker-compose.yml` : Configuration Docker pour lancer le cluster (1 NameNode, 2 DataNodes).
- `hadoop.env` : Variables d'environnement pour la configuration Hadoop.
- `scripts_windows/` : Scripts d'automatisation pour Windows (PowerShell).
- `data/` : Dossier prévu pour contenir le dataset (ex: `nyctrip.csv`). *(Note: le fichier de données est ignoré par Git en raison de sa taille).*

## 🚀 Utilisation

### Étape 1 : Démarrage du cluster
Démarrez le cluster à l'aide de Docker Compose en utilisant le script correspondant à votre système :
- Windows : `.\scripts_windows\ex1_lancement.ps1`


### Étape 2 : Chargement des données
Ce script crée les répertoires nécessaires sur HDFS et charge le fichier CSV :
- Windows : `.\scripts_windows\ex2_manipulation.ps1`


### Étape 3 : Analyse des blocs (Tolérance aux pannes)
Permet de visualiser la répartition des blocs sur les DataNodes et de simuler une panne :
- Windows : `.\scripts_windows\ex3_analyse_blocs.ps1`


## 📊 Interfaces Web
Une fois le cluster démarré, vous pouvez accéder aux interfaces :
- **NameNode** : [http://localhost:9870](http://localhost:9870)
- **DataNodes** : Accessibles via l'onglet "Datanodes" sur l'interface du NameNode.


