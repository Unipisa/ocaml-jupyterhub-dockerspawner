
FROM jupyterhub/singleuser
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get --yes update
RUN apt-get install --yes apt-utils
RUN apt-get install --yes apt-file

RUN apt-file update

RUN DEBIAN_FRONTEND="noninteractive" sudo apt-get --yes install vim nano
RUN DEBIAN_FRONTEND="noninteractive" sudo apt-get --yes install wget curl
RUN DEBIAN_FRONTEND="noninteractive" sudo apt-get --yes install iputils-ping
RUN DEBIAN_FRONTEND="noninteractive" sudo apt-get --yes install git

ENV CONDA_DIR /opt/miniconda3
RUN curl -s -L https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh > /tmp/anaconda.sh
RUN sh /tmp/anaconda.sh -b -p ${CONDA_DIR}
RUN rm /tmp/anaconda.sh
RUN echo "export PATH=${CONDAPFX}/bin:$PATH" >> ${HOME}/.bashrc
RUN ${CONDA_DIR}/bin/conda update -n base -c defaults conda
RUN ${CONDA_DIR}/bin/conda install --yes -c conda-forge gosu tini


ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome
RUN DEBIAN_FRONTEND="noninteractive" TZ="Europe/Moscow"  sudo -E apt-get install -y tzdata
RUN DEBIAN_FRONTEND="noninteractive" sudo -E apt-get --yes install python3-pip ocaml opam libgmp-dev pkg-config libzmq3-dev vim
RUN pip3 install notebook
RUN pip3 install RISE
RUN pip3 install jupyter
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextensions install --system

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

RUN git clone https://github.com/Unipisa/Paradigmi.git .

USER jovyan
WORKDIR $HOME
