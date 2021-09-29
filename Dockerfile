
FROM jupyterhub/singleuser
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome

USER root

RUN apt-get -y update
RUN apt-get -y install -qq --force-yes apt-utils apt-file
RUN apt-get -y install -qq --force-yes vim nano wget curl iputils-ping cron git tzdata python3-pip ocaml opam libgmp-dev pkg-config libzmq3-dev

RUN pip3 install notebook
RUN pip3 install RISE
RUN pip3 install jupyter
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextensions install --system

COPY git-pull /etc/cron.d/git-pull
RUN chmod 0644 /etc/cron.d/git-pull && crontab /etc/cron.d/git-pull
RUN crontab /etc/cron.d/git-pull
RUN touch /var/log/cron.log
RUN cron && tail -f /var/log/cron.log

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
