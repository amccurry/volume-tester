FROM centos
COPY bin/ /
RUN /install.sh
CMD [ "/run.sh" ]
