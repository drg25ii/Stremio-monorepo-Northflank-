# Northflank deploy (quick steps)

## Reguli
•⁠  ⁠Public ports: doar HTTP/HTTP2.
•⁠  ⁠Port name: folosește ⁠ http ⁠ la toate.
•⁠  ⁠Domeniu public generat: ⁠ [port-name]--[service-name]--[random-string].code.run ⁠ (HTTPS automat).

## AIOStreams (stremio-aiostreams)
Create service → Deployment → Deploy a Docker image
•⁠  ⁠Image: ⁠ ghcr.io/viren070/aiostreams:latest ⁠
•⁠  ⁠Service name: ⁠ stremio-aiostreams ⁠
•⁠  ⁠Port: 3000, Protocol: HTTP, Public: true, Port name: http
•⁠  ⁠Env (runtime): ⁠ BASE_URL ⁠, ⁠ SECRET_KEY ⁠, (optional ⁠ LOG_LEVEL ⁠, ⁠ ADDON_PASSWORD ⁠)
•⁠  ⁠Volume (recommended): mount ⁠ /app/data ⁠

## AIOMetadata (stremio-aiometadata)
1) Create addon → Redis (recommended)
2) Create service → Deployment → Deploy a Docker image
•⁠  ⁠Image: ⁠ ghcr.io/cedya77/aiometalatest ⁠
•⁠  ⁠Service name: ⁠ stremio-aiometadata ⁠
•⁠  ⁠Port: 3232, Protocol: HTTP, Public: true, Port name: http
•⁠  ⁠Env (runtime): ⁠ HOST_NAME ⁠, ⁠ REDIS_URL ⁠ (din addon), ⁠ DATABASE_URI ⁠, ⁠ TMDB_API_KEY ⁠
•⁠  ⁠Volume (recommended): mount ⁠ /app/addon/data ⁠

## Mediaflow-proxy (stremio-mediaflow)
Create service → Deployment → Deploy a Docker image
•⁠  ⁠Image: ⁠ mhdzumair/mediaflow-proxy:latest ⁠
•⁠  ⁠Service name: ⁠ stremio-mediaflow ⁠
•⁠  ⁠Port: 8888, Protocol: HTTP, Public: true, Port name: http
•⁠  ⁠Env (runtime): ⁠ API_PASSWORD ⁠

## EasyProxy (stremio-easyproxy) (optional)
Create service → Deployment → Deploy a Docker image
•⁠  ⁠Image: ⁠ justsml/easy-proxy:latest ⁠
•⁠  ⁠Service name: ⁠ stremio-easyproxy ⁠
•⁠  ⁠Port: 5050, Protocol: HTTP, Public: true, Port name: http
•⁠  ⁠Env (runtime): ⁠ PROXY_USERNAME ⁠, ⁠ PROXY_PASSWORD ⁠, ⁠ PROXY_PORT ⁠, ⁠ PROXY_HOST ⁠
