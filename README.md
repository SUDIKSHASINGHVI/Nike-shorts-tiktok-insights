** Nike – Shorts & TikTok Insights**

**📊 Project Overview**

This capstone project analyzes Nike's 2025 short-form video trends across YouTube Shorts and TikTok to identify actionable insights related to campaign performance, content engagement, creators, hashtags, publishing timing, traffic sources, devices, seasonality, and emerging trends.

The project follows a three-phase analytics approach:

SQL Analysis – answer 12 Nike-relevant business questions.

Power BI Dashboard – convert the analysis into an executive-friendly interactive report.

Machine Learning – use K-Means clustering to group videos based on content and engagement characteristics.

The objective is to turn short-form video data into business-focused insights and strategic recommendations for Nike's digital marketing strategy.

**🎯 Business Objectives**

The analysis focuses on:

Comparing performance across YouTube Shorts vs TikTok

Finding the strongest regional markets

Understanding which content categories perform best

Identifying high-performing creators

Evaluating hashtag performance

Measuring the impact of emojis in titles

Understanding upload timing

Analyzing trend momentum and duration

Comparing performance across devices and device brands

Understanding traffic-source performance

Identifying seasonal performance patterns

Performing a data-quality validation

**🧰 Tools & Technologies**

Tool / Technology

Purpose

MySQL / SQL -Business analysis and querying

Python- Data processing and machine learning

Pandas -Data manipulation

NumPy -Numerical operations

Matplotlib -Visualization

Seaborn -Visualization

Scikit-learn-Machine learning

StandardScaler-Feature standardization

K-Means-Unsupervised clustering

Power BI-Interactive reporting

GitHub-Portfolio and version control

**🗂️ Repository Structure**

nike-shorts-tiktok-insights/
│
├── README.md
├── nike_capstone.sql
├── MODEL_TRAIN_TEST.IPYNB
├── S NIKE DASHBOARD.pbix
├── assets/
│   └── ml-clustering.png
└── youtube_shorts_tiktok_trends_2025.csv

Keep the CSV in the repository only if your project submission permits sharing the dataset. Otherwise, document the expected filename and provide instructions for obtaining it.

**🔎 Phase 1 — SQL Analysis**

The SQL analysis covers 12 Nike-focused business questions.

1. Platform Comparison

Compare total views and average engagement rate across YouTube Shorts and TikTok.

2. Regional Hotspots

Find the top 5 countries with the highest Nike campaign views on each platform.

3. Category Performance

Compare average completion rate and average watch time across categories such as sports, lifestyle, and fashion.

4. Creator Impact

Identify the top 10 creators by average views and their creator tier.

5. Hashtag ROI

Find the top 20 hashtags by total views and compare their median engagement rate.

6. Emoji Effect

Compare median engagement per 1K views between videos with and without emojis in their titles.

7. Upload Timing

Analyze average views and completion rate by day of week and upload hour.

8. Trend Momentum

Compare median engagement velocity and trend duration by trend type.

9. Device Analysis

Analyze completion rate by device type and device brand.

10. Traffic Sources

Compare traffic sources using video count, average views, and median completion rate.

11. Seasonal Insights

Compare engagement and views across event seasons.

12. Data Quality Check

Validate whether the engagement-total calculation is consistent and identify mismatched records.

The full implementation is available in:

**nike_capstone.sql**

** Phase 2 — Power BI Dashboard**

The Power BI report translates the analysis into an interactive business dashboard.

Dashboard Coverage

Executive Overview

Key KPIs include:

Total Views

Total Videos

Average Engagement Rate

Average Completion Rate

Interactive analysis includes:

Platform

Region

Country

Category

Content Insights

Category performance

Hashtag performance

Emoji impact

Duration vs watch-time analysis

Creator Insights

Top creators by views

Creator-tier comparison

Upload timing trends

Engagement breakdown

Market & Device Analysis

Country-wise performance

Region-wise performance

Device type and brand

Traffic-source comparison

Trend & Seasonality

Engagement velocity

Trend type

Trend duration

Seasonal performance

The submitted Power BI workbook contains 5 report pages.

Power BI file:

S NIKE DASHBOARD.pbix

**🤖 Phase 3 — Machine Learning**

The machine-learning notebook applies K-Means clustering to segment videos into performance groups.

Features

The clustering workflow uses:

features = [
    'title_len',
    'text_richness',
    'like_rate',
    'comment_rate',
    'share_rate',
    'views_per_day'
]

