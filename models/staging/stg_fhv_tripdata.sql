{{ config(materialized='view') }}

with tripdata as 
(
  select *,
    from {{ source('staging','fhv2019') }} 
)
select
    -- identifiers
    {{ dbt_utils.surrogate_key(['pickup_datetime']) }} as tripid,
    cast(pulocationid as integer) as PUlocationID,
    cast(dolocationid as integer) as DOlocationID, 
    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,
from tripdata


-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=false) %}

  limit 100

{% endif %}