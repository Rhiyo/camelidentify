FROM python:3.6-slim-stretch

#Install all necessities
RUN apt update
RUN apt install -y python3-dev gcc
RUN pip install torch_nightly -f https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html
RUN pip install fastai
RUN pip install starlette uvicorn python-multipart aiohttp

#Add in files
COPY camelidentify.py camelidentify.py
COPY camelid.pkl camelid.pkl
COPY tmp /tmp

# Run to trigger installation
RUN python camelidentify.py

EXPOSE 8008

# Start the server
CMD ["python", "camelidentify.py", "serve"]
