FROM bmanuel/mysql-5.1:latest

RUN echo "federated=1" >> /etc/mysql/my.cnf && \
sed -i 's/\/var\/lib\/mysql/\/var\/lib\/mysql\/data/' /etc/mysql/my.cnf && \
sed -i 's/\/var\/lib\/mysql/\/var\/lib\/mysql\/data/' /entrypoint.sh

EXPOSE 3306
