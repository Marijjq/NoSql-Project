# Social Media Database Migration Project

This project aims to migrate data from a relational database (PostgreSQL) to a NoSQL database (Neo4j) for a social media application. It includes scripts to extract data from PostgreSQL and import it into Neo4j, as well as documentation detailing the database design, migration process, and justification for the choice of Neo4j as the NoSQL database.

## Introduction

The purpose of this project is to demonstrate the process of migrating data from a relational database to a NoSQL database for a social media application. The project involves designing database schemas, extracting data from PostgreSQL, and importing it into Neo4j using Python scripts.

## Relational Database Design and Data Modeling

The relational database schema includes tables for users, posts, comments, friendships, and likes. Each table is designed to capture specific aspects of social media interactions, such as user profiles, post content, comments, friendships, and likes. Refer to the [SQL folder](./sql) for SQL scripts to create and populate the PostgreSQL database.


## Choice of NoSQL Database

Neo4j was chosen as the NoSQL database for its native support for graph data and relationships, making it suitable for representing social network structures. A comparison with other NoSQL databases such as MongoDB and Redis was considered, but Neo4j's graph database model aligned closely with the relational data model of the social media application.

## NoSQL Database Modeling

The data from the relational model was mapped to the graph model in Neo4j, representing users as nodes and relationships such as friendships and likes as edges. Each node and relationship type was carefully designed to preserve the semantics of the relational schema while leveraging the graph database's strengths.

## Data Migration Process

The migration process involves extracting data from PostgreSQL using Python scripts ([postgres_extraction.py](./postgres_extraction.py)) and importing it into Neo4j using the Neo4j Python driver ([neo4j_import.py](./neo4j_import.py)). Challenges faced during the migration process, such as data transformation and mapping, are documented along with their resolutions.

## Instructions for Running the Scripts

### PostgreSQL Setup and Data Population

1. Create a PostgreSQL database named `social_media_db`.
2. Run the SQL scripts in the [SQL folder](./sql) to create the necessary tables and populate them with sample data.
3. Verify that the data has been successfully populated in the PostgreSQL database.

### Running the Extraction Script

1. Make sure you have Python installed on your system.
2. Install the required Python dependencies by running `pip install -r requirements.txt`.
3. Update the PostgreSQL connection details in the [config.py](./config.py) file.
4. Run the extraction script by executing `python postgres_extraction.py`.

### Running the Import Script

1. Make sure you have Python installed on your system.
2. Install the required Python dependencies by running `pip install -r requirements.txt`.
3. Update the Neo4j connection details in the [config.py](./config.py) file.
4. Run the import script by executing `python neo4j_import.py`.

## Conclusion

In conclusion, this project demonstrates the process of migrating data from a relational database to a NoSQL graph database for a social media application. By leveraging the strengths of Neo4j's graph database model, the migration process preserves the relational structure while enabling more efficient querying of social network data.

---

**Note**: Before running the migration scripts, ensure that PostgreSQL and Neo4j are properly set up and running. Also, make sure to install the required Python dependencies listed in [requirements.txt](./requirements.txt) using `pip install -r requirements.txt`.
