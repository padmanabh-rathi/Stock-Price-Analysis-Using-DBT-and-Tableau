select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select date
from DEV.analytics.rsi
where date is null



      
    ) dbt_internal_test