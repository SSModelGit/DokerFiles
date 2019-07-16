FROM arm64v8/ubuntu:16.04
RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
    locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
RUN apt-get install -y git && rm -rf /var/lib/apt/* /tmp/* /var/tmp/*

CMD ["bash"]
