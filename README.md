# TA-IND-01 — Análisis crítico comparativo de un sistema distribuido real

**Asignatura:** Sistemas Distribuidos — UTEQ
**Estudiante:** Elian Mendoza Villarroel

## Video de sustentación

Enlace: _pendiente_

## Estructura del repositorio

| Carpeta / archivo   | Contenido                                        |
|---------------------|--------------------------------------------------|
| `main.tex`          | Archivo principal del informe                    |
| `secciones/`        | Una sección del informe por archivo              |
| `referencias.bib`   | Referencias en formato biblatex (estilo IEEE)    |
| `figuras/`          | Diagrama de arquitectura y otras figuras         |
| `capturas/`         | Capturas de la ejecución del sistema             |
| `anexos/`           | Anexo A (esquema a mano) y Anexo B (lecturas)    |
| `experimento/`      | Comandos y resultados del experimento            |
| `BITACORA.md`       | Bitácora de trabajo por sesión                   |
| `main.pdf`          | Informe compilado                                |

## Compilación

- **Compilador:** pdfLaTeX
- **Archivo principal:** `main.tex`
- **Gestor de referencias:** biber (biblatex, estilo `ieee`)

Orden de comandos:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

### Dependencias

Distribución TeX Live o MiKTeX con los paquetes: `babel` (spanish), `mathptmx`,
`geometry`, `setspace`, `graphicx`, `booktabs`, `float`, `xurl`, `hyperref`,
`csquotes`, `biblatex`, `biblatex-ieee`, y el programa `biber`.
