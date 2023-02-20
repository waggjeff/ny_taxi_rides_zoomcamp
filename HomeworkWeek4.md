## Week 4 Homework 

In this homework, we'll use the models developed during the week 4 videos and enhance the already presented dbt project using the already loaded Taxi data for fhv vehicles for year 2019 in our DWH.

We will use the data loaded for:

* Building a source table: `stg_fhv_tripdata`
* Building a fact table: `fact_fhv_trips`
* Create a dashboard 

If you don't have access to GCP, you can do this locally using the ingested data from your Postgres database
instead. If you have access to GCP, you don't need to do it for local Postgres -
only if you want to.

### Question 1: 

**What is the count of records in the model fact_trips after running all models with the test run variable disabled and filtering for 2019 and 2020 data only (pickup datetime)** 

You'll need to have completed the "Build the first dbt models" video and have been able to run the models via the CLI. 
You should find the views and models for querying in your DWH.

61648442


SELECT count(0) FROM `mythic-byway-375404.trips_data_all.fact_trips`where pickup_datetime > '2018-12-31' and pickup_datetime < '2021-01-01';

61540436


### Question 2: 

**What is the distribution between service type filtering by years 2019 and 2020 data as done in the videos**

You will need to complete "Visualising the data" videos, either using data studio or metabase. 

- 89.9/10.1
- 94/6
- 76.3/23.7
- 99.1/0.9


JFW - after filtering on years between Jan 1, 2019 and Dec 31, 2020,
the ratio of service types can be determined from a pie chart which
shows 89.9/10.1  . 

### Question 3: 

**What is the count of records in the model stg_fhv_tripdata after running all models with the test run variable disabled (:false)**  

Create a staging model for the fhv data for 2019 and do not add a deduplication step. Run it via the CLI without limits (is_test_run: false).
Filter records with pickup time in year 2019.

43244696


SELECT count(0) FROM `mythic-byway-375404.trips_data_all.stg_fhv_tripdata` ;
43244696


### Question 4: 

**What is the count of records in the model fact_fhv_trips after running all dependencies with the test run variable disabled (:false)**  

Create a core model for the stg_fhv_tripdata joining with dim_zones.
Similar to what we've done in fact_trips, keep only records with known pickup and dropoff locations entries for pickup and dropoff locations. 
Run it via the CLI without limits (is_test_run: false) and filter
records with pickup time in year 2019.

22998722


SELECT count(0) FROM
`mythic-byway-375404.trips_data_all.fact_fhv_trips` ;
22998722


### Question 5: 

**What is the month with the biggest amount of rides after building a tile for the fact_fhv_trips table**
Create a dashboard with some tiles that you find interesting to explore the data. One tile should show the amount of trips per month, as done in the videos for fact_trips, based on the fact_fhv_trips table.\

- January

JFW - Used Google Looker and plotted bar charts to find that January
has way more rides than any other month in 2019. 

## Submitting the solutions

* Form for submitting: https://forms.gle/6A94GPutZJTuT5Y16
* You can submit your homework multiple times. In this case, only the last submission will be used. 

Deadline: 21 February (Tuesday), 22:00 CET


## Solution

We will publish the solution here
