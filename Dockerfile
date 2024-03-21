FROM debian

LABEL maintainer="FMMT666 fmmt666@users.noreply.github.com"


RUN  apt-get -y update && \
     apt-get -y upgrade && \
     apt-get -y install cowsay fortune joe mc wget && \
     echo "alias d='ls -la --color'" >> /root/.bashrc && \
     # links are not directly accessible from web page anymore; analysed via browser web tools
     wget -O tserver.zip "https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip" && \
     unzip tserver.zip && \
     rm tserver.zip && \
     rm -rf /1449/Mac && \
     rm -rf /1449/Windows &&\
     chmod +x '/1449/Linux/TerrariaServer.bin.x86_64' && \

VOLUME /terraria

COPY runthis.sh       /
COPY serverconfig.txt /

ENTRYPOINT ["/runthis.sh"]
