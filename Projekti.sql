CREATE TABLE HarjoitusRyhmä (
    Kurssikoodi       CHAR (8),
    Nimi              TEXT     REFERENCES Kurssit (nimi),
    Ryhmänumero       INT,
    Aloituspäivämäärä DATE,
    Maksimipaikat     INT,
    PRIMARY KEY (
        Kurssikoodi,
        Aloituspäivämäärä,
        nimi
    ),
    FOREIGN KEY (
        Kurssikoodi
    )
    REFERENCES Kurssit (Kurssikoodi) 
);

CREATE TABLE Ilmoittautuminen (
    Kurssikoodi                 TEXT,
    Tenttikoodi                 TEXT,
    kurssi_ilmoittautumistunnus TEXT,
    Opiskelijanumero            TEXT,
    PRIMARY KEY (
        Kurssikoodi,
        kurssi_ilmoittautumistunnus
    ),
    FOREIGN KEY (
        Kurssikoodi
    )
    REFERENCES Kurssit (Kurssikoodi),
    FOREIGN KEY (
        tenttikoodi
    )
    REFERENCES Tentti (TenttiKoodi),
    FOREIGN KEY (
        Opiskelijanumero
    )
    REFERENCES Opiskelija (Opiskelijanumero) 
);

CREATE TABLE Ilmoittautuu (
    Tenttikoodi          TEXT,
    opiskelijanumero     TEXT,
    Ilmoittautumistunnus TEXT,
    PRIMARY KEY (
        tenttikoodi,
        opiskelijanumero
    ),
    FOREIGN KEY (
        tenttikoodi
    )
    REFERENCES Tentti (TenttiKoodi),
    FOREIGN KEY (
        opiskelijanumero
    )
    REFERENCES Opiskelija (Opiskelijanumero) 
);

CREATE TABLE Kurssikerta (
    Kurssitunnus      TEXT,
    Aloituspäivämäärä DATE,
    Lopetuspäivämäärä DATE,
    PRIMARY KEY (
        Kurssitunnus,
        Aloituspäivämäärä
    ),
    FOREIGN KEY (
        Kurssitunnus
    )
    REFERENCES Kurssit (Kurssikoodi) 
);

CREATE TABLE Kurssit (
    Kurssikoodi   CHAR (8) PRIMARY KEY,
    nimi          TEXT,
    opintopisteet INT
);

CREATE TABLE Kuuluu (
    Varaustunnus TEXT,
    Ryhmänumero  INT,
    PRIMARY KEY (
        Varaustunnus
    ),
    FOREIGN KEY (
        Varaustunnus
    )
    REFERENCES Varaus (Varaustunnus),
    FOREIGN KEY (
        Ryhmänumero
    )
    REFERENCES HarjoitusRyhmä (Ryhmänumero) 
);

CREATE TABLE Kuuluu2 (
    Kurssitunnus      TEXT,
    Päivämäärä        DATE,
    Aloituspäivämäärä DATE,
    PRIMARY KEY (
        Kurssitunnus,
        Päivämäärä
    ),
    FOREIGN KEY (
        Kurssitunnus,
        Aloituspäivämäärä
    )
    REFERENCES Kurssikerta (Kurssitunnus,
    Aloituspäivämäärä),
    FOREIGN KEY (
        Päivämäärä
    )
    REFERENCES Luento (Päivämäärä) 
);

CREATE TABLE Kuuluu4 (
    kurssitunnus      TEXT,
    ryhmänumero       INT,
    aloituspäivämäärä DATE,
    PRIMARY KEY (
        kurssitunnus
    ),
    FOREIGN KEY (
        kurssitunnus,
        ryhmänumero
    )
    REFERENCES Harjoitusryhmä (Kurssikoodi,
    ryhmänumero) 
);

CREATE TABLE Opiskelija (
    opiskelijanumero TEXT,
    nimi             TEXT,
    Tutkinto         TEXT,
    syntymäaika      DATE,
    PRIMARY KEY (
        opiskelijanumero
    )
);

CREATE TABLE Rakennus (
    Osoite TEXT,
    Nimi   TEXT,
    PRIMARY KEY (
        Osoite
    )
);

CREATE TABLE Sali (
    Tunnus       INT,
    Paikkamäärä  INT,
    Tenttipaikat INT,
    Rakennus     TEXT,
    PRIMARY KEY (
        Tunnus
    ),
    FOREIGN KEY (
        Rakennus
    )
    REFERENCES Rakennus (Osoite) 
);

