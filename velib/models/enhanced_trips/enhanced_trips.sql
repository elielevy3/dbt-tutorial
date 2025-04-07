with trips as (
    select * from {{ ref('trips') }}
),

stations as (
    select * from {{ ref('stations') }}
),

zip_codes as (
    select * from {{ ref("zip_codes")}}
),

final as (

    SELECT
        trip_id as id,
        start_date,
        start_station.name as start_station_name,
        start_station.landmark as start_station_landmark, 
        end_station.name as end_station_name, 
        end_station.landmark as end_station_landmark, 
        bike_number, 
        subscriber_type,
        {{ add_day_of_week('start_date') }} as day_of_week, 
        duration_sec, 
        start_zip_codes.zip_code as start_station_zip_code,
        end_zip_codes.zip_code as end_station_zip_code

    FROM trips
    INNER JOIN stations as start_station ON trips.start_station_id = start_station.station_id
    INNER JOIN stations as end_station ON trips.end_station_id = end_station.station_id
    INNER JOIN zip_codes as start_zip_codes ON start_zip_codes.landmark = start_station.landmark
    INNER JOIN zip_codes as end_zip_codes ON end_zip_codes.landmark = end_station.landmark
)

select * from final


------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
---------------------------- DONT LOOK UP ! ----------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------
------------------------------------------------------------------------


-- When you think you are ready:
-- Run cmd + a to select everything (including the solution above)
-- Run cmd + shift + / to comment all code
-- Uncomment what you want to run (i.e. your answer)
-- Run dbt compile
-- Go check in target folder your compiled code and run into BQ window
