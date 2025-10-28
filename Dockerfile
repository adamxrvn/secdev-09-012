FROM python:3.11.14-slim@sha256:8eb5fc663972b871c528fef04be4eaa9ab8ab4539a5316c4b8c133771214a617
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 
COPY app ./app
ENV APP_HOST=0.0.0.0 APP_PORT=8080 PYTHONUNBUFFERED=1
RUN useradd -m appuser
USER appuser
EXPOSE 8080
CMD ["uvicorn","app.main:app","--host","0.0.0.0","--port","8080"]
