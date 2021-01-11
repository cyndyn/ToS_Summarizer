FROM python:3.8-slim

COPY . /src/

RUN pip install -r /src/requirements.txt

CMD [ "python3", "/src/summarize.py" ]