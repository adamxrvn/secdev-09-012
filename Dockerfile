FROM python:3.11.14-slim@sha256:8eb5fc663972b871c528fef04be4eaa9ab8ab4539a5316c4b8c133771214a617
WORKDIR /app
COPY requirements.txt .
<<<<<<< HEAD
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache
=======
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get install -y git curl
RUN apt-get update && apt-get install -y wget
>>>>>>> 20bbe4c34d3b9eac1ef46b6bfe7dbc71d0dc1a43
COPY app ./app
ENV APP_HOST=0.0.0.0 APP_PORT=8080 PYTHONUNBUFFERED=1
RUN useradd -m appuser
USER appuser
EXPOSE 8080
CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port","8080"]
