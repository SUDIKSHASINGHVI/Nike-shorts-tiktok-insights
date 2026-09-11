import pandas as pd
from sqlalchemy import create_engine

# 1. Read CSV using pandas
df = pd.read_csv("youtube_shorts_tiktok_trends_2025.csv")

# 2. Database credentials (replace 'your_password' with your MySQL password)
username = "root"
password = "sudiksha"
host = "localhost"
port = "3306"
database = "nike_capstone"  # replace with your DB name

# 3. Create Connection
engine = create_engine(
    f"mysql+mysqlconnector://{username}:{password}@{host}:{port}/{database}?charset=utf8mb4"
)

# 4. Export directly to MySQL table
df.to_sql(
    name="youtube_shorts_tiktok_trends_2025.csv",
    con=engine,
    if_exists="replace",
    index=False,
)

print("Import complete! Refresh MySQL Workbench to see your data.")