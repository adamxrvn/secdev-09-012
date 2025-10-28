FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y git curl
RUN apt-get update && apt-get install -y wget
COPY app ./app
ENV APP_HOST=0.0.0.0 APP_PORT=8080
EXPOSE 8080
CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port","8080"]
