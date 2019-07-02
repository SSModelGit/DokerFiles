From ros:kinetic-robot-xenial
RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
    locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
RUN apt-get install -y ros-kinetic-mavros* ros-kinetic-joy && \
	mkdir -p /catkin_ws/src/ && cd /catkin_ws/src/ && \
	git clone https://github.com/SSModelGit/bluerov-ros-pkg.git && cd bluerov-ros-pkg && git checkout arl && \
	wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh && \
	bash install_geographiclib_datasets.sh && \
	rm install_geographiclib_datasets.sh && rm -rf /var/lib/apt/* /tmp/* /var/tmp/*

RUN cd /catkin_ws/ && \
		source /opt/ros/kinetic/setup.bash && \
		catkin_make

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD /bin/bash "roslaunch bluerov-ros-pkg apm.launch"
