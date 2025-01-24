
  
    

        create or replace transient table DEV.analytics.price_momentum
         as
        (WITH  __dbt__cte__stock_price_base as (
SELECT
 symbol,
 date,
 close,
 LOAD
FROM dev.raw_data.multi_stock_price_data
WHERE date >= CURRENT_DATE - INTERVAL '60 DAY'
), price_changes_pm AS (
    SELECT
        SYMBOL,
        date,
        close,
        LAG(close, 10) OVER (PARTITION BY SYMBOL ORDER BY date) AS price_10_days_ago,
    LOAD
    FROM  __dbt__cte__stock_price_base
)
SELECT
    SYMBOL,
    date,
    Close,
    price_10_days_ago,
    close - price_10_days_ago AS "Momentum_Value", 
    round(((close - price_10_days_ago) / price_10_days_ago * 100),2) AS "Momentum_Percent",
    LOAD as ts
FROM price_changes_pm
WHERE price_10_days_ago IS NOT NULL
        );
      
  