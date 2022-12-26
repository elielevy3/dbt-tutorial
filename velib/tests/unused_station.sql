select
    start_station_id,
    sum(duration_sec) as total_duration
from {{ ref('trips' )}}
group by start_station_id
having not(total_duration >= 0)