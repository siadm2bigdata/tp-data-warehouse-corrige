with trips as (
select * from {{ ref('int_trips_union') }}
),
cities as (
select * from {{ ref('stg_cities') }}
)

select
    t.*,
    c1.country as start_country,
    c2.country as stop_country
from trips t
left join cities c1 on t.start_location = c1.city
left join cities c2 on t.stop_location = c2.city
where c1.country is not null
and c2.country is not null
