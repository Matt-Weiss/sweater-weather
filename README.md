# Sweater Weather

This is the final project for Mod 3 at Turing School. The project is to build out an API and other functionality to mimic a weather delivery app like Yahoo Weather. This project is deployed at https://desolate-cove-69994.herokuapp.com/

My intended plan to minimize API calls is to store Location object in the database. These objects will hold city_state, country, latitude, and longitude as strings. There will also be a column for forecast and a column for backgrounds, both json. the forecast stored is the returned json from the DarkSky API and is serialized for our view. This way it remains flexible if different information is desired at a later point in development. I will be building a background worker (likely running a rake task) to update the forecast for the locations stored in the DB every 15 minutes. This will reduce user load time except in the case that the user is searching for a city not yet in the DB.

I hadn't intended to set up a task for the background images, but perhaps running a rake task for both will ensure that all the information for a location is gathered after just one user request for either forecast or background images.

### Versions:

* Ruby - 2.4.1
* Rails - 5.2.3

System dependencies

Configuration

Database creation

Database initialization

How to run the test suite

Services (job queues, cache servers, search engines, etc.)

Deployment instructions
