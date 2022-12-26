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