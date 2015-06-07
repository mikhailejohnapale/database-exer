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
    Birthdate TEXT NOT NULL
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

=================================================================================================================

INSERT INTO Realty (Id, Lot_no, Tax_dec_no) VALUES (1, "LOT2", "2008-2B-2131");
INSERT INTO Realty (Id, Lot_no, Tax_dec_no) VALUES (2, "LOT2", "2008-2B-2131");
INSERT INTO Realty (Id, Lot_no, Tax_dec_no) VALUES (3, "LOT2", "2008-2B-2131");
INSERT INTO Realty (Id, Lot_no, Tax_dec_no) VALUES (5, "LOT2", "2008-2B-2131");


INSERT INTO Address (Id, Street, District, Realty_id) VALUES (1, "New York", "District 1", 1);
INSERT INTO Address (Id, Street, District, Realty_id) VALUES (1, "New York", "District 1", 9);
INSERT INTO Address (Id, Street, District, Realty_Id) VALUES (2, "New York", "District 1", 9);

INSERT INTO Person_realty (Realty_id, Person_id) VALUES (2,2);
INSERT INTO Person_realty (Realty_id, Person_id) VALUES (2,1);

INSERT INTO Person (Id, Firstname, Middlename, Lastname, Birthdate) VALUES (1, "Fi", "M", "La", "01-01-2010");
INSERT INTO Person (Id, Firstname, Middlename, Lastname, Birthdate) VALUES (2, "Fi2", "M2", "La2", "02-21-2012");
INSERT INTO Person (Id, Firstname, Middlename, Lastname, Birthdate) VALUES (3, "Fi3", "M3", "La3", "02-01-2011");

DROP TABLE table_name;

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

SELECT * FROM Realty, Address WHERE Realty.id = 2 AND Address.id = 2;

SELECT * FROM Person, Person_realty, Realty 
WHERE Person.Id = 2, Person_realty.Person_id = 2, Person_Realty.Realty_id = Realty.id;

UPDATE Realty SET Id = 4 WHERE Id = 3;
UPDATE Realty SET Lot_no = "LOT4" WHERE Lot_no = "LOT2";

DELETE FROM Realty where Id = 1;

SELECT * FROM Person, Person_realty, Realty WHERE Person.Id = 1 AND Person_realty.Person_id = Person.Id
AND Realty.Id = Person_realty.Realty_id;