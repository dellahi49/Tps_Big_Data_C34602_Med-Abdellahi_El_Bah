Write-Host "=========================================================="
Write-Host "Arrêt et Maintenance"
Write-Host "=========================================================="

Write-Host "Arrêt en cours des conteneurs Docker (docker-compose stop)..."
# Exécuté depuis un sous dossier, docker-compose saura trouver le yml s'il regarde plus haut,
# mais par précaution on spécifie le chemin du fichier parent :
docker-compose -f ../docker-compose.yml stop

Write-Host ""
Write-Host "=== WARNING ==="
Write-Host "La commande suivante supprimerait l'environnement avec toutes ses données (volumes) :"
Write-Host "docker-compose -f ../docker-compose.yml down -v"
Write-Host ""
Write-Host "Si vous voulez nettoyer complètement le TP et supprimer le réseau et les données, relancez cette ligne."
