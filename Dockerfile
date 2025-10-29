FROM python:3.9
WORKDIR /home/myapp
COPY . /home/myapp
RUN pip install flask
EXPOSE 8080
CMD ["python3", "sample_app.py"]
