# Astro Demand Forecasting Server Using Meta's Prophet

We use docker to build and run a server that uses NeuralProphet to forecast sales data and deploy it to Google Cloud Run.

## Prerequisites
- Ensure you have Docker installed and properly configured on your system.
---

## Introduction to Poetry

Poetry is a dependency management and packaging tool for Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Poetry also helps you to easily build and publish your projects.

### Installing Poetry

To install Poetry, run the following command:

```bash
pip install poetry
```

### Using Poetry
```bash
poetry init
```
### Adding Dependencies
```bash
poetry add neuralprophet
```
### Installing Dependencies
```bash
poetry install
```
### Running the Server
```bash 
poetry run python server.py
```

## Steps

### 1. Build Local Docker Image

To build a Docker image :

```bash
docker build -t server_image . && docker image prune -f
```

### 2. Run the Docker Container Locally

To run the previously built `server_image` Docker container locally, use the following command:

```bash
docker rm -f ml_server && docker run --name ml_server -p 8080:8080 server_image
```

---

## API Endpoints

We Use FastAPI to create the API endpoints and Uvicorn to run the server.


## Additional Information

- [Docker](https://docs.docker.com/)
- [NeuralProphet](https://neuralprophet.com/contents.html)
- [FastAPI](https://fastapi.tiangolo.com/)
- [Uvicorn](https://www.uvicorn.org/)
- [Poetry](https://python-poetry.org/docs/)
- [Google Cloud Run](https://cloud.google.com/run)
