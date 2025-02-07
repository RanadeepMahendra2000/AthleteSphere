COPY PUBLIC.Athletes FROM 'E:/csvfiles/Athlete.csv' WITH (FORMAT CSV, HEADER);
COPY PUBLIC.Teams FROM 'E:/csvfiles/Teams.csv' WITH (FORMAT CSV, HEADER);
COPY PUBLIC.Sports FROM 'E:/csvfiles/Sports.csv' WITH (FORMAT CSV, HEADER);
COPY PUBLIC.Venues FROM 'E:/csvfiles/Venues.csv' WITH (FORMAT CSV, HEADER);
COPY PUBLIC.Events FROM 'E:/csvfiles/Events.csv' WITH (FORMAT CSV, HEADER);
COPY PUBLIC.Medals FROM 'E:/csvfiles/Medals.csv' WITH (FORMAT CSV, HEADER);
COPY PUBLIC.AthleteEvents FROM 'E:/csvfiles/AthleteEvents.csv' WITH (FORMAT CSV, HEADER);
COPY PUBLIC.TeamEvents FROM 'E:/csvfiles/TeamEvents.csv' WITH (FORMAT CSV, HEADER);
