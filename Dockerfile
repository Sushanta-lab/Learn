FROM centos
RUN yum install python2 -y
COPY ./test.sh /app/

