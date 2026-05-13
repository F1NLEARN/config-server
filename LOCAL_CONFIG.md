# Local Config Server

By default, `config-server` reads configuration from the remote Git repository:

```text
https://github.com/F1NLEARN/configs
```

That means local edits in `../configs` are not served unless the config server is started with the native backend.

Run local config server from this directory:

```bash
CONFIG_LOCAL_REPO_PATH=/Users/seongjun/Desktop/spartacoding/finlearn/configs \
SPRING_PROFILES_ACTIVE=native \
sh gradlew bootRun
```

Then verify the effective local simulation-service datasource:

```bash
curl http://localhost:8888/simulation-service/local
```

For local development, the `simulation-service-local.yml` datasource supports:

```text
DB_HOST
DB_PORT
DB_NAME
DB_USERNAME
DB_PASSWORD
```
