# TerrariaDockerServer
Official Terraria server in a docker container. It is the same server as shipped in the steam installation but the Dockerfile will download it from `https://www.terraria.org/system/dedicated_servers/archives/<PATH_TO_VERSION>`

# HowTo
1. Download or clone this repository 
2. Adapt the environment variables in the docker-compose.yaml (For more information take a look [here](https://terraria.gamepedia.com/Server))
    - Important are the following
        - WORLD The name of your world located in the `worlds` directory besides the `config` directory
        - PASSWORD The password for your server. Leave blank to don't set one
        - MOTD Message of the day on joining the server
        - LANGUAGE For exampole a normal language code is `de/DE` but we have to escape it here! `de/DE` -> `de\/DE` 
        - AUTOSAVE_INTERVAL Autosave interval for the map. It should save on `docker-compose down`, too
        - START_PARAMETER Additional start parameters for the server (For more information take a look [here](https://terraria.gamepedia.com/Server))
3. Run `docker-compose up` oder `docker-compose up -d` for detached mode