# Won't specify version because this container is for test
FROM garethflowers/svn-server
COPY project-in-svn /var/opt/svn/project-in-svn
COPY ./entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
ENTRYPOINT ["entrypoint"]
CMD ["/usr/bin/svnserve", "--daemon", "--foreground", "--root", "/var/opt/svn"]