These features capture:

Content characteristics

Engagement behavior

Performance velocity

Model

KMeans(
    n_clusters=3,
    random_state=42,
    n_init=10
)

The workflow also applies StandardScaler so that features with different numerical scales can be compared more fairly.

Why K-Means?

K-Means helps discover naturally occurring groups of videos without requiring predefined labels.

This supports questions such as:

Which videos form high-engagement groups?

Which videos show stronger views-per-day performance?

Which content and engagement characteristics move together?

How can Nike use video segments to guide future content strategy?

📸 Project Screenshots

Machine Learning — Video Clusters

The notebook includes a clustering visualization comparing like rate with views per day across the discovered video clusters.



Power BI Dashboard

The Power BI deliverable is included in:

S NIKE DASHBOARD.pbix

The report contains 5 analysis pages covering executive KPIs, content, creators, market/device performance, and trend/seasonality analysis.

Recommended GitHub presentation: export one screenshot from each Power BI page and place them in assets/ with names such as powerbi-page-1.png, powerbi-page-2.png, etc., then add them below this section.

🔄 End-to-End Workflow

                 Nike 2025 Video Dataset
                           │
                           ▼
                   Data Preparation
                           │
             ┌─────────────┴─────────────┐
             ▼                           ▼
        SQL Analysis                 Python / ML
             │                           │
    12 Business Questions          K-Means Clustering
             │                           │
             └─────────────┬─────────────┘
                           ▼
                  Power BI Dashboard
                           │
                           ▼
                 Business Insights
                           │
                           ▼
              Strategic Recommendations

💡 Business Value

Platform Strategy

Determine which short-form platform delivers stronger reach and engagement.

Content Strategy

Identify categories and content characteristics associated with stronger performance.

Creator Strategy

Prioritize creators based on average views and creator-tier performance.

Hashtag Strategy

Identify high-reach hashtags while considering engagement quality.

Publishing Strategy

Use day and hour analysis to identify stronger publishing windows.

Market Strategy

Identify countries and regions with stronger campaign response.

Trend Strategy

Use engagement velocity and trend duration to understand momentum.

Audience & Device Strategy

Understand differences across devices and traffic sources.

Content Segmentation

Use machine-learning clusters to group videos into useful performance segments.

📁 Project Files

File

Description

nike_capstone.sql

SQL analysis covering 12 business questions

MODEL_TRAIN_TEST.IPYNB

Machine-learning notebook using K-Means

S NIKE DASHBOARD.pbix

Power BI interactive dashboard

README.md

Project documentation

assets/ml-clustering.png

ML clustering visualization

youtube_shorts_tiktok_trends_2025.csv

Source dataset, if permitted

🚀 How to Run the Project

1. SQL

Open your MySQL environment and create/select the project database, then run:

nike_capstone.sql

Before execution, make sure the dataset has been loaded into the expected table and update any local file/table references where necessary.

2. Python / Machine Learning

Install the required libraries:

pip install pandas numpy matplotlib seaborn scikit-learn jupyter

Open:

MODEL_TRAIN_TEST.IPYNB

Place the dataset in the expected working directory and run the notebook cells sequentially.

3. Power BI

Open:

S NIKE DASHBOARD.pbix

If Power BI asks for the dataset location, update the data source path to your local dataset.

📌 Skills Demonstrated

SQL querying

GROUP BY

CTEs

Window functions

RANK()

ROW_NUMBER()

Aggregation and ranking

Median calculations

Data-quality validation

KPI design

Power BI dashboard development

Data storytelling

Python data analysis

Feature engineering

Feature scaling

K-Means clustering

Unsupervised machine learning

Marketing analytics

Business-oriented insight generation

🎓 Capstone Project

Project: Nike Global Digital Strategy – Short-Form Video Trends Analysis

Platforms: YouTube Shorts & TikTok

Analysis Period: 2025

Approach: SQL + Power BI + Machine Learning

This capstone demonstrates an end-to-end analytics workflow: from raw data and business questions to SQL analysis, interactive dashboards, machine-learning segmentation, and strategic recommendations.

**👤 Author**

**Sudiksha Singhvi**

Data Analytics | SQL | Python | Power BI | Machine Learning

⭐ Project Highlights

This repository demonstrates how modern data analytics can combine:

SQL → Python → Machine Learning → Power BI → Business Strategy

The focus is not only on finding numbers, but on converting those numbers into insights that can support better marketing decisions.
