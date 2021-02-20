FROM django

EXPOSE 8000

COPY . /opt
WORKDIR /opt
RUN pip install -r requirements.txt
ENTRYPOINT  ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
