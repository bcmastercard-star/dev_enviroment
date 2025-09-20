WITH dim_currency_conversion AS (
  SELECT 'Africa' AS region, CAST(0.945 AS NUMERIC) AS currency
  UNION ALL SELECT 'Asia', CAST(0.987 AS NUMERIC)
  UNION ALL SELECT 'Europe', CAST(1.151 AS NUMERIC)
  UNION ALL SELECT 'North America', CAST(1.000 AS NUMERIC)
  UNION ALL SELECT 'Oceania', CAST(1.098 AS NUMERIC)
  UNION ALL SELECT 'South America', CAST(1.011 AS NUMERIC)
)
SELECT *
FROM dim_currency_conversion