# ocaml-jupyterlab-for-docker-spawner

A docker with jupyter notbook to be loaded on jupyterhub via docker-spawner.

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
- [ ] Git clone on load or mount directly GitHub repo
- [ ] Add more library (as [docker-ocaml-jupyter-datascience](https://github.com/akabe/docker-ocaml-jupyter-datascience))
- [ ] ... 