# Comandos del experimento (PowerShell, Windows, Docker Desktop)
# Ejecutar dentro de la carpeta experimento/

# 1. Construir y levantar Eureka + 3 copias de servicio-catalogo
docker compose up --build -d

# 2. Datos del equipo y contenedores en ejecucion
whoami; hostname; Get-Date; docker ps

# 3. Comprobar que las 3 copias responden
curl.exe http://localhost:8081/info; ""; curl.exe http://localhost:8082/info; ""; curl.exe http://localhost:8083/info

# 4. Caida forzada de catalogo-2 y sondeo del registro de Eureka cada 2 s
$salida = & {
  "Inicio: caida forzada de catalogo-2 a las $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
  docker kill catalogo-2
  1..20 | ForEach-Object {
    $r = Invoke-RestMethod -Uri "http://localhost:8761/eureka/apps/SERVICIO-CATALOGO" -Headers @{Accept="application/json"}
    $ids = @($r.application.instance) | ForEach-Object { $_.instanceId }
    "$(Get-Date -Format HH:mm:ss)  instancias registradas: $($ids.Count)  ->  $($ids -join ', ')"
    Start-Sleep -Seconds 2
  }
}
$salida
$salida | Out-File -Encoding utf8 resultado-caida.txt

# 5. Comprobar que catalogo-2 ya no responde y las otras si
curl.exe http://localhost:8081/info; ""; curl.exe http://localhost:8082/info; ""; curl.exe http://localhost:8083/info

# 6. Reinicio de catalogo-2 y sondeo del registro hasta que vuelve a aparecer
$salida2 = & {
  "Inicio: reinicio de catalogo-2 a las $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
  docker start catalogo-2
  1..15 | ForEach-Object {
    $r = Invoke-RestMethod -Uri "http://localhost:8761/eureka/apps/SERVICIO-CATALOGO" -Headers @{Accept="application/json"}
    $ids = @($r.application.instance) | ForEach-Object { $_.instanceId }
    "$(Get-Date -Format HH:mm:ss)  instancias registradas: $($ids.Count)  ->  $($ids -join ', ')"
    Start-Sleep -Seconds 2
  }
}
$salida2
$salida2 | Out-File -Encoding utf8 resultado-recuperacion.txt

# 7. Apagar todo al terminar
# docker compose down
