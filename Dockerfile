# Dockerfile plutôt optimisé par un apprenant mais en deux étapes
# Taille de l'image buildé: 20 Mo
# MINI-PROJET JENKINS COMMUN
# https://github.com/eazytraining/jenkins-training/tree/master/Mini-projet
FROM debian:bullseye-20240722-slim as files
LABEL maintainer='rabinauget@gmail.com'
RUN DEBIAN_FRONTEND=noninteractive apt update && apt install git -y && apt clean -y && rm -Rf /var/lib/apt/lists/*
RUN mkdir /opt/files
RUN git clone https://github.com/diranetafen/static-website-example.git /opt/files/

FROM nginx:alpine3.20-slim
LABEL maintainer='rabinauget@gmail.com'
COPY --from=files /opt/files/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
