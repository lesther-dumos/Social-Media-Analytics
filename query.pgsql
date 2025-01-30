-- Overview of data
SELECT * FROM kaggle_data LIMIT 10;

-- Device Used the most
SELECT 
    "Device Type", 
    COUNT(*) AS device_count, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM kaggle_data), 2) AS percentage
FROM kaggle_data
GROUP BY "Device Type";

-- 
