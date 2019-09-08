From ros:kinetic-robot-xenial
RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
    locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
RUN apt-get update && apt-get install -y \
      git \
	    curl \
	    wget \
	    sudo \
	    libgl1-mesa-glx \
	    libgl1-mesa-dri \
	    mesa-utils \
      unzip \
      inetutils-ping \
	    && rm -rf /var/likb/apt/lists/*

# setup entrypoint
COPY ./ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
