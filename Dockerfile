FROM python:3.12-slim

WORKDIR /app

COPY requirements_4_x86i.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY app-obj_3_8lk3.py .

ENTRYPOINT ["python", "app-obj_3_8lk3.py"]
