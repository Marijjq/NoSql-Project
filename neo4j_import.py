from neo4j import GraphDatabase, exceptions
import pandas as pd

# Load DataFrames from CSV files
users_df = pd.read_csv("users.csv")
posts_df = pd.read_csv("posts.csv")
comments_df = pd.read_csv("comments.csv")
friendships_df = pd.read_csv("friendships.csv")
likes_df = pd.read_csv("likes.csv")

# Define Neo4j connection parameters
neo4j_uri = "neo4j+s://d562f9cc.databases.neo4j.io"
username = "neo4j"
password = "di4VC_HU_XIt8ez1ObRmlQhPXa9lhEyFi9VWi8uyPO0"

# Connect to Neo4j
try:
    driver = GraphDatabase.driver(neo4j_uri, auth=(username, password))

    def create_nodes_and_relationships(tx, query):
        tx.run(query)

    with driver.session() as session:

        # Create User nodes
        for index, row in users_df.iterrows():
            query = f"""
            CREATE (u:User {{
                user_id: {row['user_id']},
                username: '{row['username']}',
                email: '{row['email']}',
                password: '{row['password']}',
                profile_picture: '{row.get('profile_picture', '')}',
                biography: '{row.get('biography', '')}',
                registration_date: '{row['registration_date']}'
            }})
            """
            session.execute_write(create_nodes_and_relationships, query)

        # Create Post nodes
        for index, row in posts_df.iterrows():
            query = f"""
            MATCH (u:User {{user_id: {row['user_id']}}})
            CREATE (p:Post {{
                post_id: {row['post_id']},
                content: '{row['content']}',
                timestamp: '{row['timestamp']}'
            }})
            CREATE (u)-[:POSTED]->(p)
            """
            session.execute_write(create_nodes_and_relationships, query)

        # Create Comment nodes
        for index, row in comments_df.iterrows():
            query = f"""
            MATCH (u:User {{user_id: {row['user_id']}}}), (p:Post {{post_id: {row['post_id']}}})
            CREATE (c:Comment {{
                comment_id: {row['comment_id']},
                content: '{row['content']}',
                timestamp: '{row['timestamp']}'
            }})
            CREATE (u)-[:COMMENTED]->(c)
            CREATE (c)-[:COMMENT_ON]->(p)
            """
            session.execute_write(create_nodes_and_relationships, query)

        # Create Friendship nodes
        for index, row in friendships_df.iterrows():
            query = f"""
            MATCH (u1:User {{user_id: {row['user_id_1']}}}), (u2:User {{user_id: {row['user_id_2']}}})
            CREATE (u1)-[:FRIENDS_WITH {{
                status: '{row['status']}',
                timestamp: '{row['timestamp']}'
            }}]->(u2)
            """
            session.execute_write(create_nodes_and_relationships, query)

        # Create Like nodes
        for index, row in likes_df.iterrows():
            query = f"""
            MATCH (u:User {{user_id: {row['user_id']}}}), (p:Post {{post_id: {row['post_id']}}})
            CREATE (u)-[:LIKES {{
                timestamp: '{row['timestamp']}'
            }}]->(p)
            """
            session.execute_write(create_nodes_and_relationships, query)

    print("Data import successful!")
except exceptions.ServiceUnavailable as e:
    print(f"ServiceUnavailable error: {e}")
except exceptions.AuthError as e:
    print(f"Authentication error: {e}")
except exceptions.Neo4jError as e:
    print(f"Neo4j error: {e}")
except Exception as e:
    print(f"General error: {e}")
finally:
    if 'driver' in locals():
        driver.close()
