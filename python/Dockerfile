FROM python:3.12-alpine

WORKDIR /app

COPY app.py requirements.txt ./

EXPOSE 3000

RUN apk update && apk --no-cache add openssl bash curl ca-certificates &&\
    chmod +x app.py &&\
    pip install --no-cache-dir -r requirements.txt

CMD ["python3", "app.py"]
