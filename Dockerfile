# set the base image. Since we're running
# a Python application a Python base image is used FROM python:3.8
# set a key-value label for the Docker image
FROM python:3.8

# copy files from the host to the container filesystem. 
# For example, all the files in the current directory
# to the  `/app` directory in the container
COPY . /app

#  defines the working directory within the container
WORKDIR /app

# run commands within the container. 
# For example, invoke a pip command 
# to install dependencies defined in the requirements.txt file. 
RUN pip install -r requirements.txt

# The EXPOSE instruction informs Docker that the container listens
# on the specified network ports at runtime.
EXPOSE 80

# provide a command to run on container start. 
CMD [ "mercury", "run", "0.0.0.0:80", "covid_dashboard.ipynb" ]
