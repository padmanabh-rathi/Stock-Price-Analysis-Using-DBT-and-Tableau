with __dbt__cte__stock_price_base as (
SELECT
 symbol,
 date,
 close,
 LOAD
FROM dev.raw_data.multi_stock_price_data
WHERE date >= CURRENT_DATE - INTERVAL '60 DAY'
) SELECT 
    SYMBOL,
    date,
    close,
	CAST(SMA_10 as DECIMAL(10,2)) AS SMA_10,
    CAST((close * 2 / (10 + 1)) + (SMA_10 * (1 - 2 / (10 + 1))) AS DECIMAL(10, 2)) AS EMA_10,
    LOAD as ts
FROM  (
    SELECT 
        SYMBOL,
        date,
        close,
        AVG(close) OVER (PARTITION BY SYMBOL ORDER BY date ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS SMA_10,
        LOAD
    FROM __dbt__cte__stock_price_base
)