
FROM jupyterhub/singleuser
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome

USER root

RUN apt-get --yes update
RUN apt-get --y install vim nano wget curl iputils-ping cron git tzdata python3-pip ocaml opam libgmp-dev pkg-config libzmq3-dev

RUN pip3 install notebook
RUN pip3 install RISE
RUN pip3 install jupyter
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextensions install --system

RUN echo "*/30 * * * * su -s /bin/sh nobody -c 'cd /home/jovyan/Paradigmi && /usr/bin/git pull'" >> /etc/cron.d/git-pull
RUN chmod 0644 /etc/cron.d/git-pull &&
    crontab /etc/cron.d/git-pull

USER jovyan
RUN opam init --disable-sandboxing
RUN eval $(opam env)
RUN opam update
RUN pip3 install jupyter
RUN pip3 install nbgitpuller
RUN pip3 install jupyterlab_github
RUN opam install -y jupyter
RUN eval $(opam env) && ocaml-jupyter-opam-genspec
RUN jupyter kernelspec install --user --name ocaml-jupyter "$(opam var share)/jupyter"
RUN jupyter nbextension enable splitcell/splitcell

RUN git clone https://github.com/Unipisa/Paradigmi.git

USER jovyan
WORKDIR $HOME
