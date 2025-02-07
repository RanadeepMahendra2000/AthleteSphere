import pandas as pd
import psycopg2
from psycopg2 import sql

# Database connection settings
db_params = {
    'dbname': 'your_database_name',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',
    'port': '5432'
}

# Connect to the PostgreSQL database
conn = psycopg2.connect(**db_params)
cursor = conn.cursor()

# Function to load CSV data into a table
def load_csv_to_table(csv_file_path, table_name, columns):
    df = pd.read_csv(csv_file_path)
    for index, row in df.iterrows():
        cursor.execute(
            sql.SQL("INSERT INTO {} ({}) VALUES ({})").format(
                sql.Identifier(table_name),
                sql.SQL(', ').join(map(sql.Identifier, columns)),
                sql.SQL(', ').join(sql.Placeholder() * len(columns))
            ),
            tuple(row[col] for col in columns)
        )
    print(f"Data loaded into {table_name}")
    conn.commit()

# Load data into Athletes table
load_csv_to_table('data/athletes.csv', 'Athletes', ['AthleteID', 'Name', 'Gender', 'Age'])

# Load data into Teams table
load_csv_to_table('data/teams.csv', 'Teams', ['TeamID', 'TeamName', 'NOC'])

# Load data into Sports table
load_csv_to_table('data/sports.csv', 'Sports', ['SportID', 'SportName'])

# Load data into Venues table
load_csv_to_table('data/venues.csv', 'Venues', ['VenueID', 'City'])

# Load data into Events table
load_csv_to_table('data/events.csv', 'Events', ['EventID', 'SportID', 'VenueID', 'Event', 'Year', 'Season'])

# Load data into Medals table
load_csv_to_table('data/medals.csv', 'Medals', ['MedalID', 'MedalType'])

# Load data into AthleteEvents table
load_csv_to_table('data/athlete_events.csv', 'AthleteEvents', ['AthleteID', 'EventID', 'MedalID'])

# Load data into TeamEvents table
load_csv_to_table('data/team_events.csv', 'TeamEvents', ['TeamID', 'EventID'])

# Close the connection
cursor.close()
conn.close()
print("Database connection closed.")
