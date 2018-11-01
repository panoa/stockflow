FROM python:3.6.6

WORKDIR /work

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get -y install curl gcc g++ bash python3 python3-pip python3-dev && \
    apt-get install -y mecab libmecab-dev mecab-ipadic-utf8 && \
    apt-get install -y fonts-ipaexfont && \
    apt-get install -y --no-install-recommends sudo unzip vim && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp
RUN pip install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

COPY . /work
WORKDIR /work

