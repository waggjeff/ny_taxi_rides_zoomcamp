{{ config(materialized='table') }}


select 
    locationid, 
    borough, 
    zone, 
    replace(zone,'Boro','Green') as zone
from {{ ref('taxi_zone_lookup') }}