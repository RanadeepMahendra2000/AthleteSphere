# AthleteSphere

**Streamlining Sports Data Management for Enhanced Analysis and Predictive Modeling**

## Project Overview
AthleteSphere is a comprehensive database system designed to manage sports data efficiently, enabling detailed analysis and predictive modeling for sports competitions. The system addresses common challenges in data organization, integrity, and retrieval, providing a robust platform for sports administrators, coaches, athletes, analysts, and researchers. By leveraging advanced database normalization and indexing techniques, AthleteSphere ensures optimized query performance and insightful data analytics.

## Data Source
- **Dataset:** [Olympics Legacy 1896-2020](https://www.kaggle.com/datasets/krishd123/olympics-legacy-1896-2020)
- **Main Table:** `Athlete.csv`

## Database Schema
We structured the database using SQL scripts, ensuring normalization and integrity through relational design. The following tables were created using `create.sql`:

1. **Athletes (R1)**  
   - **Primary Key:** `AthleteID`  
   - **Attributes:** `AthleteID`, `Name`, `Gender`, `Age`  
   - **Functional Dependency:** `AthleteID → Name, Gender, Age`

2. **Teams (R2)**  
   - **Primary Key:** `TeamID`  
   - **Attributes:** `TeamID`, `TeamName`, `NOC`  
   - **Functional Dependency:** `TeamID → TeamName, NOC`

3. **Sports (R3)**  
   - **Primary Key:** `SportID`  
   - **Attributes:** `SportID`, `SportName`  
   - **Functional Dependency:** `SportID → SportName`

4. **Venues (R4)**  
   - **Primary Key:** `VenueID`  
   - **Attributes:** `VenueID`, `City`, `Country`  
   - **Functional Dependency:** `VenueID → City, Country`

5. **Events (R5)**  
   - **Primary Key:** `EventID`  
   - **Foreign Keys:** `SportID`, `VenueID`  
   - **Attributes:** `EventID`, `EventName`, `Year`, `Season`, `SportID`, `VenueID`  
   - **Functional Dependency:** `EventID → EventName, Year, Season`

6. **Medals (R6)**  
   - **Primary Key:** `MedalID`  
   - **Attributes:** `MedalID`, `MedalType`  
   - **Functional Dependency:** `MedalID → MedalType`

7. **AthleteEvents (R7)**  
   - **Composite Primary Key:** `(AthleteID, EventID)`  
   - **Attributes:** `AthleteID`, `EventID`, `MedalID`  
   - **Functional Dependency:** `(AthleteID, EventID) → MedalID`

8. **TeamEvents (R8)**  
   - **Composite Primary Key:** `(TeamID, EventID)`  
   - **Attributes:** `TeamID`, `EventID`, `MedalID`  
   - **Functional Dependency:** `(TeamID, EventID) → MedalID`

## Database Integration
Using our Python script (`script.py`), we:
- Established connections to the PostgreSQL database.
- Decomposed and normalized data from raw CSV files.
- Integrated all tables to form a relational database (`normalize.db`).

## Loading Data
Data was imported into PostgreSQL using the `load.sql` script, which inserted values into their respective attributes from CSV files.

## Query Execution
We executed and demonstrated various SQL queries on `normalize.db` using PostgreSQL to:
- Analyze athlete performances.
- Track team event participation.
- Aggregate medal distributions.
- Optimize query performance with indexing techniques.

## Results and Report
Our queries were thoroughly analyzed, optimized, and documented in [report.pdf](report.pdf). The report details the database design process, normalization, indexing strategies, and insights derived from the data.

## How to Set Up Locally
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/AthleteSphere.git
   cd AthleteSphere
   ```

2. **Set Up PostgreSQL Database:**
   - Create a PostgreSQL database.
   - Run `create.sql` to set up tables.
   - Run `load.sql` to insert data into the tables.

3. **Run Python Scripts:**
   - Ensure you have the required libraries installed:
     ```bash
     pip install pandas psycopg2
     ```
   - Execute the analysis using `script.py` or open `script.ipynb` for detailed analysis.



