# Capturas del experimento

Capturas tomadas en mi equipo (usuario `asus`, equipo `DESKTOP-7PPDV1J`) el 13 de noviembre de 2026, ejecutando Eureka y tres copias de `servicio-catalogo` con Docker Desktop.

| Archivo | Qué muestra |
|---|---|
| `01-docker-ps.png` | Usuario, equipo, fecha y los 4 contenedores en ejecución (`eureka-server`, `catalogo-1`, `catalogo-2`, `catalogo-3`) |
| `02-eureka-panel.png` | Panel de Eureka en `localhost:8761` con las 3 instancias de `SERVICIO-CATALOGO` en estado UP |
| `03-curl-3-copias.png` | Las 3 copias respondiendo en los puertos 8081, 8082 y 8083 |
| `04-caida.png` | Caída forzada de `catalogo-2` con `docker kill` y sondeo del registro cada 2 s hasta que pasa de 3 a 2 instancias |
| `05-curl-falla-8082.png` | El puerto 8082 ya no responde y los puertos 8081 y 8083 siguen funcionando |
| `06-recuperacion.png` | Reinicio de `catalogo-2` con `docker start` y sondeo hasta que vuelve a 3 instancias |

Los comandos usados están en `experimento/comandos.ps1` y las salidas completas en `experimento/resultado-caida.txt` y `experimento/resultado-recuperacion.txt`.
