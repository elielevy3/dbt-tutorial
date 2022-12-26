with stations as (

    select
        station_id,
        name,
        dockcount, 
        landmark

    from {{ source('bigquery', 'bikeshare_stations') }}
)

select * from stations