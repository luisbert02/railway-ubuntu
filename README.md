# 🐧 Ubuntu 24.04 LTS en Railway

Terminal web completamente funcional corriendo Ubuntu 24.04 LTS en Railway, accesible desde cualquier navegador.

## 🚀 Deploy en Railway

### Opción 1: Desde GitHub
1. Sube este repositorio a GitHub
2. Entra a [railway.app](https://railway.app) → **New Project** → **Deploy from GitHub repo**
3. Selecciona tu repositorio
4. Configura las variables de entorno (ver abajo)
5. ¡Listo!

### Opción 2: Railway CLI
```bash
npm install -g @railway/cli
railway login
railway init
railway up
```

## ⚙️ Variables de Entorno

Configúralas en Railway → tu servicio → **Variables**:

| Variable   | Descripción                     | Default        |
|------------|---------------------------------|----------------|
| `USERNAME` | Usuario para acceder al terminal | `admin`        |
| `PASSWORD` | Contraseña del terminal          | `changeme123`  |

> ⚠️ **Cambia la contraseña antes de hacer deploy público.**

## 💾 Almacenamiento Persistente

Los archivos en `/data` sobreviven entre redeploys.  
Los archivos en `/root/workspace` se pierden al redesplegar.

Para guardar algo permanente:
```bash
cp mi_archivo.txt /data/
```

## 🛠️ Software Preinstalado

- `git`, `curl`, `wget`
- `python3`, `pip`
- `nodejs`, `npm`
- `vim`, `nano`, `htop`
- `build-essential` (gcc, make, etc.)
- `zip`, `unzip`, `tar`

## 📦 Instalar más software

Dentro del terminal:
```bash
apt update && apt install -y <paquete>
```

## 🔗 Acceso

Tras el deploy, Railway te dará una URL tipo:
```
https://tu-servicio.up.railway.app
```
Abre esa URL en el navegador, ingresa usuario y contraseña, ¡y tendrás tu terminal Ubuntu!

## ⚠️ Notas importantes

- Railway tiene un **plan gratuito limitado** en horas/mes
- Los contenedores son **efímeros** — usa `/data` para persistir archivos
- No uses esto para actividades que violen los ToS de Railway
