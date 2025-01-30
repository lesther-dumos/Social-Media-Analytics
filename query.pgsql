-- Overview of data
SELECT * FROM kaggle_data LIMIT 5;

-- Device Used the most
SELECT 
    "Device Type", 
    COUNT(*) AS device_count, 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM kaggle_data), 2) AS percentage
FROM kaggle_data
GROUP BY "Device Type";

-- Hours Spent on Different digital tasks
SELECT 
ROUND(AVG("Daily Messaging Time (hrs)")::numeric, 2) AS hours_messaging,
ROUND(AVG("Daily Gaming Time (hrs)")::numeric, 2) AS hours_gaming,
ROUND(AVG("Daily Music Listening Time (hrs)")::numeric, 2) AS hours_music,
ROUND(AVG("Daily Social Media Time (hrs)")::numeric, 2) AS hours_socialMedia,
ROUND(AVG("Daily Video Content Time (hrs)")::numeric, 2) AS hours_videoContent
FROM kaggle_data;


