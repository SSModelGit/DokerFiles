From ubuntu:xenial
RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
	locale-gen en_US.UTF-8 && rm -rf /var/likb/apt/lists/*

ENV LANG en_US.UTF-8
RUN echo "root:olindock" | chpasswd
RUN groupadd olin-dock

RUN useradd -g olin-dock -ms /bin/bash gen
USER gen
WORKDIR /home/gen

CMD ["bash"]
