From ubuntu:xenial
RUN apt-get -y clean && \
    apt-get update && apt-get -y install locales && \
	locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN	apt-get update &&	apt-get install -y \
	git	curl wget sudo libgl1-mesa-glx libgl1-mesa-dri mesa-utils unzip inetutils-ping \
	bison flex build-essential g++ libfl-dev \
	libxrender1 libxtst6 libxi6 \
	autoconf gperf \
	software-properties-common \
	python-dev python-pip virtualenv \
	cmake ant swig zlib1g-dev libboost-dev jcc gfortran subversion python-tk openjdk-8-jdk \
	tcl-dev tk-dev libgtk2.0-dev && \
	for deb in deb deb-src; \
	do echo "$deb http://build.openmodelica.org/apt `lsb_release -cs` stable"; \
	done | tee /etc/apt/sources.list.d/openmodelica.list && \
	wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- | apt-key add - && \
	apt update && apt install -y openmodelica && rm -rf /var/likb/apt/lists/*

RUN echo "root:olindock" | chpasswd && groupadd olin-dock && \
	useradd -g olin-dock -ms /bin/bash mod
USER mod
WORKDIR /home/mod

RUN cd /home/mod &&	mkdir /home/mod/.virtualenvs && \
	virtualenv -p python3.5 --system-site-packages /home/mod/.virtualenvs/pybar && \
	virtualenv -p python2.7 --system-site-packages /home/mod/.virtualenvs/jmod && \
	echo "alias pybar='source /home/mod/.virtualenvs/pybar/bin/activate'" >> /home/mod/.bashrc && \
	echo "alias jmod='source /home/mod/.virtualenvs/jmod/bin/activate'" >> /home/mod/.bashrc && \
	/bin/bash -c "source /home/mod/.virtualenvs/jmod/bin/activate && \
	pip install -U numpy scipy matplotlib JPype1 cython lxml nose ipython && \
	mkdir /home/mod/jmod/ && cd /home/mod/jmod && \
	wget https://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.13.tgz && \
	tar xvf Ipopt-3.12.13.tgz && \
	cd Ipopt-3.12.13/ThirdParty/Blas && ./get.Blas && \
	cd ../Lapack && ./get.Lapack && \
	cd ../Mumps && ./get.Mumps && \
	cd ../Metis && ./get.Metis && cd ../.. && \
	mkdir build && cd build && ../configure --prefix=/home/mod/jmod/Ipopt && make install"
#	"cd /home/mod/jmod && \
#	{ svn co https://svn.jmodelica.org/trunk JModelica.org 2> /dev/null; } || { echo \"Hit the error in the JMod svn co\"; } && cd JModelica.org && \
#	cd external && svn co https://svn.jmodelica.org/assimulo/trunk/ Assimulo && cd .. && \
#	mkdir build && cd build && \
#	../configure --prefix=/home/mod/jmod/JModelica --with-ipopt=/home/mod/jmod/Ipopt && \
#	make install"

CMD ["bash"]
