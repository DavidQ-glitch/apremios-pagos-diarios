#!/usr/bin/env python3
"""Genera version.json para el HTML de esta carpeta.
Uso: python publicar.py "Qué cambia en esta versión"
Después subir primero Apremios_Pagos_Diarios.html y luego version.json."""
import hashlib, json, re, sys, datetime, pathlib
arch = pathlib.Path(__file__).with_name('Apremios_Pagos_Diarios.html')
data = arch.read_bytes(); txt = data.decode('utf-8')
m = re.search(r"const APP_VERSION='([^']+)'", txt)
if not m: sys.exit('El HTML no tiene número de versión')
if re.search(r'<script id="seed" type="application/json">\{"rows": \[\{', txt): sys.exit('ATENCIÓN: este HTML trae datos de contribuyentes (semilla). No lo publiques.')
nov = sys.argv[1] if len(sys.argv) > 1 else ''
v = {'version': m.group(1), 'fecha': datetime.date.today().isoformat(), 'novedades': nov, 'archivo': arch.name, 'sha256': hashlib.sha256(data).hexdigest()}
arch.with_name('version.json').write_text(json.dumps(v, ensure_ascii=False, indent=2), encoding='utf-8')
print('version.json listo:', v['version'], v['sha256'])
