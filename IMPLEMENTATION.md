# Implementation Details

## What it is used

A [docker with notebook](https://github.com/Unipisa/ocaml-jupyterhub-dockerspawner) to be loaded on [JupyterHub](https://github.com/jupyterhub/jupyterhub) via [Docker-spawner](https://github.com/jupyterhub/dockerspawner).

## How it is used

On JupyterHub server

```bash
mkdir /jup_data/
cd /jup_data/
git clone https://github.com/Unipisa/Paradigmi.git
docker pull scatenag/ocaml-jupyterhub-dockerspawner:latest
docker tag ocaml-jupyterhub-dockerspawner:latest paradigmi
```

In `jupyterhub_config.py`

```bash
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'
c.DockerSpawner.image_whitelist = {
    'Paradigmi (Ocaml)' : 'paradigmi'
}
c.DockerSpawner.name_template = '{prefix}-{username}-{imagename}-{servername}'
c.DockerSpawner.volumes = { '{prefix}-{username}-paradigmi-{servername}':'/home/jovyan', '/jup_data/Paradigmi': {"bind": '/home/jovyan/Paradigmi', "mode": "ro"} }
```

Cron `crontab -e`

```bash
*/15 * * * * su -s /bin/sh nobody -c 'cd /jup_data/Paradigmi && /usr/bin/git stash && /usr/bin/git pull'
```
