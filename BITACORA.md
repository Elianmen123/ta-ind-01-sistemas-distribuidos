# Bitácora de trabajo — TA-IND-01

## 2026-11-12

- **Qué hice:** Revisé la rúbrica de la TA-IND-01 para definir el sistema a analizar. Decidí continuar con Netflix, ya que lo había investigado antes para las fichas de la FORM-FB-01, y lo comparé con Spotify. Armé el repo público en GitHub y subí el esqueleto del proyecto en LaTeX (main.tex, README.md, la bitácora y el .bib), incluyendo la carátula con mi info.
- **Problema encontrado:** Como estaba subiendo las cosas directamente desde la interfaz web de GitHub, no me dejaba arrastrar carpetas enteras (y la carátula iba dentro de la carpeta secciones).
- **Cómo lo resolví:** Lo solucioné dándole a "Create new file" y escribiendo la ruta secciones/00-caratula.tex a mano para que GitHub me genere la carpeta automáticamente.
- **Tiempo dedicado:** 2 h 30 min aprox.

## 2026-11-13

- **Qué hice:** Configuré y levanté con Docker Compose el servidor Eureka (de Netflix OSS) junto con tres instancias del servicio-catalogo mapeadas a los puertos 8081, 8082 y 8083. Verifiqué que todas estuvieran vivas y registradas en el dashboard. Luego pasé a la prueba de fallos: bajé de golpe la instancia catalogo-2 con docker kill y me quedé consultando a Eureka cada 2 segundos. Noté que tardó como 30 segundos en darla de baja del registro (pasando de 3 a 2 instancias), a pesar de que el timeout estaba configurado en 15s. Después la volví a arrancar con docker start y esta vez tardó solo unos 8 segundos en volver a registrarse. Documenté los comandos, saqué capturas de todo y lo subí al repo.
- **Problema encontrado:** Tuve varios contratiempos tontos. Primero, el puerto 8081 chocaba con un contenedor de Airflow que había dejado corriendo de otro proyecto. También, al descomprimir quedó la carpeta experimento dentro de otra y Docker no encontraba el docker-compose.yml.
- **Cómo lo resolví:** Bajé los contenedores de Airflow desde Docker Desktop para liberar el puerto. Me moví al directorio correcto con un simple cd.
- **Tiempo dedicado:** 2 h 15 min aprox.

## 2026-11-14

- **Qué hice:** Dibujé el esquema a mano de la arquitectura (Anexo A) y luego hice el diagrama en draw.io, agregando la Application API, Hystrix y el rectángulo de AWS. Busqué y verifiqué fuentes nuevas (Open Connect, la migración de Netflix, el código de Eureka, Spotify y la caída de WhatsApp de 2021). Escribí todas las secciones del informe y las subí al repositorio. Investigué por qué Eureka tardó 30 segundos y no 15, y lo encontré en el código fuente (Lease.java, línea 103). Hice las capturas de lectura del Anexo B y subí el código del experimento.
- **Problema encontrado:** Al armar la tabla comparativa me di cuenta de que tenía varios datos técnicos de Spotify que no estaban respaldados por ninguna de las fuentes que había leído. Además, al revisar el repositorio con ayuda de Claude, vimos que el PDF salía de una sola página: solo aparecía la carátula y no se cargaba ninguna sección.
- **Cómo lo resolví:** Borré de la tabla todo lo de Spotify que no podía respaldar y dejé solo lo confirmado por TechCrunch y Google. Lo que no pude verificar (CAP y tolerancia a fallos de Spotify) lo dejé como "No documentado en mis fuentes". Para el PDF, el problema era que no había subido los archivos de la raíz (main.tex y referencias.bib); los subí y el informe compiló completo.
- **Tiempo dedicado:** 7 h 30 min aprox.
