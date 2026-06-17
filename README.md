# 🏥 Situación y análisis de las camas hospitalarias en Chile (2016-2025)

![Estado del proyecto](https://img.shields.io/badge/Estado-Terminado-green)
![Lenguaje](https://img.shields.io/badge/Stack-SQL_|_Power_Query_|_Tableu-blue)
 	
El presente artículo muestra la situación de las camas hospitalaria en Chile, públicas y privadas, con un breve análisis de su funcionamiento centrado en particular en su productividad. Se hace un recuento histórico de la disponibilidad de camas públicas y privadas desde el año 2016 al 2025. 
Las cifras utilizadas provienen datos públicos del MINSAL.

## 📊 Descripción del Proyecto

Este sistema automatiza la normalización, modelado relacional (Star Schema) y visualización de indicadores hospitalarios (REM). El objetivo es transformar datos crudos del DEIS en información estratégica para la gestión pública.

## Datos

Los datos se descargan desde [Portal de datos abierto](https://datos.gob.cl/) en archivos csv, los cuales se guardan en la carpeta `data/raw`. Estos archivos son cargados en los script `normalizacion_establecimiento_salud_2026 .pq` y `normalizacion_rem_2026.pq`, los cuales limpian la data.

## Datos
La visualización esta disponible en [Tableu](https://public.tableau.com/app/profile/rodrigo.alegre/viz/SaludHospitalariaChile/Dashboard1)

### Fuente
- Portal de datos abierto - Establecimientos de salud (https://datos.gob.cl/dataset/establecimientos-de-salud-vigentes)
- Portal de datos abierto - Indicadores del proceso de hospitalización de los establecimientos públicos de Salud (https://datos.gob.cl/dataset/indicadores-hospitalarios-rem20)

## 💻 Stack Tecnológico
* **Lenguaje de Transformación:** M (Power Query) para procesos ETL.
* **Modelado de Datos:** SQL Server / MySQL (Arquitectura relacional).
* **Cálculos:** DAX avanzado para KPIs de gestión.
* **Visualización:** Power BI Desktop (Dashboards ejecutivos).
* **Documentación:** Markdown y bitácoras técnicas.

# Desarrollado por [Rodrigo Alegre Alay] en lenguajes SQL, PQ y DAX. Código disponible en [GitHub](https://github.com/rodrigoalegrealay/situacion_analisis_camas_hospitalarias_chile).
