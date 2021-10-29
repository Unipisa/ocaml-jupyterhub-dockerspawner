# How to use OCaml on JupyterHub@Unipi
- [How to use OCaml on JupyterHub@Unipi](#how-to-use-ocaml-on-jupyterhubunipi)
      - [Connect to the server](#connect-to-the-server)
      - [Login with you credential](#login-with-you-credential)
      - [Select the `Paradigmi (OCaml)` image](#select-the-paradigmi-ocaml-image)
      - [Notebook Folders and Launcher](#notebook-folders-and-launcher)
      - [Use the Jupyter Notebook interface](#use-the-jupyter-notebook-interface)
      - [Disclaimer](#disclaimer)
#### Connect to the server

Go to <https://jupyterhub.polo2.sid.unipi.it:8000/> or <https://jupyterhubfm.df.unipi.it:8000/>

![connect to the server](etc/pic/0.png)

#### Login with you credential

Use your [credential](https://autenticazione.unipi.it/) (username is the email address part before the `@`)

![login](etc/pic/1.png)

#### Select the `Paradigmi (OCaml)` image

![select image](etc/pic/2.png)

#### Notebook Folders and Launcher

![folders](etc/pic/3.png)

You can find two folders:

- `Paradigmi` is the folder containing the cloned [Paradigmi repository](https://github.com/Unipisa/Paradigmi) updated every 15 minutes.  
The folder is read-only.

![paradigmi folder](etc/pic/4.png)
![paradigmi folder details](etc/pic/5.png)

- `work` is your personal working directory. You can write here and play freely. The data is persistent, saved in your personal container and you will find saved data on subsequent logins.

![work folder](etc/pic/7.png)

Inside the notebook you can run the proposed launchers, for instance you can run a terminal

![terminal](etc/pic/6a.png)

#### Use the Jupyter Notebook interface

You can switch to the Jupyter Notebook interface replacing `/lab?` with `/tree?` in the url

![notebook](etc/pic/8.png)

#### Disclaimer 

**These resources are shared and their use i **monitored**: be considerate in your use.** :warning: 

