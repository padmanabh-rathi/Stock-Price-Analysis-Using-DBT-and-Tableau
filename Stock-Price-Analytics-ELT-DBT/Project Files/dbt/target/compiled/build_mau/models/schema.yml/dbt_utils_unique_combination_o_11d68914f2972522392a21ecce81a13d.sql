





with validation_errors as (

    select
        symbol, date
    from DEV.analytics.moving_averages
    group by symbol, date
    having count(*) > 1

)

select *
from validation_errors


