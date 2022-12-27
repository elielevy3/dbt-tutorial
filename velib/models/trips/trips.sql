with trips as (

    select
        trip_id,
        duration_sec,
        start_date, 
        start_station_id, 
        end_station_id, 
        subscriber_type, 
        bike_number

       from {{ source('bigquery', 'bikeshare_trips') }}

)

select * from trips