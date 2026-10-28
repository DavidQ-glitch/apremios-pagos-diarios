# Publica una versión nueva de Apremios_Pagos_Diarios.html
# Uso (PowerShell, en la carpeta donde está el HTML nuevo):
#   .\publicar.ps1 -Novedades "Qué cambia en esta versión"
# Genera version.json con el número de versión que trae el HTML, la fecha y el control sha256.
# Después subí a GitHub PRIMERO el HTML y DESPUÉS version.json.
param([Parameter(Mandatory=$true)][string]$Novedades,[string]$Archivo="Apremios_Pagos_Diarios.html")
$ruta = Join-Path (Get-Location) $Archivo
if (-not (Test-Path $ruta)) { Write-Error "No encuentro $Archivo en esta carpeta"; exit 1 }
$txt = Get-Content -Raw -Encoding UTF8 $ruta
if ($txt -notmatch "const APP_VERSION='([^']+)'") { Write-Error "El HTML no tiene número de versión"; exit 1 }
$version = $Matches[1]
if ($txt -match '<script id="seed" type="application/json">\{"rows": \[\{') { Write-Error "ATENCIÓN: este HTML trae datos de contribuyentes (semilla). No lo publiques."; exit 1 }
$sha = (Get-FileHash -Algorithm SHA256 $ruta).Hash.ToLower()
$json = [ordered]@{ version=$version; fecha=(Get-Date -Format "yyyy-MM-dd"); novedades=$Novedades; archivo=$Archivo; sha256=$sha } | ConvertTo-Json
[System.IO.File]::WriteAllText((Join-Path (Get-Location) "version.json"), $json, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Listo: version.json para la versión $version (sha256 $sha)"
Write-Host "Subí a GitHub primero $Archivo y después version.json."
