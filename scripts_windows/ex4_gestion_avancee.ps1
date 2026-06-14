Write-Host "=========================================================="
Write-Host "Administration et Gestion Avancée"
Write-Host "=========================================================="

Write-Host "[1/3] Expérience de Fusion :"
Write-Host "--> Création des répertoires pour les rapports et envoi sur HDFS"
docker exec namenode hdfs dfs -mkdir -p /exercices/rapports/

# Les fichiers sont un dossier plus haut (à la racine)
docker cp ../rapport1.txt namenode:/tmp/rapport1.txt
docker cp ../rapport2.txt namenode:/tmp/rapport2.txt
docker cp ../rapport3.txt namenode:/tmp/rapport3.txt

docker exec namenode hdfs dfs -put /tmp/rapport1.txt /exercices/rapports/
docker exec namenode hdfs dfs -put /tmp/rapport2.txt /exercices/rapports/
docker exec namenode hdfs dfs -put /tmp/rapport3.txt /exercices/rapports/

Write-Host "--> Fusion via hdfs dfs -getmerge :"
docker exec namenode hdfs dfs -getmerge /exercices/rapports/ /tmp/fusion.txt
Write-Host "--> Contenu du fichier fusion.txt qui se trouve mnt dans HDFS (/tmp/fusion.txt local au namenode) :"
docker exec namenode cat /tmp/fusion.txt

Write-Host ""
Write-Host "[2/3] Gestion des Droits :"
Write-Host "Création d'un fichier temporaire (personnes.txt) sur HDFS"
docker exec namenode sh -c "echo 'Liste des personnes' > /tmp/personnes.txt"
docker exec namenode hdfs dfs -put -f /tmp/personnes.txt /tphdfs/data/personnes.txt

docker exec namenode hdfs dfs -chown root:supergroup /tphdfs/data/personnes.txt
docker exec namenode hdfs dfs -chmod 600 /tphdfs/data/personnes.txt
Write-Host "Droits modifiés. Affichage des permissions :"
docker exec namenode hdfs dfs -ls /tphdfs/data/personnes.txt

Write-Host ""
Write-Host "[3/3] Ajout de données via -appendToFile :"
docker exec namenode sh -c "echo 'Ligne LOG ajoutée avec appendToFile' > /tmp/new_log.txt"
docker exec namenode hdfs dfs -appendToFile /tmp/new_log.txt /tphdfs/data/personnes.txt
Write-Host "Contenu final du fichier :"
docker exec namenode hdfs dfs -cat /tphdfs/data/personnes.txt
