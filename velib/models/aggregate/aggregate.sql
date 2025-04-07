{% set locality_nb_trips = ["San_Jose", "San_Francisco", "Palo_Alto"] %}
{% set locality_duration_time = ["Redwood_City", "Mountain_View"] %}

select day_of_week, 

    {% for locality in locality_duration_time %}
    round(avg(case when start_station_landmark = REPLACE('{{locality}}', "_", " ") then duration_sec end) / 60, 3) as {{locality}}_avg_time_mn,
    {% endfor %}

    {% for locality in locality_nb_trips %}
    count(case when start_station_landmark = REPLACE('{{locality}}', "_", " ") then 1 end) as {{locality}}_nb_trips,
    {% endfor %}

    round(avg(duration_sec) / 60, 3) as avg_time_in_mn,
    count("*") as nb_trips
    
    from {{ref("enhanced_trips")}}
    group by day_of_week


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
