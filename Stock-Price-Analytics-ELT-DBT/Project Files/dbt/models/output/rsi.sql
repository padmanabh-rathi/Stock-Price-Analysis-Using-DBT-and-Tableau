WITH price_changes_rsi AS (
    SELECT 
        SYMBOL,
	    date,
        close,
        close - LAG(close) OVER (PARTITION BY SYMBOL ORDER BY date) AS change,
    LOAD
    FROM {{ ref("stock_price_base") }}
)
,gains_losses AS (
    SELECT 
        SYMBOL,
	    date,
        close,
        CASE WHEN change > 0 THEN change ELSE 0 END AS gain,
        CASE WHEN change < 0 THEN ABS(change) ELSE 0 END AS loss,
    LOAD
    FROM price_changes_rsi
)
,avg_gains_losses AS (
    SELECT 
        SYMBOL,
	    date,
        close,
        AVG(gain) OVER (PARTITION BY SYMBOL ORDER BY date ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS avg_gain,
        AVG(loss) OVER (PARTITION BY SYMBOL ORDER BY date ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS avg_loss,
    LOAD
    FROM gains_losses
)
SELECT 
    symbol,
    date,
    close as "Close Price",
    cast(coalesce(100 - (100 / (1 + (avg_gain / nullif(avg_loss,0)))),0) as decimal (10,2)) AS RSI_10,
    LOAD as ts
FROM avg_gains_losses