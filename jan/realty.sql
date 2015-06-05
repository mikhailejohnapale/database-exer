CREATE TABLE Realty(
    Id INTEGER PRIMARY KEY NOT NULL,
    Lot_No TEXT NOT NULL,
    Tax_Dec_No TEXT NOT NULL
);

CREATE TABLE Address(
    Id INTEGER PRIMARY KEY NOT NULL,
    Street TEXT NOT NULL,
    District TEXT NOT NULL,
    Realty_Id INTEGER NOT NULL UNIQUE,
    FOREIGN KEY (Realty_Id) REFERENCES Realty (Id)
);

CREATE TABLE Person(
    Id INTEGER PRIMARY KEY NOT NULL,
    Firstname TEXT NOT NULL,
    Middlename TEXT NOT NULL,
    Lastname TEXT NOT NULL,
    Birthdate TEXT NOT NULL,
    Realty_Id INTEGER NOT NULL,
    FOREIGN KEY (Realty_Id) REFERENCES Realty (Id)
);

CREATE TABLE Person_Address(
    Address_Id INTEGER NOT NULL,
    Person_Id INTEGER NOT NULL,
    FOREIGN KEY (Address_Id) REFERENCES Address (Id),
    FOREIGN KEY (Person_Id) REFERENCES Person (Id)
);

CREATE TABLE Person_Realty(
    Realty_Id INTEGER NOT NULL,
    Person_Id INTEGER NOT NULL,
    FOREIGN KEY (Realty_Id) REFERENCES Realty (Id),
    FOREIGN KEY (Person_Id) REFERENCES Person (Id)
);



DROP TABLE Realty;
DROP TABLE Person;



INSERT INTO Realty (Id, Lot_No, Tax_Dec_No) VALUES (1, "LOT1", "2008-2L-2331");
INSERT INTO Realty (Id, Lot_No, Tax_Dec_No) VALUES (2, "LOT2", "2008-2B-2131");
INSERT INTO Realty (Id, Lot_No, Tax_Dec_No) VALUES (3, "LOT3", "2008-2B-2311");
INSERT INTO Realty (Id, Lot_No, Tax_Dec_No) VALUES (4, "LOT4", "2008-2B-2314");


SELECT * FROM Realty;
SELECT Id FROM Realty;
SELECT Id, Tax_Dec_No FROM Realty;

SELECT * FROM Realty WHERE Id = 1;
SELECT * FROM Realty WHERE Id = 2;
SELECT * FROM Realty WHERE Id = 3;

SELECT * FROM Realty WHERE Lot_No = "LOT3";

SELECT * FROM Realty WHERE Tax_Dec_No LIKE "%2B%";
SELECT * FROM Realty WHERE Tax_Dec_No LIKE "%2B";
SELECT * FROM Realty WHERE Tax_Dec_No LIKE "2B%";

SELECT * FROM Realty WHERE Tax_Dec_No LIKE "2B%" AND Id = 1;
SELECT * FROM Realty WHERE Tax_Dec_No LIKE "%2B%" AND Id = 1;

SELECT * FROM Realty WHERE Tax_Dec_No LIKE "%2B%" OR Id = 1;

SELECT * FROM Realty ORDER BY Id DESC;
