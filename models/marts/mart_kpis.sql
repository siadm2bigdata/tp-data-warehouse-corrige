with trips as (
select * from {{ ref('int_trips_enriched') }}
)

select
    count(*) as total_trips,
    sum(distance) as total_distance,
    avg(distance) as avg_distance,
    avg(date_diff('minute',start_date,end_date)) as avg_duration_minutes
from trips
