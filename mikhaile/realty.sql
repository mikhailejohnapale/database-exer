CREATE TABLE Realty (
    Id int PRIMARY KEY NOT NULL,
    Lot_no TEXT NOT NULL,
    Tax_dec_no TEXT NOT NULL
);

CREATE TABLE Address (
    Id INTERGER PRIMARY KEY NOT NULL,
    Street TEXT NOT NULL,
    District TEXT NOT NULL,
    Realty_id INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (Realty_id) REFERENCES Realty (Id)
);

CREATE TABLE Person (
    Id INTERGER PRIMARY KEY NOT NULL,
    Firstname TEXT NOT NULL,
    Middlename TEXT NOT NULL,
    Lastname TEXT NOT NULL,
    Birthdate TEXT NOT NULL,
    Realty_id INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (Realty_id) REFERENCES Realty (Id)
);

CREATE TABLE Person_address(
    Address_id INTEGER NOT NULL,
    Person_id INTEGER NOT NULL,
    FOREIGN KEY (Address_id) REFERENCES Address (Id),
    FOREIGN KEY (Person_id) REFERENCES Person (Id)
);

CREATE TABLE Person_realty(
    Realty_id INTEGER NOT NULL,
    Person_id INTEGER NOT NULL,
    FOREIGN KEY (Realty_id) REFERENCES Realty (Id),
    FOREIGN KEY (Person_id) REFERENCES Person (Id)
);

INSERT INTO Realty (Id, Lot_no, Tax_dec_no) VALUES (1, "LOT2", "2008-2B-2131");
INSERT INTO Realty (Id, Lot_No, Tax_dec_no) VALUES (2, "LOT2", "2008-2B-2131");
INSERT INTO Realty (Id, Lot_No, Tax_dec_no) VALUES (3, "LOT2", "2008-2B-2131");


SELECT * FROM Realty;
SELECT Id FROM Realty;
SELECT Id,Tax_dec_no FROM Realty;
SELECT * FROM Realty WHERE Id = 1;
SELECT * FROM Realty WHERE Tax_dec_no LIKE "%2B%";
SELECT * FROM Realty WHERE Tax_dec_no LIKE "%2B";
SELECT * FROM Realty WHERE Tax_dec_no LIKE "2B%";

SELECT * FROM Realty WHERE Tax_dec_no LIKE "2B%" AND Id = 1;
SELECT * FROM Realty WHERE Tax_dec_no LIKE "%2B%" AND Id = 1;

SELECT * FROM Realty ORDER BY Id DESC;