CREATE TABLE Sisältää (
    Tunnus INT,
    Osoite TEXT,
    PRIMARY KEY (
        Tunnus
    ),
    FOREIGN KEY (
        Osoite
    )
    REFERENCES Rakennus (Osoite) 
);

CREATE TABLE Sisältää2 (
    Tunnus      TEXT,
    Tuotenumero INT,
    PRIMARY KEY (
        tunnus
    ),
    FOREIGN KEY (
        Tuotenumero
    )
    REFERENCES Varuste (Tuotenumero),
    FOREIGN KEY (
        Tunnus
    )
    REFERENCES Sali (Tunnus) 
);

CREATE TABLE Sisältää3 (
    Kurssikoodi TEXT,
    Tenttikoodi TEXT,
    PRIMARY KEY (
        kurssikoodi,
        tenttikoodi
    ),
    FOREIGN KEY (
        kurssikoodi
    )
    REFERENCES Kurssit,
    FOREIGN KEY (
        tenttikoodi
    )
    REFERENCES Tentti (tenttikoodi) 
);

CREATE TABLE Sisältää4 (
    kurssitunnus TEXT,
    pisteet      FLOAT,
    PRIMARY KEY (
        kurssitunnus
    ),
    FOREIGN KEY (
        kurssitunnus
    )
    REFERENCES Kurssikerta (Kurssitunnus) 
);

CREATE TABLE Sisältää5 (
    Kurssikoodi       TEXT,
    Aloituspäivämäärä DATE,
    PRIMARY KEY (
        Kurssikoodi,
        Aloituspäivämäärä
    ),
    FOREIGN KEY (
        aloituspäivämäärä
    )
    REFERENCES Kurssikerta (Aloituspäivämäärä),
    FOREIGN KEY (
        Kurssikoodi
    )
    REFERENCES Kurssit (Kurssikoodi) 
);

CREATE TABLE Tehtäväpisteet (
    Kurssikoodi      TEXT,
    opiskelijanumero TEXT,
    pisteet          FLOAT,
    PRIMARY KEY (
        Kurssikoodi,
        opiskelijanumero
    ),
    FOREIGN KEY (
        Kurssikoodi
    )
    REFERENCES Kurssit (Kurssikoodi),
    FOREIGN KEY (
        opiskelijanumero
    )
    REFERENCES Opiskelija (Opiskelijanumero) 
);

CREATE TABLE Tekee (
    Varaustunnus TEXT,
    TyöntekijäID TEXT,
    PRIMARY KEY (
        varaustunnus,
        TyöntekijäID
    ),
    FOREIGN KEY (
        Varaustunnus
    )
    REFERENCES Varaus (Varaustunnus),
    FOREIGN KEY (
        TyöntekijäID
    )
    REFERENCES Työntekijä (TyöntekijäID) 
);

CREATE TABLE Tekee2 (
    kurssikoodi                 TEXT,
    kurssi_ilmoittautumistunnus TEXT,
    opiskelijanumero            TEXT,
    PRIMARY KEY (
        kurssikoodi,
        kurssi_ilmoittautumistunnus,
        opiskelijanumero
    ),
    FOREIGN KEY (
        kurssikoodi,
        kurssi_ilmoittautumistunnus
    )
    REFERENCES Ilmoittautuminen (Kurssikoodi,
    kurssi_ilmoittautumistunnus),
    FOREIGN KEY (
        opiskelijanumero
    )
    REFERENCES Opiskelija (Opiskelijanumero) 
);

CREATE TABLE Tentti (
    TenttiKoodi CHAR (10),
    Kurssikoodi CHAR (8),
    päivämäärä  DATE,
    Alkamisaika TIME,
    Paikka      TEXT,
    PRIMARY KEY (
        TenttiKoodi
    ),
    FOREIGN KEY (
        Kurssikoodi
    )
    REFERENCES Kurssit (Kurssikoodi) 
);

CREATE TABLE Tenttisuoritus (
    tenttitunnus     TEXT,
    opiskelijanumero TEXT,
    arvosana         INT,
    tenttipäivämäärä DATE,
    PRIMARY KEY (
        tenttitunnus,
        opiskelijanumero
    ),
    FOREIGN KEY (
        tenttitunnus
    )
    REFERENCES Tentti (TenttiKoodi),
    FOREIGN KEY (
        opiskelijanumero
    )
    REFERENCES Opiskelija (Opiskelijanumero) 
);

