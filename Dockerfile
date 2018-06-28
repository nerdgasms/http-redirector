FROM registry.access.redhat.com/rhel7

# YOU CAN ALSO SET ENV VARIABLES
# ENV WORKER_CONNECTIONS 1024
# ENV HTTP_PORT 80
# ENV REDIRECT https://www.google.com/

COPY nginx.repo /etc/yum.repos.d/

RUN echo "hi" && ls /etc/yum.repos.d/

RUN yum-config-manager --disable rhel-7-server-htb-rpms && \
    yum-config-manager --enable rhel-7-server-rpms \
      rhel-7-server-extras-rpms rhel-7-server-rh-common-rpms rhel-ha-for-rhel-7-server-rpms \
      rhel-7-server-openstack-beta-rpms

RUN yum clean all && \
    rm -rf /var/cache/yum && \
    yum install -y nginx

COPY nginx-boot.sh /sbin/nginx-boot

RUN chmod +x /sbin/nginx-boot

EXPOSE 80

CMD [ "/sbin/nginx-boot" ]
