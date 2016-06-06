FROM wdj/centos:latest

MAINTAINER wdj wapznw@gmail.com

COPY run.sh /run.sh
COPY set_root_pw.sh /set_root_pw.sh
RUN chkconfig --level 123456 sshd on && chmod +x /*.sh && yum clean all

EXPOSE 22

ENTRYPOINT ["/run.sh"]
