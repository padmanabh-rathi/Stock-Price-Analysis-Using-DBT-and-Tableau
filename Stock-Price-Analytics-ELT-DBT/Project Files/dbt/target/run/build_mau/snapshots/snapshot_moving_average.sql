
      
  
    

        create or replace transient table DEV.snapshot.snapshot_moving_average
         as
        (
    

    select *,
        md5(coalesce(cast(concat(symbol, '_', date) as varchar ), '')
         || '|' || coalesce(cast(ts as varchar ), '')
        ) as dbt_scd_id,
        ts as dbt_updated_at,
        ts as dbt_valid_from,
        
  
  coalesce(nullif(ts, ts), null)
  as dbt_valid_to

    from (
        

SELECT * FROM DEV.analytics.moving_averages
    ) sbq



        );
      
  
  