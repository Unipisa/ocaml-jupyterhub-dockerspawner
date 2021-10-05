# OCaml Jupyterlab for Docker-spawner: Documentation For [Paradigmi](https://github.com/Unipisa/Paradigmi)

[Unipi](www.unipi.it) users can use https://jupyterhub.polo2.sid.unipi.it:8000/ for the course [Paradigmi di Programmazione](https://esami.unipi.it/esami2/programma.php?noframe=1&c=48837&amp;aa=2021&amp;cid=103&amp;did=13) with material of [Paradigmi](https://github.com/Unipisa/Paradigmi).

- log in with your credential
- select image named Paradigmi

## What it is used
A [docker with notebook](https://github.com/Unipisa/ocaml-jupyterhub-dockerspawner) to be loaded on [JupyterHub](https://github.com/jupyterhub/jupyterhub) via [Docker-spawner](https://github.com/jupyterhub/dockerspawner).

## How it is used

On JupyterHub server
```
mkdir /jup_data/
cd /jup_data/
git clone https://github.com/Unipisa/Paradigmi.git
docker pull scatenag/ocaml-jupyterhub-dockerspawner:latest
docker tag ocaml-jupyterhub-dockerspawner:latest paradigmi
```

In `jupyterhub_config.py` 
```
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'
c.DockerSpawner.image_whitelist = {
    'Paradigmi (Ocaml)' : 'paradigmi'
}
c.DockerSpawner.name_template = '{prefix}-{username}-{imagename}-{servername}'
c.DockerSpawner.volumes = { '{prefix}-{username}-paradigmi-{servername}':'/home/jovyan', '/jup_data/Paradigmi': {"bind": '/home/jovyan/Paradigmi', "mode": "ro"} }
```

Cron `crontab -e`
```
*/15 * * * * su -s /bin/sh nobody -c 'cd /jup_data/Paradigmi && /usr/bin/git pull'
```
