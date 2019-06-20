FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add --no-cache emacs-nox python python2-dev ruby ruby-dev go perl zsh curl python3 git make cmake py2-pip gcc python3-dev linux-headers php openssh

RUN pip install --upgrade pip && pip3 install --upgrade pip

RUN apk add --no-cache libxml2-dev zlib-dev procps sqlite-dev libc-dev libxslt-dev postgresql-dev libffi-dev

RUN apk add --no-cache tmux nmap nmap-scripts wget git make tor torsocks nikto neofetch john john-misc

RUN pip install virtualenv requests && pip3 install virtualenv requests

WORKDIR /tools

ADD .zshrc /root/.zshrc

RUN echo "hackbox" > /etc/hostname

VOLUME ['/tools']

CMD zsh