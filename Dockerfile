FROM node:0.10.36
RUN apt-get update && apt-get install -y mongodb-clients
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y ssh
RUN ln -sf /usr/share/zoneinfo/IST /etc/localtime
#COPY SIA /opt/
COPY SIA /opt/SIA
WORKDIR /opt/SIA
RUN npm install
RUN mkdir logs && chmod +x logs -R
EXPOSE 27017
EXPOSE 1337
ADD run.sh ./run.sh
RUN chmod +x ./run.sh
CMD ["./run.sh"]

