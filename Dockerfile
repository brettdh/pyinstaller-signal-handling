FROM python:2.7

RUN mkdir -p /src
WORKDIR /src

ADD requirements.txt main.py test.sh /src/
RUN pip install -r /src/requirements.txt

ENTRYPOINT [ "/src/test.sh" ]
