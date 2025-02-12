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

-- Countries participating in Data
SELECT
DISTINCT("Country")
FROM kaggle_data;

-- Subquery containing Countries & Average Fatique
SELECT
    "Country",
    AVG(SocialMedia_Fatique) AS avg_SocialMedia_Fatique
FROM (
    SELECT
    "Country",
     CAST("Social Media Fatigue Level (scale 1-10)" AS INTEGER) AS SocialMedia_Fatique
     FROM kaggle_data
) AS subquery
GROUP BY "Country";

-- Social Media Popularaity in Relation to Time Spent
SELECT
    "Primary Platform",
    COUNT("Primary Platform") AS Count,
    ROUND(SUM("Daily Entertainment Time (hrs)")::numeric, 2) AS hours_spent
FROM kaggle_data
GROUP BY "Primary Platform";

-- Screen Time
SELECT
    ROUND(AVG("Screen Time (hrs)")::numeric, 2) AS "Avg_ScreenTime(hrs)"
FROM kaggle_data;

-- Notifications (Subquery)
SELECT
    AVG(NotificationsRecieved) AS Avg_Notifications
FROM (
    SELECT
    CAST(("Notifications Received Daily") AS INTEGER) AS NotificationsRecieved
    FROM kaggle_data
) AS subquery;


-- Ad Count
SELECT
    AVG(AdCount) AS Avg_AdCount
FROM (
    SELECT
    CAST(("Ad Interaction Count") AS INTEGER) AS AdCount
    FROM kaggle_data
) AS subquery;
