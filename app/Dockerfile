# Use the official Python image as the base image
FROM python:3.8-slim



# Copy the current directory contents into the container at /app
COPY . /app

WORKDIR /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


# Make port 5000 available to the world outside this container
EXPOSE 5000

ENTRYPOINT [ "python" ]
# Run app.py when the container launches
CMD ["app.py"]