#!/bin/bash
cd aiostreams && docker compose down && docker compose up -d --build
cd ../aiometadata && docker compose down && docker compose up -d --build
cd ../easyproxy && docker compose down && docker compose up -d --build
cd ../npm && docker compose down && docker compose up -d --build
docker system prune -f
echo "Deploy complet!"
