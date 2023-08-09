FROM python:3.10.12-alpine3.18

WORKDIR /home/q/Projects/DevOps/1.Docker_app/

RUN apk update && python3.10 -m venv env

COPY requirements.txt /home/q/Projects/DevOps/1.Docker_app/
COPY /app /home/q/Projects/DevOps/1.Docker_app/

RUN /bin/sh -c "source env/bin/activate" && \
    pip install -r requirements.txt && \
    rm -rf /var/cache/apk/* && \ 
    rm -rf /root/.cache && \
    find / -type d -name __pycache__ -exec rm -r {} + && \
    rm -rf /tmp/*

ENV FLASK_APP=app/my_app_flask.py
ENV FLASK_RUN_HOST=0.0.0.0


# startapp
CMD ["python", "-m", "flask", "run" ]