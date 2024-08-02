FROM python:latest
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY . /app
ENV YOUR_NAME=Noveed
EXPOSE 5500
ENTRYPOINT ["python","app.py"]
