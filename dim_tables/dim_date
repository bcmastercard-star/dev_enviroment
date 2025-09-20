SELECT
  d AS id,
  FORMAT_DATE('%F', d) AS year_month_day,
  FORMAT_DATE('%d/%m/%Y', d) AS date_format_uk,
  FORMAT_DATE('%Y-%m', d) AS year_month,
  FORMAT_DATE('%Y-%Q', d) AS year_quarter,
  EXTRACT(YEAR FROM d) AS year,
  EXTRACT(MONTH FROM d) AS month,
  FORMAT_DATE('%m', d) AS month_padded,
  FORMAT_DATE('%b', d) AS month_name,
  FORMAT_DATE('%B', d) AS month_name_long,
  EXTRACT(DAY FROM d) AS day,  
  FORMAT_DATE('%d', d) AS day_padded,
  FORMAT_DATE('%j', d) AS day_of_year,
  FORMAT_DATE('%u', d) AS day_of_week, -- 7 = Sunday
  FORMAT_DATE('%a', d) AS day_name,
  FORMAT_DATE('%A', d) AS day_name_long,
  FORMAT_DATE('%Q', d) AS quarter,
  FORMAT_TIMESTAMP('%V', TIMESTAMP(d)) AS week_number, -- ISO 8601 week number
  CASE
    WHEN CAST(FORMAT_DATE('%u', d) AS INT64) IN (6, 7) THEN 'Weekend'
    ELSE 'Infrasettimanale'
  END AS dayType,
  -- Adjust year_week for ISO 8601 week 53 to ensure correct year
  CONCAT(
    CASE
      -- For ISO week 53, keep the year as the current year (2026)
      WHEN FORMAT_TIMESTAMP('%V', TIMESTAMP(d)) = '53' THEN CAST(EXTRACT(YEAR FROM d) AS STRING)
      -- Otherwise, follow the ISO year logic
      ELSE FORMAT_TIMESTAMP('%G', TIMESTAMP(d))
    END, 
    "-", 
    FORMAT_TIMESTAMP('%V', TIMESTAMP(d))
  ) AS year_week
FROM 
  UNNEST(GENERATE_DATE_ARRAY('2000-01-01', '2050-12-31', INTERVAL 1 DAY)) AS d
