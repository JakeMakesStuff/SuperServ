FROM microsoft/dotnet:2.1.502-sdk-stretch
MAINTAINER jake@gealer.email
EXPOSE 8080
WORKDIR /var/superserv
RUN cd /var/superserv
COPY . .
RUN tr -d '\r' < build.sh > build.fix.sh
RUN rm build.sh
RUN mv build.fix.sh build.sh
RUN sh ./build.sh
RUN cd ./releases/linux/
RUN chmod 777 ./SuperServ
ENTRYPOINT ./SuperServ
