FROM python:3.10-slim

#don't write .pyc
ENV PYTHONDONTWRITEBYTECODE
#show current terminal output only
ENV PYTHONUNBUFFERED
# i want to run the django project in the code directory
WORKDIR /code

COPY requirements.txt /code/

RUN pip install -r requirements.txt

COPY . /code/

# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]