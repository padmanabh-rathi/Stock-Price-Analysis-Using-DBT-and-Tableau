





with validation_errors as (

    select
        symbol, date
    from DEV.analytics.rsi
    group by symbol, date
    having count(*) > 1

)

select *
from validation_errors


