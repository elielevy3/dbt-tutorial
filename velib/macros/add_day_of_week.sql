{% macro add_day_of_week(column_name) %}
    ({{ dbt_date.day_of_week(column_name) }})
{% endmacro %}