CREATE TABLE TenttiVaraus (
    Varaustunnus INT,
    TenttiKoodi  CHAR (10),
    Tilaisuus    TEXT,
    Alkamisaika  TIME,
    Loppumisaika TIME,
    Päiväys      DATE,
    Huonetunnus  INT,
    PRIMARY KEY (
        Varaustunnus
    ),
    FOREIGN KEY (
        Huonetunnus
    )
    REFERENCES Sali (Tunnus),
    FOREIGN KEY (
        TenttiKoodi
    )
    REFERENCES Tentti (TenttiKoodi) 
);

CREATE TABLE Työntekijä (
    TyöntekijäID    INT,
    Nimike          TEXT,
    Puhelinnumero   CHAR (13),
    Osoite          TEXT,
    Aloittamispäivä DATE,
    Lopetuspäivä    DATE,
    Nimi            TEXT,
    PRIMARY KEY (
        työntekijäID
    )
);

CREATE TABLE Varaus (
    Varaustunnus INT,
    Kurssikoodi  CHAR (8),
    Ryhmänumero  INT,
    Tilaisuus    TEXT,
    Alkamisaika  TIME,
    Loppumisaika TIME,
    Päiväys      DATE,
    Huonetunnus  INT,
    PRIMARY KEY (
        Varaustunnus
    ),
    FOREIGN KEY (
        Huonetunnus
    )
    REFERENCES Sali (Tunnus),
    FOREIGN KEY (
        Kurssikoodi,
        Ryhmänumero
    )
    REFERENCES HarjoitusRyhmä (Kurssikoodi,
    Ryhmänumero) 
);

CREATE TABLE Varuste (
    Tuotenumero INT,
    Kuvaus      TEXT,
    Salitunnus  INT,
    PRIMARY KEY (
        Tuotenumero
    ),
    FOREIGN KEY (
        Salitunnus
    )
    REFERENCES Sali (Tunnus) 
);

CREATE VIEW TietotieSalit AS
    SELECT *
      FROM Sali
     WHERE Sali.Rakennus = 'Tietotie';

CREATE INDEX TutkintoIndex ON Opiskelija(Tutkinto); 

CREATE INDEX TilaisuusIndex ON Varaus(Tilaisuus); 

CREATE INDEX NimikeIndex ON Työntekijä(Nimike);

INSERT INTO Kurssikerta (Kurssitunnus, Aloituspäivämäärä, Lopetuspäivämäärä)
VALUES (1, '2023-09-01', '2023-12-01');

INSERT INTO Sisältää5 (Kurssikoodi, Kurssitunnus, Aloituspäivämäärä)
VALUES ('MAT101', 1, '2023-09-01');

INSERT INTO Sisältää2 (Tunnus, Tuotenumero) VALUES (1, 100), (2, 101), (3, 102);

INSERT INTO Kurssit(kurssikoodi, nimi, opintopisteet) VALUES ('CS-A11', 'Fysiikka', 5), ('CS-A22', 'Matikka', 5);

INSERT INTO Rakennus(Osoite, nimi) VALUES ('Otaniementie 1', 'Kandikeskus'), ('Tietotie', 'T-Talo');

INSERT INTO Tentti(Tenttikoodi, Kurssikoodi, päivämäärä, Alkamisaika, Paikka) VALUES ('EX2234', 'CS-A2222', '22-02-2022', '14:00:00', 'Otakaari'), ('EX2343', 'CS-A1110', '23-02-2022', '12:00:00', 'Otakaari');

INSERT INTO Sali(Tunnus, paikkamäärä, Tenttipaikat, Rakennus) VALUES ('U2', 200, 100, 'Otaniementie 1'), ('U1', 40, 10, 'Otaniementie 1'), ('Sali 1', 100, 60, 'Tietotie');

INSERT INTO Varuste(Tuotenumero, Kuvaus, Salitunnus) VALUES (2232, 'Projektori', 'U2'), (2234, 'Karttakeppi', 'U2'), (2235, 'Projektori', 'U1');

INSERT INTO Ilmoittautuu(Tenttikoodi, opiskelijanumero, ilmoittautumistunnus) VALUES ('EX2234', 213222, 'ILMO1234'), ('EX2343', 23453, 'ILMO2345');

INSERT INTO Kurssikerta(Kurssitunnus, Aloituspäivämäärä, Lopetuspäivämäärä) VALUES ('CS-A1110', '01-01-2022', '09-02-2022'), ('CS-A1110', '01-01-2021', '09-02-2021'), ('CS-A0012', '01-01-2022', '09-02-2022');

