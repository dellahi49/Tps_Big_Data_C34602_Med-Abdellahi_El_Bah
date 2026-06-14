Write-Host "=========================================================="
Write-Host "Démarrage du cluster Hadoop via docker-compose..."
Write-Host "=========================================================="
docker-compose up -d

Write-Host ""
Write-Host "Vérification de l'état des conteneurs (attente de 5 secondes) :"
Start-Sleep -Seconds 5
docker-compose ps

Write-Host ""
Write-Host "Rappel : Le Namenode sera 'healthy' quand il sera prêt."
Write-Host "URL d'accès Web du NameNode: http://localhost:9870"
