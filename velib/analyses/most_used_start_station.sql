-- get name of station with most trips starting from
SELECT name
from {{ ref("stations") }}
where station_id = 
    (SELECT start_station_id
    FROM {{ ref("trips") }} as trips 
    GROUP BY start_station_id
    ORDER BY count("*") DESC
    LIMIT 1)