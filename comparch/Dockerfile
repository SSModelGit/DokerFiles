From ubuntu:xenial
RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
	locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
RUN apt-get update && apt-get install -y \
	git	curl wget sudo libgl1-mesa-glx libgl1-mesa-dri mesa-utils unzip \
	bison flex build-essential g++ libfl-dev \
	libxrender1 libxtst6 libxi6 \
	autoconf gperf \
	tcl-dev tk-dev libgtk2.0-dev \
	&& rm -rf /var/likb/apt/lists/*

RUN echo "root:olindock" | chpasswd
RUN groupadd olin-dock

RUN useradd -g olin-dock -ms /bin/bash comparch
USER comparch
WORKDIR /home/comparch

CMD ["bash"]
