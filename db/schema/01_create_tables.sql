CREATE TABLE Cladire (
    id_cladire INT PRIMARY KEY,
    nume_cladire VARCHAR(100) NOT NULL,
    adresa VARCHAR(255) NOT NULL,
    an_constructie INT
);

CREATE TABLE Tip_Eveniment (
    id_tip INT PRIMARY KEY,
    denumire VARCHAR(50) NOT NULL
);

CREATE TABLE Organizator (
    id_organizator INT PRIMARY KEY,
    nume_companie VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefon VARCHAR(20)
);

CREATE TABLE Artist (
    id_artist INT PRIMARY KEY,
    nume_artist VARCHAR(100) NOT NULL,
    gen_artistic VARCHAR(50)
);

CREATE TABLE Client (
    id_client INT PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Categorie_Bilet (
    id_categorie INT PRIMARY KEY,
    denumire VARCHAR(50) NOT NULL,
    reducere_procent DECIMAL(5,2) DEFAULT 0.00
);

CREATE TABLE Sala (
    id_sala INT PRIMARY KEY,
    id_cladire INT NOT NULL,
    nume_sala VARCHAR(100) NOT NULL,
    capacitate_totala INT NOT NULL,
    tip_sala VARCHAR(50),
    FOREIGN KEY (id_cladire) REFERENCES Cladire(id_cladire)
);

CREATE TABLE Eveniment (
    id_eveniment INT PRIMARY KEY,
    id_organizator INT,
    id_tip INT NOT NULL,
    titlu VARCHAR(150) NOT NULL,
    durata_minute INT NOT NULL,
    FOREIGN KEY (id_organizator) REFERENCES Organizator(id_organizator),
    FOREIGN KEY (id_tip) REFERENCES Tip_Eveniment(id_tip)
);

CREATE TABLE Comanda_Tranzactie (
    id_comanda INT PRIMARY KEY,
    id_client INT NOT NULL,
    data_achizitie DATETIME NOT NULL,
    total_plata DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
);

CREATE TABLE Sector_Sala (
    id_sector INT PRIMARY KEY,
    id_sala INT NOT NULL,
    nume_sector VARCHAR(50) NOT NULL,
    multiplicator_pret DECIMAL(5,2) DEFAULT 1.00,
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

CREATE TABLE Eveniment_Artist (
    id_eveniment INT,
    id_artist INT,
    PRIMARY KEY (id_eveniment, id_artist),
    FOREIGN KEY (id_eveniment) REFERENCES Eveniment(id_eveniment),
    FOREIGN KEY (id_artist) REFERENCES Artist(id_artist)
);

CREATE TABLE Programare (
    id_programare INT PRIMARY KEY,
    id_eveniment INT NOT NULL,
    id_sala INT NOT NULL,
    data_ora_inceput DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Activ',
    FOREIGN KEY (id_eveniment) REFERENCES Eveniment(id_eveniment),
    FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

CREATE TABLE Loc (
    id_loc INT PRIMARY KEY,
    id_sector INT NOT NULL,
    rand INT NOT NULL,
    numar_loc INT NOT NULL,
    FOREIGN KEY (id_sector) REFERENCES Sector_Sala(id_sector)
);

CREATE TABLE Bilet (
    id_bilet INT PRIMARY KEY,
    id_comanda INT NOT NULL,
    id_programare INT NOT NULL,
    id_loc INT,
    id_categorie INT NOT NULL,
    pret_final DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_comanda) REFERENCES Comanda_Tranzactie(id_comanda),
    FOREIGN KEY (id_programare) REFERENCES Programare(id_programare),
    FOREIGN KEY (id_loc) REFERENCES Loc(id_loc),
    FOREIGN KEY (id_categorie) REFERENCES Categorie_Bilet(id_categorie)
);