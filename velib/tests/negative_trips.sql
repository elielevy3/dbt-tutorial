select *
from {{ ref("trips") }}
where duration_sec < 0