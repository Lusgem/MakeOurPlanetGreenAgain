FROM python:3

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
RUN apt-get install -y python3-dev default-libmysqlclient-dev
RUN mkdir /code
WORKDIR /code

RUN pip install pip -U
COPY requirements.txt /code/
RUN pip install -r requirements.txt

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY . /code/

RUN ls -la /code/static/js
