FROM nvidia/cuda:11.8.0-runtime-ubuntu22.04
USER root
RUN apt update
RUN apt install -y wget git python3 python3-venv
RUN apt install sudo
RUN apt-get install ffmpeg libsm6 libxext6 -y
RUN echo "====================== RED =================================="
RUN apt install net-tools
RUN apt install apache2 -y

RUN echo "====================== Montando y creando Usuario [yubi]  =================================="
RUN useradd -ms /bin/bash yubi
WORKDIR /home/yubi/
VOLUME /home/yubi/

#EXPOSE 7860
#EXPOSE 9181
CMD rm ./webui.sh && wget https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh && chmod -R 777 /home/yubi/  && sudo -u yubi ./webui.sh

#Compilar
    #docker build -t  eden .
#Ejecutar
    #docker container run -it -v D:/contenedores/dockerStableDiff2/volumen:/home/yubi/ -p 9080:7860 --gpus=all eden 