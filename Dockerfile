FROM django

EXPOSE 8000
ADD https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724/requests-2.28.1.tar.gz /opt
COPY . /opt
WORKDIR /opt
RUN pip install -r requirements.txt
ENTRYPOINT  ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
