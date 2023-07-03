FROM ubuntu
LABEL "Author"="Sahil Rana"
LABEL "Task"="Building the image & Deploying to k8 cluster"
RUN apt update -y
RUN apt install apache2 -y
RUN apt install apache2-utils -y
CMD ["apachectl", "-D", "FOREGROUND"]
WORKDIR /var/www/html
COPY app /var/www/html/
