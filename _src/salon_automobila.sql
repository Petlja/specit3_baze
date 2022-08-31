CREATE TABLE kategorije
( id_kategorije INT PRIMARY KEY,
naziv VARCHAR(30) NOT NULL UNIQUE,
opis VARCHAR(150) );
CREATE TABLE proizvodjaci
( pib INT PRIMARY KEY,
maticni_broj INT UNIQUE,
naziv VARCHAR(100) NOT NULL UNIQUE,
adresa VARCHAR(150) NOT NULL );
CREATE TABLE modeli
( id_modela INT PRIMARY KEY,
oznaka VARCHAR(20) NOT NULL UNIQUE,
jacina_motora VARCHAR(6) NOT NULL,
broj_vrata INT NOT NULL,
tip_goriva VARCHAR(10) NOT NULL,
pib INT NOT NULL REFERENCES proizvodjaci(pib),
id_kategorije INT NOT NULL REFERENCES kategorije(id_kategorije) );
INSERT INTO kategorije VALUES(1, 'dzip', 'terensko vozilo');
INSERT INTO kategorije VALUES(2, 'limuzina', null);
INSERT INTO kategorije VALUES(3, 'kabriolet', 'mobilni krov');
INSERT INTO proizvodjaci
VALUES(12345678, 12121212, 'Mercedes-Benz', 'Daimler AG 70546, Stuttgart, Germany');
INSERT INTO proizvodjaci
VALUES(87654321, 34343434, 'Dacia', 'Str. Uzinei, nr. 1, Mioveni, judetul Arges, Romania');
INSERT INTO modeli VALUES(1, 'CLS', '258hp', 5, 'dizel', 12345678, 2);
INSERT INTO modeli VALUES(2, 'Duster', '100hp', 5, 'hibrid', 87654321, 1);
INSERT INTO modeli VALUES(3, 'Aventurier', '115hp', 3, 'benzin', 87654321, 3);
INSERT INTO modeli VALUES(4, 'Maybach', '523hp', 5, 'dizel', 12345678, 2);
INSERT INTO modeli VALUES(5, 'C300', '214hp', 3, 'dizel', 12345678, 3);
