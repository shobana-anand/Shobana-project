# Use a Python base image
FROM python:3.12.1

# Set the working directory in the container
WORKDIR /app

# Copy Python files, config file, and environment files into the container
COPY app.py .
COPY config.py .
COPY __init__.py .
COPY requirements.txt .

#set env variables
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=BDzXS7u5jF
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5432
ENV DB_NAME=postgres


# Install dependencies
RUN pip install --upgrade pip
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Expose the port on which the Flask app runs
EXPOSE 5153

# Specify the command to load environment variables, import config, and run the application
CMD ["sh", "-c", "python config.py && python app.py"]



















