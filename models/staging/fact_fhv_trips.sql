{{ config(materialized='table') }}

with fhv_data as (
    select *, 
        'FHV' as service_type 
    from {{ ref('stg_fhv_tripdata') }}
), 

trips_unioned as (
    select * from fhv_data
), 

dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select 
    trips_unioned.tripid, 
    trips_unioned.service_type,
    pickup_zone.borough as pickup_borough, 
    pickup_zone.zone as pickup_zone, 
    trips_unioned.DOlocationid,
    dropoff_zone.borough as dropoff_borough, 
    dropoff_zone.zone as dropoff_zone,  
    trips_unioned.pickup_datetime, 
    trips_unioned.dropoff_datetime, 
from trips_unioned
inner join dim_zones as pickup_zone
on trips_unioned.PUlocationid = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on trips_unioned.DOlocationid = dropoff_zone.locationid