with src as (
select * from {{ source('raw_uber','UberDataset2') }}
)

select
    START as start_location,
    STOP as stop_location,
    MILES as distance,
    strptime(START_DATE,'%d/%m/%Y %H:%M') as start_date,
    strptime(END_DATE,'%d/%m/%Y %H:%M') as end_date,
    coalesce(PURPOSE,'Unknown') as purpose
from src
where START != 'Unknown Location'
and STOP != 'Unknown Location'
