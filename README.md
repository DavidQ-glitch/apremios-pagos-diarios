# Apremios · Pagos diarios — actualizaciones

Programa de la Dirección Jurídico Contable de Apremios (Municipalidad de Moreno). Funciona sin internet; este repositorio sólo sirve para que cada computadora reciba las versiones nuevas.

**Acá no hay datos.** El archivo publicado no trae pagos ni datos de contribuyentes: los datos de cada usuario quedan en su navegador y en su carpeta de respaldo, y la actualización nunca los toca.

## Cómo funciona
1. Al abrirse, si hay conexión, el programa lee `version.json` (máximo 5 segundos; si falla, sigue normal). No envía ningún dato.
2. Si la versión es más nueva, avisa: **Actualizar ahora / Más tarde**.
3. Al actualizar: hace un respaldo completo, descarga el HTML, controla el `sha256` y lo guarda con el mismo nombre en el mismo lugar (la primera vez el usuario elige el archivo; después basta el clic). Si el navegador no lo permite, lo descarga y explica cómo reemplazarlo.

## Publicar una versión nueva
1. Poné el HTML nuevo (con su número de versión adentro) en una carpeta junto a `publicar.ps1`.
2. En PowerShell: `.\publicar.ps1 -Novedades "Qué cambia"` → genera `version.json`.
3. En GitHub (Add file → Upload files): subí **primero** `Apremios_Pagos_Diarios.html` y **después** `version.json`.

El script se niega a publicar un HTML que traiga datos de contribuyentes.
