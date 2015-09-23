FROM quay.io/ukhomeofficedigital/mysql:v0.5.0

COPY *.sh /

ENV MYSQL_PORT 3306
ENV DEFAULT_PW changeme

ENTRYPOINT ["/entrypoint.sh"]
CMD []