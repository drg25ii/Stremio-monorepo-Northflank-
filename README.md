# Stremio monorepo (Northflank)

Repo-ul conține template-uri ⁠ .env.example ⁠ și fișiere ⁠ docker-compose.yml ⁠ pentru rulare locală.
Pe Northflank NU rulezi direct ⁠ docker-compose.yml ⁠; creezi câte 1 service per container și setezi Ports + Runtime variables din UI.

## Naming (Northflank)
Folosește nume simple ca să îți iasă frumos URL-ul public. Northflank generează domenii publice în format:
⁠ [port-name]--[service-name]--[random-string].code.run ⁠ (TLS/HTTPS inclus).  
Recomandare: ⁠ port name = http ⁠ la toate.

### Service names
•⁠  ⁠AIOStreams: ⁠ stremio-aiostreams ⁠
•⁠  ⁠AIOMeta ⁠ stremio-aiometadata ⁠
•⁠  ⁠Mediaflow-proxy: ⁠ stremio-mediaflow ⁠
•⁠  ⁠(opțional) EasyProxy: ⁠ stremio-easyproxy ⁠

---

## 1) AIOStreams

Image: ⁠ ghcr.io/viren070/aiostreams:latest ⁠  
Port (internal): ⁠ 3000 ⁠ (HTTP, public, port name ⁠ http ⁠)  

Runtime variables (obligatorii):
•⁠  ⁠⁠ BASE_URL=https://REPLACE_WITH_NORTHFLANK_URL ⁠
•⁠  ⁠⁠ SECRET_KEY=REPLACE_WITH_64_HEX ⁠ (generează cu ⁠ openssl rand -hex 32 ⁠)

Runtime variables (opționale):
•⁠  ⁠⁠ LOG_LEVEL=info ⁠
•⁠  ⁠⁠ ADDON_PASSWORD=... ⁠ (dacă vrei parolă la instalare/folosire)

Storage (recomandat):
•⁠  ⁠Volume mount: ⁠ /app/data ⁠

---

## 2) AIOMetadata (+ Redis)

AIOMetadata image: ⁠ ghcr.io/cedya77/aiometalatest ⁠  
Port (internal): ⁠ 3232 ⁠ (HTTP, public, port name ⁠ http ⁠)  

Redis:
•⁠  ⁠Recomandat pe Northflank: Redis Addon (nu container redis manual).

Runtime variables:
•⁠  ⁠⁠ HOST_NAME=https://REPLACE_WITH_NORTHFLANK_URL ⁠
•⁠  ⁠⁠ REDIS_URL=REPLACE_FROM_REDIS_ADDON ⁠ (ex. ⁠ redis://:password@host:6379/0 ⁠)
•⁠  ⁠⁠ DATABASE_URI=sqlite:///app/addon/data/aiometadata.db ⁠
•⁠  ⁠⁠ TMDB_API_KEY=REPLACE_WITH_TMDB_KEY ⁠

Storage (recomandat):
•⁠  ⁠Volume mount: ⁠ /app/addon/data ⁠

---

## 3) Mediaflow-proxy

Image: ⁠ mhdzumair/mediaflow-proxy:latest ⁠  
Port (internal): ⁠ 8888 ⁠ (HTTP, public, port name ⁠ http ⁠)  

Runtime variables:
•⁠  ⁠⁠ API_PASSWORD=REPLACE_WITH_STRONG_PASSWORD ⁠

---

## 4) EasyProxy (opțional)

Image: ⁠ justsml/easy-proxy:latest ⁠  
Port (internal): ⁠ 5050 ⁠ (HTTP, public, port name ⁠ http ⁠)  

Runtime variables:
•⁠  ⁠⁠ PROXY_USERNAME=admin ⁠
•⁠  ⁠⁠ PROXY_PASSWORD=REPLACE_WITH_PASSWORD ⁠
•⁠  ⁠⁠ PROXY_PORT=5050 ⁠
•⁠  ⁠⁠ PROXY_HOST=REPLACE_WITH_PUBLIC_DOMAIN_OR_IP ⁠

---

## După deploy (foarte important)
1) Copiezi URL-urile publice generate de Northflank și le pui în:
•⁠  ⁠AIOStreams: ⁠ BASE_URL=https://... ⁠
•⁠  ⁠AIOMeta ⁠ HOST_NAME=https://... ⁠

2) Orice parolă / API key se pune în Northflank ca Runtime variables / Secrets, NU în repo.
