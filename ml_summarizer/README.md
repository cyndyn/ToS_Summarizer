# ml_summarizer

## Installation

Create virtual environment (recommended):
```
python -m venv .venv
```

Activate virtual environment:
```
source .venv/bin/activate
```

Install requirements:
```
pip install -r requirements.txt
```

To exit the virtual environment:
```
deactivate
```

## Build the docker image.
```
docker build --network=host -t image_name .
```

## Run the image as a container
```
docker run --name container_name image_name
```