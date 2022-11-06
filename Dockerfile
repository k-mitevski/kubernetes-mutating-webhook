FROM python:3.10-slim-buster
WORKDIR /webhook
COPY requirements.txt /webhook
COPY main.py /webhook
COPY models.py /webhook
RUN pip install --no-cache-dir --upgrade -r /webhook/requirements.txt
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000","--ssl-keyfile=/certs/webhook.key", "--ssl-certfile=/certs/webhook.crt"]
