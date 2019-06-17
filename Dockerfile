FROM alpine:latest
RUN echo "**** Installing Packages *****"

RUN apk update && apk upgrade

RUN apk add --no-cache emacs-nox python ruby ruby-dev go perl zsh curl python3 git make cmake py2-pip gcc python3-dev linux-headers

RUN pip install --upgrade pip && pip3 install --upgrade pip

RUN apk add --no-cache libxml2-dev zlib-dev procps sqlite-dev libc-dev libxslt-dev postgresql-dev

RUN apk add --no-cache tmux nmap wget git make tor torsocks nikto neofetch

RUN pip install virtualenv requests && pip3 install virtualenv requests

WORKDIR /tools

ADD .zshrc /root/.zshrc

RUN echo "hackbox" > /etc/hostname

VOLUME ['/tools']

CMD zsh