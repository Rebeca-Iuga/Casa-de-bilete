CREATE TABLE Categorii_Evenimente (
    id_categorie INT PRIMARY KEY,
    nume_categorie VARCHAR(50) NOT NULL
);

CREATE TABLE Locatii (
    id_locatie INT PRIMARY KEY,
    nume_sala VARCHAR(100) NOT NULL,
    capacitate INT NOT NULL
);

CREATE TABLE Clienti (
    id_client INT PRIMARY KEY,
    nume VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Evenimente (
    id_eveniment INT PRIMARY KEY,
    id_categorie INT,
    id_locatie INT,
    titlu VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_categorie) REFERENCES Categorii_Evenimente(id_categorie),
    FOREIGN KEY (id_locatie) REFERENCES Locatii(id_locatie)
);

CREATE TABLE Comenzi (
    id_comanda INT PRIMARY KEY,
    id_client INT,
    data_comanda DATE,
    FOREIGN KEY (id_client) REFERENCES Clienti(id_client)
);

CREATE TABLE Bilete (
    id_bilet INT PRIMARY KEY,
    id_comanda INT,
    id_eveniment INT,
    numar_loc INT NOT NULL,
    FOREIGN KEY (id_comanda) REFERENCES Comenzi(id_comanda),
    FOREIGN KEY (id_eveniment) REFERENCES Evenimente(id_eveniment)
);