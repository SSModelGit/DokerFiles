From ubuntu:bionic

ENV HOME /home/gen
WORKDIR /home/gen

RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
	locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN export uid=1000 gid=1000 && \
	mkdir -p /home/gen && \
	mkdir -p /etc/sudoers.d && \
	echo "gen:x:${uid}:${gid}:Developer,,,:/home/gen:/bin/bash" >> /etc/passwd && \
	echo "gen:x:${uid}:" >> /etc/group && \
	echo "gen ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/gen && \
	chmod 0440 /etc/sudoers.d/gen && \
	chown ${uid}:${gid} -R /home/gen && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get -y --no-install-recommends upgrade && \
	# install a whole lot of dependencies
	apt-get install -y --no-install-recommends git curl wget sudo libgl1-mesa-glx \
	libgl1-mesa-dri mesa-utils unzip inetutils-ping bison flex build-essential g++ \
	libfl-dev libxrender1 libxtst6 libxi6 autoconf gperf tcl-dev tk-dev libgtk2.0-dev \
	software-properties-common python-pip python-dev build-essential && \
	pip install --upgrade python pip virtualenv && \
	# Install Emacs
	add-apt-repository ppa:kelleyk/emacs && \
	apt-get -y install emacs25 && \
# Install old Python
	sudo add-apt-repository ppa:deadsnakes/ppa && sudo apt-get update && \
	sudo apt-get -y --no-install-recommends install python3.5 && \
	# clean up temp files and caches
	apt-get -y autoremove && \
	apt-get -y clean && \
	rm -rf /tmp/* && \
	rm -rf /var/likb/apt/lists/*

ENV DISPLAY :1.0

USER gen
RUN cd /home/gen &&	mkdir /home/gen/.virtualenvs && \
	virtualenv -p python3.6 --system-site-packages /home/gen/.virtualenvs/pybar && \
	virtualenv -p python3.5 --system-site-packages /home/gen/.virtualenvs/pyfoo && \
	virtualenv -p python2.7 --system-site-packages /home/gen/.virtualenvs/pymod && \
	echo "alias pybar='source /home/gen/.virtualenvs/pybar/bin/activate'" >> /home/gen/.bashrc && \
	echo "alias pyfoo='source /home/gen/.virtualenvs/pyfoo/bin/activate'" >> /home/gen/.bashrc && \
	echo "alias pymod='source /home/gen/.virtualenvs/pymod/bin/activate'" >> /home/gen/.bashrc && \
	mkdir -p /home/gen/.emacs.d/themes && \
	wget https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el && \
	mv zenburn-theme.el ~/.emacs.d/themes/ && \
	echo "alias em='emacs -q -l ~/.emacs.d/init.el'" >> ~/.bashrc && cd /home/gen/.emacs.d/ && \
	wget https://raw.githubusercontent.com/SSModelGit/configs/master/commonSetup/init.el && \
	mkdir -p /home/gen/.emacs.d/pylisp && cd /home/gen/.emacs.d/pylisp/ && \
	wget https://raw.githubusercontent.com/SSModelGit/configs/master/custom-emacs/py-config.el && cd /home/gen/.emacs.d/ && \
	echo "" >> /home/gen/.emacs.d/init.el && \
	echo ";; Load Python setup from custom config source file" >> /home/gen/.emacs.d/init.el && \
	echo "(load-file \"~/.emacs.d/pylisp/py-config.el\")" >> /home/gen/.emacs.d/init.el
	# echo "" >> /home/gen/.emacs.d/init.el && \
	# mkdir -p /home/gen/.emacs.d/javalisp/ && cd /home/gen/.emacs.d/javalisp/ && \
	# wget https://raw.githubusercontent.com/SSModelGit/configs/master/custom-emacs/java-config.el && \
	# echo ";; Load Java setup from custom config source file" >> ~/.emacs.d/init.el && \
	# echo "(load-file \"~/.emacs.d/javalisp/java-config.el\")" >> ~/.emacs.d/init.el

CMD ["bash"]
