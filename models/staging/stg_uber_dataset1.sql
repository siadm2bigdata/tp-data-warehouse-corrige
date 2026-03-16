with src as (
select * from {{ source('raw_uber','UberDataset1') }}
)

select
    START as start_location,
    STOP as stop_location,
    MILES as distance,
    cast(START_DATE as timestamp) as start_date,
    cast(END_DATE as timestamp) as end_date,
    coalesce(PURPOSE,'Unknown') as purpose
from src
where START != 'Unknown Location'
and STOP != 'Unknown Location'
