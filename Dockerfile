# Use a Python base image
FROM python:3.12.1

# Set the working directory in the container
WORKDIR /app

# Copy Python files, config file, and environment files into the container
COPY app.py .
COPY config.py .
COPY requirements.txt .

#set env variables
ENV DB_USERNAME=${DB_USERNAME}
ENV DB_PASSWORD=${DB_PASSWORD}
ENV DB_HOST=${DB_HOST}
ENV DB_PORT=${DB_PORT}
ENV DB_NAME=${DB_NAME}


# Install dependencies
RUN pip install --upgrade pip
RUN python3 -m pip install --no-cache-dir -r requirements.txt

# Expose the port on which the Flask app runs
EXPOSE 5153

# Specify the command to load environment variables, import config, and run the application
CMD ["sh", "-c", "python config.py && python app.py"]



















