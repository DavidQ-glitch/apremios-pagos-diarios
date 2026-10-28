# Apremios · Pagos diarios — actualizaciones

Programa de la Dirección Jurídico Contable de Apremios (Municipalidad de Moreno). Funciona sin internet; este repositorio sólo sirve para que cada computadora reciba las versiones nuevas.

**Acá no hay datos.** El archivo publicado no trae pagos ni datos de contribuyentes: los datos de cada usuario quedan en su navegador y en su carpeta de respaldo, y la actualización nunca los toca.

## Cómo funciona
1. Al abrirse, si hay conexión, el programa lee `version.json` (máximo 5 segundos; si falla, sigue normal). No envía ningún dato.
2. Si la versión es más nueva, avisa: **Actualizar ahora / Más tarde**.
3. Al actualizar: hace un respaldo completo, descarga el HTML, controla el `sha256` y lo guarda con el mismo nombre en el mismo lugar (la primera vez el usuario elige el archivo; después basta el clic). Si el navegador no lo permite, lo descarga y explica cómo reemplazarlo.

## Firma digital
Desde la versión 2026.10.28.2 el programa sólo instala versiones **firmadas con la clave privada del Director**, que está únicamente en su computadora (cifrada con contraseña). El programa lleva adentro la clave pública:

`BHIKAIUqzoegks5s2zJUvv/XV1fOUwL8k+Uf8anyFOQrmyXCLRqwGxUQeKM7ok6k99wcc+FnF4bNhjH71xc2YZQ=`

Si en este repositorio apareciera una versión sin esa firma (o alterada), el programa avisa en rojo y no la instala.

## Publicar una versión nueva
1. Subir el HTML nuevo (`Apremios_Pagos_Diarios.html`).
2. En la computadora del Director: copiar ese HTML y `novedades.txt` a `Documentos\ApremiosFirma\Publicar` y hacer doble clic en `2 Firmar version.bat` (pide la contraseña de la clave). Genera `version.json` firmado.
3. Subir `version.json` (siempre después del HTML).

La clave privada **nunca** se sube a este repositorio.
