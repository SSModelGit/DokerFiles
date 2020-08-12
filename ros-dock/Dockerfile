From ros:melodic-robot-bionic
RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
	locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
RUN apt-get update && apt-get install -y \
	git	curl wget sudo libgl1-mesa-glx libgl1-mesa-dri mesa-utils unzip inetutils-ping \
	bison flex build-essential g++ libfl-dev \
	libxrender1 libxtst6 libxi6 \
	autoconf gperf \
	tcl-dev tk-dev libgtk2.0-dev software-properties-common

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
	&& install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/ && \
	sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' \
	&& apt -y install apt-transport-https && apt update && apt -y install code && \
	apt install -y emacs25

RUN apt install -y ros-melodic-mavros* ros-melodic-joy \
	python-pip python-dev build-essential \
	python-rosinstall python-rosinstall-generator python-wstool \
	ros-melodic-rosemacs \
	&& pip install --upgrade python pip virtualenv && \
	apt autoremove && rm -rf /var/likb/apt/lists/*

# setup entrypoint
COPY ./ros_entrypoint.sh /ros_entrypoint.sh
RUN chmod +x /ros_entrypoint.sh

RUN echo "root:olindock" | chpasswd
RUN groupadd olin-dock

RUN useradd -g olin-dock -ms /bin/bash gen && \
	usermod -G dialout gen
USER gen
WORKDIR /home/gen

RUN	cd /home/gen && \
	rosdep update && mkdir /home/gen/.virtualenvs && \
	virtualenv -p python2.7 --system-site-packages /home/gen/.virtualenvs/rosk && \
	echo "export PYTHONPATH=\$PYTHONPATH:catkin_ws" >> /home/gen/.virtualenvs/rosk/bin/activate && \
	echo "alias rosk='source /home/gen/.virtualenvs/rosk/bin/activate'" >> /home/gen/.bashrc \
	&& echo "rosk" >> /home/gen/.bashrc

RUN mkdir -p /home/gen/.emacs.d/themes && \
	wget https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el && \
	mv zenburn-theme.el ~/.emacs.d/themes/ && \
	echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc && cd /home/gen/.emacs.d/ && \
	wget https://raw.githubusercontent.com/SSModelGit/configs/master/commonSetup/init.el && \
	mkdir -p /home/gen/.emacs.d/pylisp && cd /home/gen/.emacs.d/pylisp/ && \
	wget https://raw.githubusercontent.com/SSModelGit/configs/master/custom-emacs/py-config.el && cd /home/gen/.emacs.d/ && \
	echo "" >> /home/gen/.emacs.d/init.el && \
	echo ";; Load Python setup from custom config source file" >> /home/gen/.emacs.d/init.el && \
	echo "(load-file \"~/.emacs.d/pylisp/py-config.el\")" >> /home/gen/.emacs.d/init.el && \
	echo "" >> /home/gen/.emacs.d/init.el && \
	echo "(add-to-list 'load-path \"/opt/ros/melodic/share/emacs/site-lisp\")" >> ~/.emacs.d/init.el && \
	echo "(require 'rosemacs-config)" >> ~/.emacs.d/init.el

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
