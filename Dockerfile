FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add --no-cache emacs-nox python python2-dev ruby ruby-dev ruby-rdoc go perl zsh curl python3 git make cmake py2-pip gcc python3-dev linux-headers php openssh bash procps drill coreutils autoconf automake

RUN apk add --no-cache libxml2-dev zlib-dev procps sqlite-dev libxslt-dev postgresql-dev libffi-dev perl-net-ssleay libffi-dev libc-dev

RUN pip install --upgrade pip && pip3 install --upgrade pip
RUN gem install rubygems-update && update_rubygems && gem update --system
RUN gem install bigdecimal json wpscan

RUN apk add --no-cache tmux nmap nmap-scripts wget git make tor torsocks nikto neofetch john john-misc curl

RUN pip install virtualenv requests && pip3 install virtualenv requests

WORKDIR /tools

ADD .zshrc /root/.zshrc

RUN echo "hackbox" > /etc/hostname

VOLUME ['/tools']

CMD zsh