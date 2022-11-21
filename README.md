
#  **Install on windows**

**Requirements**
> you must have NVIDIA Drivers CUDA Version: 12.0
> you can check it by running this command in Power Shell

`$ nvidia-smi `
 Power Shell You should get a response similar to this:
`
| NVIDIA-SMI 526.98 Driver Version: 526.98 CUDA Version: 12.0 |
`
if the Cuida is less than 12, update the drivers of your Nvidia graphics card.

------------


>To install on windows you must install Docker Desktop & restart
>Docker Desktop: https://www.docker.com/products/docker-desktop/

>you should now download the Linux Kernel Update Package on WSL 2 for x64 machines:
>https://learn.microsoft.com/es-es/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package
>you can find it here or download it directly from here:
>https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

>To install Ubuntu distro for windows
>Ubuntu GPU https://www.microsoft.com/store/productId/9PDXGNCFSCZV

>Enabling Docker support in WSL 2 distros and config to default is Ubuntu in WSL 2
>WSL: https://docs.docker.com/desktop/windows/wsl/
>running this commands in Power Shell
>To check the WSL mode, run: `$ wsl.exe -l -v `
> ` wsl.exe --set-default-version 2 `
> I haven't closed this console yet.

> go to Docker Desktop an restart.
> go to Settings > Resources > WSL Integration.
> The Docker-WSL integration will be enabled on your default WSL distribution. To change your default WSL distro, run.

> go back to Power Shell console and select ubuntu
>`$ wsl --set-default ubuntu `

# Docker Build and Run

> It must be in the same folder where the Dockerfile is, and it must create an empty folder called **volumen**

-  StableDiff-eden - Directory
- - volumen
- - Dockerfile

> open a Power Shell in this folder.

> First compile the image
>    `$   docker build -t  eden .`
> then run using this command
>    `$  docker container run -it -v D:/contenedores/dockerStableDiff2/volumen:/home/yubi/ -p 9080:7860 --gpus=all eden `

# AUTOMATIC1111/stable-diffusion-webui

You must do multiple launches from the same container.

In the first launch, the dependencies and libraries in linux and the Nvidia/Ubuntu image will be installed, after this the container will create a file in the shared volume volumen -> the folder we created earlier.
automatically execute the webui.sh file inside the container.
the stable diff folders and an internal python environment should be created automatically.


When the process is finished, a message will appear asking you to enter a .ckpt model, we stop the container, we download a model from here, or we can use another .ckpt model that we have.

https://huggingface.co/CompVis/stable-diffusion-v1-4?text=an+insect+robot+preparing+a+delicious+meal

You must have an account and accept the terms of downloading the model.

This ckpt model should be put in the shared folder inside
\volumen\stable-diffusion-webui\models\Stable-diffusion

Container must be start

this time it installs all the other libraries and if the process is correct you should be able to see in the docker console that you can now load the .ckpt model

 `Running on local URL:  http://0.0.0.0:7860`
>try accessing the following address from a browser
>http://localhost:9080/

>If you cannot access and the message that comes out has this address, you should do the next step, if you can access stablediff you can skip it
`Running on local URL:  http://127.0.0.1:7860`

# WebUI network error
>if you see this message
`Running on local URL:  http://127.0.0.1:7860`
>instead of this message
`Running on local URL:  http://0.0.0.0:7860`

>you will need to modify the file
> /stable-diffusion-webui/webui.py

> you will need to find and replace 127.0.0.1 with 0.0.0.0 save the file. (remember to make these changes carefully or you may break the file).
> run the container again.
> this should fix the problem

>You should now be able to log in to http://localhost:9080/
>and access stable diff

# To run it again
>You must go to docker > containers and click on execute, you can always access from the address from a browser to
>http://localhost:9080/

# Thanks to
- TODO Game Dev Discord Community the people who helped fix problems with libs and image creation.
- to all my followers who helped me to solve the problems with docker.
-and to the creators of https://github.com/AUTOMATIC1111/stable-diffusion-webui

------------

### Enjoy it Yubi
