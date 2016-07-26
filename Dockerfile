FROM python:3.5.1-alpine

EXPOSE 8443

COPY . /usr/src/app
WORKDIR /usr/src/app

RUN pip install -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8443", "-w", "1", "httpbin:app", "--certfile=/usr/src/app/example_wildcard_chain.pem", "--keyfile=/usr/src/app/example_wildcard.key"]
