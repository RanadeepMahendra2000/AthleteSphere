CREATE TABLE Athletes (
    AthleteID INT PRIMARY KEY,
    Name VARCHAR(255),
    Gender VARCHAR(10),
    Age INT
);

CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(255),
    NOC VARCHAR(10)
);

CREATE TABLE Sports (
    SportID INT PRIMARY KEY,
    SportName VARCHAR(255)
);

CREATE TABLE Venues (
    VenueID INT PRIMARY KEY,
    City VARCHAR(255)
);

CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    SportID INT,
    VenueID INT,
    Event VARCHAR(255),
    Year INT,
    Season VARCHAR(10),
    FOREIGN KEY (SportID) REFERENCES Sports(SportID),
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID)
);

CREATE TABLE Medals (
    MedalID INT PRIMARY KEY,
    MedalType VARCHAR(10)
);

CREATE TABLE AthleteEvents (
    AthleteID INT,
    EventID INT,
    MedalID INT,
    PRIMARY KEY (AthleteID, EventID,MedalID),
    FOREIGN KEY (AthleteID) REFERENCES Athletes(AthleteID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID),
    FOREIGN KEY (MedalID) REFERENCES Medals(MedalID)
);

CREATE TABLE TeamEvents (
    TeamID INT,
    EventID INT,
    PRIMARY KEY (TeamID, EventID),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (EventID) REFERENCES Events(EventID)
);