INSERT INTO Ilmoittautuu(Tenttikoodi, opiskelijanumero, ilmoittautumistunnus) VALUES ('EX2234', 23453, 'ILMO2395');

INSERT INTO Kurssit(Kurssikoodi, nimi, opintopisteet) VALUES ('ABC123', 'Introduction to Computer Science', 5), ('ANT201', 'Cultural Anthropology', 4), ('MAT101', 'Calculus I', 5), ('PHY101', 'Intro to Physics', 3), ('CSC201', 'Data Structures and Algorithms', 6), ('BIO101', 'Introduction to Biology', 4), ('PSY101', 'Introduction to Psychology', 3), ('ENG101', 'English Composition', 3), ('HIS201', 'World History II', 4);

SELECT COUNT (*) 

FROM Ilmoittautuu 

WHERE Tenttikoodi = ’EX2343’;


SELECT Paikka 

FROM Tentti 

WHERE TenttiKoodi = ’EX2343’;

 
SELECT Kurssit.nimi, Kurssit.Kurssikoodi, COUNT(Sisältää3.tenttikoodi) AS exam_count 

FROM Kurssit 

LEFT JOIN Sisältää3 ON Kurssit.Kurssikoodi = Sisältää3.Kurssikoodi 

GROUP BY Kurssit.nimi, Kurssit.Kurssikoodi; 


INSERT INTO Sisältää3 (Kurssikoodi, tenttikoodi) 

VALUES ('CSC101', 'EXM2022-01'); 


INSERT INTO Kurssit (Kurssikoodi, nimi, opintopisteet) 

VALUES ('CSC102', 'Database Management Systems', 5); 

UPDATE Sisältää3 

SET Kurssikoodi = 'CSC102' 

WHERE tenttikoodi = 'EXM2022-01'; 


SELECT Kurssit.nimi, Tentti.TenttiKoodi, Tentti.päivämäärä, Tentti.Alkamisaika, Tentti.Paikka 

FROM Kurssit 

INNER JOIN Tentti ON Kurssit.Kurssikoodi = Tentti.Kurssikoodi 

WHERE Tentti.päivämäärä = '2023-05-06'; 


DELETE FROM Sisältää3 

WHERE Kurssikoodi = 'CSC102'; 


SELECT AVG(paikkamäärä), Rakennus 

              FROM Sali 

              WHERE paikkamäärä > 50; 


SELECT Sali.Tunnus, COUNT(Varuste.Tuotenumero) AS Lukumäärä 

FROM Sali 

INNER JOIN Varuste ON Sali.Tunnus = Varuste.Salitunnus 

      WHERE Sali.Tunnus = Varuste.Salitunnus 

GROUP BY Sali.Tunnus; 


DELETE FROM Varuste 

WHERE Varuste.Kuvaus = 'Projektori' 


SELECT Sali.Rakennus 

FROM Sali 

INNER JOIN Varuste ON Sali.Tunnus = Varuste.Salitunnus 

WHERE Varuste.Kuvaus NOT IN ( 

SELECT Varuste.Kuvaus 

FROM Varuste 

WHERE Varuste.Kuvaus = 'Projektori' 

); 


SELECT Opiskelija.Nimi, Tehtäväpisteet.Pisteet  

FROM Opiskelija  

INNER JOIN Tehtäväpisteet ON Opiskelija.Opiskelijanumero = Tehtäväpisteet.Opiskelijanumero
  
WHERE Tehtäväpisteet.Kurssikoodi = 'CS-A2222' AND Opiskelija.Tutkinto = 'Tik'; 


SELECT Opiskelija.Nimi, Tehtäväpisteet.Pisteet 

FROM Opiskelija 

INNER JOIN Tehtäväpisteet ON Opiskelija.Opiskelijanumero = Tehtäväpisteet.Opiskelijanumero 

WHERE Tehtäväpisteet.Kurssikoodi = 'CS-A0012' AND Tehtäväpisteet.Pisteet < 80;



SELECT Opiskelija.Nimi 

FROM Opiskelija 

INNER JOIN Ilmoittautuu ON Opiskelija.Opiskelijanumero = Ilmoittautuu.Opiskelijanumero 

WHERE Ilmoittautuu.Tenttikoodi = 'EX2234';


SELECT Sali.Tunnus, Sali.Rakennus
FROM Sali
WHERE Sali.Tenttipaikat > (
    SELECT COUNT(*)
    FROM Ilmoittautuu
    WHERE Ilmoittautuu.TenttiKoodi = 'EX2234');



