-- get name of station with most trips starting from
SELECT name
from {{ ref("stations") }}
where station_id = 
    (SELECT start_station_id
    FROM {{ ref("trips") }} as trips 
    GROUP BY start_station_id
    ORDER BY count("*") DESC
    LIMIT 1)

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
