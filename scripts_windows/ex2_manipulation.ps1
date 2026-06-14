Write-Host "=========================================================="
Write-Host "Manipulation de Données (HDFS Shell)"
Write-Host "=========================================================="

Write-Host "[1/4] Création du répertoire cible sur HDFS :"
docker exec namenode hdfs dfs -mkdir -p /tphdfs/data

Write-Host ""
Write-Host "[2/4] Chargement du dataset nyctrip.csv :"
docker exec namenode hdfs dfs -put /tp/data/nyctrip.csv /tphdfs/data/

Write-Host ""
Write-Host "[3/4] Vérification du facteur de réplication par défaut :"
docker exec namenode hdfs dfs -stat "%r" /tphdfs/data/nyctrip.csv

Write-Host ""
Write-Host "[4/4] Modification et attente de la réplication à 2 (-w) :"
docker exec namenode hdfs dfs -setrep -w 2 /tphdfs/data/nyctrip.csv
