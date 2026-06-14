Write-Host "=========================================================="
Write-Host "Analyse des Blocs et Diagnostic FSCK"
Write-Host "=========================================================="

Write-Host "Lancement du diagnostic HDFS :"
docker exec namenode hdfs fsck /tphdfs/data/nyctrip.csv -files -blocks -locations

Write-Host ""
Write-Host "Démonstration - Tolérance aux pannes : Arrêt du datanode1"
docker stop datanode1

Write-Host ""
Write-Host "Vérification de la disponibilité du fichier (il DOIT toujours s'afficher) :"
docker exec namenode bash -c "hdfs dfs -cat /tphdfs/data/nyctrip.csv | head"
