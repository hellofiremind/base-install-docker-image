FROM firemindltd/base-install-docker-image-base:latest

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 # R Repository
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu disco-cran35/' # R Repo
RUN add-apt-repository ppa:linuxuprising/java # Java Repo
RUN apt-get update -y
RUN apt-get -y install default-jdk python2.7-dev python3.7-dev python3-pip r-base docker-ce docker-ce-cli containerd.io qemu-user qemu-user-static
