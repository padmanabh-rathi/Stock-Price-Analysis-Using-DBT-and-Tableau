SELECT
 symbol,
 date,
 close,
 LOAD
FROM {{ source('raw_data', 'multi_stock_price_data') }}
WHERE date >= CURRENT_DATE - INTERVAL '60 DAY'
