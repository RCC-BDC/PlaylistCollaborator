# Pull base image
FROM python:3.10.2-slim-bullseye

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Copy Code over to working dir
COPY . .
RUN chown -R $USER:$USER .

EXPOSE 8000

# Install dependencies
RUN pip install -r requirements.txt