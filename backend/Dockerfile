# Builder stage
FROM python:3.9-buster AS builder

# Install Poetry
RUN pip install poetry

# Set environment variables for Poetry
ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app

# Copy pyproject.toml and poetry.lock
COPY pyproject.toml poetry.lock ./
RUN touch README.md

# Install dependencies
RUN --mount=type=cache,target=$POETRY_CACHE_DIR poetry install --no-root

# Runtime stage
FROM python:3.9-slim-buster AS runtime

# Set environment variables for the virtual environment
ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH"

# Copy the virtual environment from the builder stage
COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}

WORKDIR /app

# Copy the application code
COPY ./app /app/app

# Expose the necessary port
EXPOSE 8080

# Run the application
CMD ["uvicorn", "app.app:app", "--host", "0.0.0.0", "--port", "8080"]