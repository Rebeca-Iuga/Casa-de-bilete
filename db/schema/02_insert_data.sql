-- 1. Cladiri (cele 5 locatii ale hub-ului cultural)
INSERT INTO Cladire (id_cladire, nume_cladire, adresa) VALUES
(1, 'Teatrul National', 'Str. Libertatii nr. 10'),
(2, 'Opera Orasului', 'Bd. Culturii nr. 24'),
(3, 'Sala Polivalenta', 'Str. Sportului nr. 5'),
(4, 'Arena in Aer Liber', 'Parcul Central, Aleea Castanilor nr. 2'),
(5, 'Centrul de Conferinte', 'Bd. Inovatiei nr. 18');

-- 2. Tipuri de evenimente
INSERT INTO Tip_Eveniment (id_tip, denumire) VALUES
(1, 'Teatru'),
(2, 'Opera'),
(3, 'Concert'),
(4, 'Festival'),
(5, 'Conferinta');

-- 3. Organizatori
INSERT INTO Organizator (id_organizator, nume_companie, email, telefon) VALUES
(1, 'Directia Culturala Locala', 'contact@cultura-oras.ro', '0722111222'),
(2, 'ArtStage Events', 'office@artstage.ro', '0733222333'),
(3, 'SoundWave Live', 'booking@soundwave.ro', '0744333444'),
(4, 'TechFuture Romania', 'events@techfuture.ro', '0755444555');

-- 4. Artisti
INSERT INTO Artist (id_artist, nume_artist, gen_artistic) VALUES
(1, 'Trupa Teatrului National', 'Drama'),
(2, 'Orchestra Simfonica', 'Clasic'),
(3, 'Elena Marinescu', 'Soprana'),
(4, 'Alternosfera', 'Rock Alternativ'),
(5, 'Blue Note Quartet', 'Jazz'),
(6, 'Dr. Andrei Ionescu', 'Speaker Tech');

-- 5. Clienti
INSERT INTO Client (id_client, nume, prenume, email) VALUES
(1, 'Popescu', 'Andrei', 'andrei.popescu@email.ro'),
(2, 'Ionescu', 'Maria', 'maria.ionescu@email.ro'),
(3, 'Georgescu', 'Vlad', 'vlad.georgescu@email.ro'),
(4, 'Dumitru', 'Ioana', 'ioana.dumitru@email.ro'),
(5, 'Stan', 'Alexandru', 'alex.stan@email.ro');

-- 6. Categorii de bilete
INSERT INTO Categorie_Bilet (id_categorie, denumire, reducere_procent) VALUES
(1, 'Intreg', 0.00),
(2, 'Student', 25.00),
(3, 'Elev', 50.00),
(4, 'Pensionar', 30.00),
(5, 'VIP', 0.00);

-- 7. Sali
INSERT INTO Sala (id_sala, id_cladire, nume_sala, capacitate_totala, tip_sala) VALUES
(1, 1, 'Sala Mare', 450, 'Inchisa'),
(2, 1, 'Sala Studio', 120, 'Inchisa'),
(3, 2, 'Sala de Opera', 600, 'Inchisa'),
(4, 3, 'Arena Principala', 5000, 'Inchisa'),
(5, 4, 'Amfiteatrul de Vara', 1500, 'Aer Liber'),
(6, 5, 'Aula Magna', 300, 'Inchisa'),
(7, 5, 'Sala Workshop', 60, 'Inchisa');

-- 8. Evenimente
INSERT INTO Eveniment (id_eveniment, id_organizator, id_tip, titlu, durata_minute) VALUES
(1, 1, 1, 'Hamlet', 150),
(2, 1, 2, 'Carmen', 165),
(3, 3, 3, 'Concert Rock Simfonic', 120),
(4, 2, 4, 'Seara de Jazz in Parc', 180),
(5, 4, 5, 'Tech Summit 2026', 240);

-- 9. Comenzi / Tranzactii
INSERT INTO Comanda_Tranzactie (id_comanda, id_client, data_achizitie, total_plata) VALUES
(1, 1, '2026-04-10 14:20:00', 175.00),
(2, 2, '2026-04-11 09:45:00', 250.00),
(3, 3, '2026-04-12 18:10:00', 240.00),
(4, 4, '2026-04-14 11:05:00', 120.00),
(5, 5, '2026-04-15 16:30:00', 300.00),
(6, 1, '2026-04-16 20:00:00', 170.00);

-- 10. Sectoare din sali
INSERT INTO Sector_Sala (id_sector, id_sala, nume_sector) VALUES
(1, 1, 'Parter'),
(2, 1, 'Balcon'),
(3, 3, 'Loja VIP'),
(4, 3, 'Parter'),
(5, 4, 'Peluza'),
(6, 4, 'Tribuna A'),
(7, 5, 'Zona Centrala'),
(8, 6, 'Auditoriu');

-- 11. Asociere Eveniment - Artist
INSERT INTO Eveniment_Artist (id_eveniment, id_artist) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(4, 5),
(5, 6);

-- 12. Programari (inclusiv Hamlet programat in doua zile diferite)
INSERT INTO Programare (id_programare, id_eveniment, id_sala, data_ora_inceput, status) VALUES
(1, 1, 1, '2026-05-15 19:00:00', 'Activ'),
(2, 2, 3, '2026-05-16 18:30:00', 'Activ'),
(3, 3, 4, '2026-05-20 20:00:00', 'Activ'),
(4, 4, 5, '2026-06-05 19:30:00', 'Activ'),
(5, 5, 6, '2026-06-10 09:00:00', 'Activ'),
(6, 1, 1, '2026-05-17 19:00:00', 'Activ');

-- 13. Locuri fizice
INSERT INTO Loc (id_loc, id_sector, rand, numar_loc) VALUES
(1, 1, 1, 1),
(2, 1, 1, 2),
(3, 2, 1, 5),
(4, 3, 1, 1),
(5, 4, 3, 10),
(6, 6, 5, 12),
(7, 6, 5, 13),
(8, 7, 2, 4),
(9, 7, 2, 5),
(10, 8, 1, 1),
(11, 8, 1, 2);

-- 14. Bilete emise
INSERT INTO Bilet (id_bilet, id_comanda, id_programare, id_loc, id_categorie, pret_final) VALUES
(1, 1, 1, 1, 1, 100.00),
(2, 1, 1, 2, 2, 75.00),
(3, 2, 2, 4, 5, 250.00),
(4, 3, 3, 6, 1, 120.00),
(5, 3, 3, 7, 1, 120.00),
(6, 4, 4, 8, 3, 40.00),
(7, 4, 4, 9, 1, 80.00),
(8, 5, 5, 10, 1, 300.00),
(9, 6, 6, 1, 4, 70.00),
(10, 6, 6, 3, 1, 100.00);