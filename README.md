# docker-routedns

Docker image for running [routedns](https://github.com/folbricht/routedns)

## Usage

```yaml
  routedns:
    container_name: routedns
    image: wiserain/routedns
    restart: always
    logging:
      driver: json-file
    network_mode: "bridge"
    ports:
      - 53/tcp
      - 53/udp
    command: # CLI arguments
      - /config/config.toml
      # or
      # - /config/*.toml
    volumes:
      - ${DOCKER_ROOT}/routedns/config:/config
```
