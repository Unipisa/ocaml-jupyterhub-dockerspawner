# OCaml Jupyterlab for Docker-spawner

A docker with notebook to be loaded on [JupyterHub](https://github.com/jupyterhub/jupyterhub) via [Docker-spawner](https://github.com/jupyterhub/dockerspawner).

## How to use

On JupyterHub server
```
docker pull scatenag/ocaml-jupyterhub-dockerspawner:latest
```

In `jupyterhub_config.py` 
```
c.JupyterHub.spawner_class = 'dockerspawner.DockerSpawner'
c.DockerSpawner.image_whitelist = {
    'test' : 'scatenag/ocaml-jupyterhub-dockerspawner'
}
```

## TODO

- [x] First working version
- [x] Push to DockerHub via GitHub Actions ([docker-image.yml](.github/workflows/docker-image.yml))
- [ ] Make git cloned repository parametric (instead of fixed to [Paradigmi](https://github.com/Unipisa/Paradigmi)]
- [ ] Git clone on load or mount directly GitHub repo
- [ ] Add more library (as [docker-ocaml-jupyter-datascience](https://github.com/akabe/docker-ocaml-jupyter-datascience))
- [ ] ... 
