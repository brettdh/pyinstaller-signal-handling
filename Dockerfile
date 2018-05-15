FROM python:2.7

RUN mkdir -p /src
WORKDIR /src

ARG PYINSTALLER_VERSION=3.3.1
ENV PYINSTALLER_VERSION=${PYINSTALLER_VERSION}

ADD requirements.txt install-pyinstaller.sh main.py test.sh /src/
RUN pip install -r /src/requirements.txt
RUN /src/install-pyinstaller.sh $PYINSTALLER_VERSION

ENTRYPOINT [ "/src/test.sh" ]
