CREATE DATABASE nike_capstone;
USE nike_capstone;

-- Question 1: Platform Comparison
-- Task: Find total views and average engagement_rate across YouTube Shorts vs TikTok.

SELECT 
    platform,
    SUM(views) as total_views,
    AVG(engagement_rate) as avg_engagement_rate
FROM 
    youtube_shorts_tiktok_trends_2025
GROUP BY 
    platform;
    
    
    
-- Question 2: Regional Hotspots
-- Task: Find the top 5 countries with the highest views for Nike campaigns on each platform.
with CountryPlatformViews as( 
SELECT
      platform, 
      country,
      sum(views)as total_views
FROM
     youtube_shorts_tiktok_trends_2025
GROUP BY 
     platform,
     country
),
rankedcountries as(
SELECT
      platform,
      country,
      total_views,
      rank()OVER(PARTITION BY platform order by total_views desc) as view_rank
FROM
CountryPlatformViews
)
SELECT
    platform,
    country, 
    total_views
from
   rankedcountries
WHERE
   view_rank<=5;
   


-- Question 3: Category Performance
-- Task: Find the average completion_rate and avg_watch_time_sec for categories like sports, lifestyle, fashion.

SELECT 
    category,
    AVG(completion_rate) as avg_completion_rate,
    AVG(avg_watch_time_sec)as avg_watch_time
FROM 
    `youtube_shorts_tiktok_trends_2025.csv`
GROUP BY 
    category;
    
    
    
    


-- Question 4: Creator Impact
-- Task: Find the top 10 author_handle by average views and their creator_tier.

SELECT 
    author_handle,
    creator_tier,
    AVG(views) AS avg_views
FROM 
    `youtube_shorts_tiktok_trends_2025.csv`
GROUP BY 
    author_handle,
    creator_tier
ORDER BY 
    avg_views DESC
LIMIT 10;
   


-- Question 5: Hashtag ROI
-- Task: Top 20 hashtags by total views and their median engagement_rate.

WITH HashtagStats AS (
    SELECT hashtag, SUM(views) AS total_views
    FROM `youtube_shorts_tiktok_trends_2025.csv`
    GROUP BY hashtag
),
RankedEng AS (
    SELECT hashtag, engagement_rate,
        ROW_NUMBER() OVER(PARTITION BY hashtag ORDER BY engagement_rate) as row_num,
        COUNT(*) OVER(PARTITION BY hashtag) as total_rows
    FROM `youtube_shorts_tiktok_trends_2025.csv`
),
MedianEng AS (
    SELECT hashtag, AVG(engagement_rate) as median_engagement_rate
    FROM RankedEng
    WHERE row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))
    GROUP BY hashtag
)
SELECT h.hashtag, h.total_views, m.median_engagement_rate
FROM HashtagStats h
JOIN MedianEng m ON h.hashtag = m.hashtag
ORDER BY h.total_views DESC
LIMIT 20;




-- Question 6: Emoji Effect
-- Task: Compare median engagement_per_1k between videos with and without has_emoji in titles.

WITH RankedEmoji as (
    SELECT 
        has_emoji, 
        engagement_per_1k,
        ROW_NUMBER() OVER(PARTITION BY has_emoji ORDER BY engagement_per_1k) asrow_num,
        COUNT(*) OVER(PARTITION BY has_emoji) as total_rows
    FROM 
        `youtube_shorts_tiktok_trends_2025.csv`
),
MedianEmoji as (
    SELECT 
        has_emoji, 
        AVG(engagement_per_1k) as  median_engagement_per_1k
    FROM 
        RankedEmoji
    WHERE 
        row_num IN (FLOOR((total_rows + 1) / 2), CEIL((total_rows + 1) / 2))
    GROUP BY 
        has_emoji
)
SELECT 
    has_emoji,
    median_engagement_per_1k
FROM 
    MedianEmoji;
    
    


-- Question 7: Upload Timing
-- Task: Compare average views and engagement rate for weekend vs weekday uploads.

SELECT 
    publish_dayofweek,
    upload_hour,
    AVG(views) as avg_views,
    AVG(completion_rate) as avg_completion_rate
FROM 
    `youtube_shorts_tiktok_trends_2025.csv`
GROUP BY 
    publish_dayofweek, upload_hour
ORDER BY 
    avg_views DESC;
    

-- Question 8: Traffic Source Performance
-- Task: Identify which traffic source brings the highest average views and engagement.
SELECT 
    trend_type,
    AVG(engagement_velocity) AS avg_engagement_velocity,
    AVG(trend_duration_days) AS avg_trend_duration
FROM 
    `youtube_shorts_tiktok_trends_2025.csv`
GROUP BY 
    trend_type;
    



-- Question 9: Device Brand Analysis
-- Task: Analyze performance metrics (average views and engagement) grouped by device brand.

SELECT 
    device_type,
    device_brand,
    AVG(completion_rate) AS avg_completion_rate
FROM 
    `youtube_shorts_tiktok_trends_2025.csv`
GROUP BY 
    device_type, device_brand
ORDER BY 
    avg_completion_rate DESC;
    


-- Question 10: Traffic Sources Breakdown
-- Task: Breakdown of traffic_source (e.g., For You Page, search, direct) with median completion_rate

WITH RankedTraffic AS (
    SELECT 
        traffic_source,
        completion_rate,
        ROW_NUMBER() OVER (PARTITION BY traffic_source ORDER BY completion_rate) AS rn,
        COUNT(*) OVER (PARTITION BY traffic_source) AS total_rows
    FROM 
        `youtube_shorts_tiktok_trends_2025.csv`
),
MedianTraffic AS (
    SELECT 
        traffic_source,
        AVG(completion_rate) AS median_completion_rate
    FROM 
        RankedTraffic
    WHERE 
        rn IN (FLOOR((total_rows + 1) / 2.0), CEIL((total_rows + 1) / 2.0))
    GROUP BY 
        traffic_source
),
TrafficSummary AS (
    SELECT 
        traffic_source,
        COUNT(row_id) AS total_videos,
        AVG(views) AS avg_views
    FROM 
        `youtube_shorts_tiktok_trends_2025.csv`
    GROUP BY 
        traffic_source
)
SELECT 
    s.traffic_source,
    s.total_videos,
    s.avg_views,
    m.median_completion_rate
FROM 
    TrafficSummary s
JOIN 
    MedianTraffic m ON s.traffic_source = m.traffic_source
ORDER BY 
    s.avg_views DESC;

    

-- Question 11: Seasonal Insights
-- Task: Compare total views, average views, and median engagement_rate across event_season.

SELECT 
    event_season,
    avg(engagement_rate),
    avg(views)
FROM 
	`youtube_shorts_tiktok_trends_2025.csv`
GROUP BY 
     event_season;

    
    


-- Question 12: Data Quality Check
-- Task: Validate if engagement_total = likes + comments + shares + saves. Return mismatched rows.


SELECT 
count(*)
FROM
    `youtube_shorts_tiktok_trends_2025.csv`
WHERE
    engagement_total <> (views+likes+shares+saves);
