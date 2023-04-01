# Project API-Weather-predictions
- This program predicts weather (temperature and weather description) in next 15 hours (separates every 3 hour predictions) for the city, which you choose from the presented list
- All data with cities and weather predictions storage in SQL
- All weather predictions always update with every new program run
- API id and other constants storage in separate "settings.ini" file for safe 
## Setup
#### Run a Docker container
To restore a database dump into your local Docker container, first ensure your container is currently running.  
- You can use `docker container ls` to check if it's on already 
- If it's not, simply start it by running `docker start postgres`
####  Restoring the data into your Docker container
Assuming you have the Docker container running and a data dump file ready, you can run the following command to import all dat.     
Be sure to substitute `./latest.dump` to where your dump file is located, if it's not in the current working directory and called latest.dump.  
`docker exec -i postgres pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d <your-db-name> < ./latest.dump
` 
#### Install requirements in Python
For correct work you also need to install requirements:
`pip install -r requirements.txt`