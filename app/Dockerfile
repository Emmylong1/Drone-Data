FROM python:3.10

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir fastapi uvicorn

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
