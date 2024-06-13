import psycopg2
import pandas as pd

# Connect to PostgreSQL
conn = psycopg2.connect(
    dbname="social_media_db",
    user="postgres",
    password="postgres",
    host="localhost"
)

# Create a cursor object
cur = conn.cursor()

# Extract data from tables
users_df = pd.read_sql_query("SELECT * FROM Users", conn)
posts_df = pd.read_sql_query("SELECT * FROM Posts", conn)
comments_df = pd.read_sql_query("SELECT * FROM Comments", conn)
friendships_df = pd.read_sql_query("SELECT * FROM Friendships", conn)
likes_df = pd.read_sql_query("SELECT * FROM Likes", conn)

# Close the cursor and connection
cur.close()
conn.close()

# Save DataFrames to CSV files
users_df.to_csv("users.csv", index=False)
posts_df.to_csv("posts.csv", index=False)
comments_df.to_csv("comments.csv", index=False)
friendships_df.to_csv("friendships.csv", index=False)
likes_df.to_csv("likes.csv", index=False)
