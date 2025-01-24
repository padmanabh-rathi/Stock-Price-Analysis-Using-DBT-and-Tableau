select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        symbol, date
    from DEV.analytics.price_momentum
    group by symbol, date
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test