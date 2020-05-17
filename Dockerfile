FROM alpine:latest

ENV PATH=$PATH:/usr/share/metasploit-framework 
ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=1

RUN echo "http://nl.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories && \
    echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
	apk add \
	build-base \
	ruby \
	ruby-bigdecimal \
	ruby-bundler \
	ruby-io-console \
	ruby-dev \
	libffi-dev\
        libressl-dev \
	readline-dev \
	sqlite-dev \
	postgresql-dev \
        libpcap-dev \
	libxml2-dev \
	libxslt-dev \
	yaml-dev \
	zlib-dev \
	ncurses-dev \
        autoconf \
	bison \
	subversion \
	sqlite \
	libxslt \
	postgresql \
        ncurses	

RUN apk add --no-cache \
emacs-nox \
screen \
python \
python2-dev \
ruby \
ruby-dev \
ruby-rdoc \
go \
perl \
zsh \
curl \
python3 \
git \
make \
cmake \
py2-pip \
gcc \
python3-dev \
linux-headers \
php \
openssh \
bash \
procps \
drill \
coreutils \
autoconf \
automake

RUN apk add --no-cache libxml2-dev zlib-dev procps sqlite-dev libxslt-dev postgresql-dev libffi-dev perl-net-ssleay libffi-dev libc-dev
RUN pip install --upgrade pip && pip3 install --upgrade pip
RUN gem install rubygems-update && update_rubygems && gem update --system
RUN gem update
RUN gem install bigdecimal json wpscan
RUN echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories
RUN apk add --no-cache tmux nmap nmap-scripts wget git make tor torsocks nikto neofetch john curl

RUN cd /usr/share && \
    git clone https://github.com/rapid7/metasploit-framework.git && \
    cd /usr/share/metasploit-framework && \
    bundle update --bundler && bundle install

RUN pip install virtualenv requests && pip3 install virtualenv requests

WORKDIR /tools

ADD .zshrc /root/.zshrc

RUN echo "hackbox" > /etc/hostname

VOLUME ['/tools']

COPY startscript.sh /root/startscript.sh

CMD /root/startscript.sh