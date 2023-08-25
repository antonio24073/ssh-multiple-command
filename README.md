# SSH Multiple Commands

## Dependencies

- Docker
- Docker compose

## Installing

Copy and rename `servers-example.txt` to `servers.txt`. Configure it.

## Running

```shell
docker compose -f "docker-compose.yml" up -d --build
```