# Casă de Bilete - Proiect BD

## 1. Informații Generale
- **Disciplina:** Proiectarea Bazelor de Date
- **Student:** Iuga Rebeca-Daniela
- **Grupa:** 1
- **Cadru didactic:** Văduva Bogdan
- **An:** 2026

## 2. Descrierea Proiectului și Cerințele
Acest proiect este o bază de date făcută de la zero pentru gestionarea evenimentelor dintr-un oraș. Cerința este să fac un sistem care să poată susține activitatea unui hub cultural format din 5 clădiri mari unde se organizează evenimente în mod constant.

Ca să fie cât mai realist, am gândit următoarea structură:
- **Cele 5 clădiri:** Am ales locații precum Teatrul Național, Opera, Sala Polivalentă, o arenă în aer liber și un centru de conferințe.
- **Scaunele și sectoarele:** Sistemul trebuie să știe exact câte locuri are fiecare sală și fiecare scaun disponibil, ca să nu se vândă mai multe bilete decât locurile reale din sală.
- **Problema principală:** Cea mai mare problemă a unei case de bilete este să nu dea același loc la două persoane diferite. Am rezolvat asta separând detaliile evenimentului de data și ora la care are loc de fapt.
- **Drumul clientului:** Baza de date urmărește toți pașii unui cumpărător, de la înregistrare, la plata comenzii și până la emiterea biletului.
- **Pregătirea pentru Inteligența Artificială:** Mai târziu în proiect, datele vor fi scoase de aici pentru a antrena un model care să ghicească cum vor merge vânzările pe viitor.

## 3. Tabelele Bazei de Date și Logica lor
Baza de date este construită din 14 tabele care se leagă între ele într-o ordine clară, de la clădirea mare până la scaunul exact, și de la organizator până la client. Iată cum funcționează fiecare:

### Partea de Locații (Unde se țin evenimentele)
- Totul începe cu tabelul `Cladire`. Aici avem cele 5 locații mari din oraș, cu numele și adresa lor.
- O clădire este prea mare ca să fie folosită mereu cu totul, așa că se împarte în săli. Pentru asta este tabelul `Sala`. Se leagă direct de clădire (de exemplu, știm că Sala Mare aparține de Teatrul Național) și reține numărul maxim de oameni care încap.
- Pentru că o sală are prețuri diferite în funcție de cât de bine se vede spre scenă, am creat tabelul `Sector_Sala`. Acesta se leagă de sală și împarte spațiul în zone precum Loja, Balcon sau Peluză.
- Ultimul pas este tabelul `Loc`. Acesta se leagă de sector și reține numărul rândului și numărul scaunului. Așa putem găsi orice scaun trecând prin lanțul: *Loc -> Sector -> Sală -> Clădire*.

### Partea de Evenimente (Ce anume se organizează)
- La baza oricărui eveniment stau două lucruri: cine îl aduce și ce fel de eveniment este. Pentru asta avem tabelele independente `Organizator` (cu datele firmei) și `Tip_Eveniment` (care ne spune dacă este teatru, concert sau conferință).
- Tabelul central de aici este `Eveniment`. El se leagă de Organizator și de Tip_Eveniment și stochează titlul și cât durează în minute. Aici nu punem data, pentru că același eveniment se poate organiza de mai multe ori pe an.
- Pentru cei care urcă pe scenă avem tabelul `Artist`. Pentru că la un eveniment participă mai mulți artiști, iar un artist merge la mai multe evenimente diferite, am făcut tabelul de legătură `Eveniment_Artist`. Acesta unește evenimentul cu toți artiștii care participă la el.
- Planificarea se rezolvă în tabelul `Programare`. Acest tabel ia evenimentul din tabelul Eveniment, ia o încăpere din tabelul Sala și le combină cu o dată și o oră exactă de începere. Dacă un eveniment are loc vineri și sâmbătă, vor fi două rânduri diferite aici.

### Partea de Clienți și Bilete (Cum se vinde)
- La început avem tabelul `Client`, unde salvăm numele și adresa de email a cumpărătorului.
- Avem și tabelul `Categorie_Bilet`, care ține cont de reduceri (dacă este bilet întreg, pentru elev sau pentru student).
- Când clientul plătește, se adaugă date în tabelul `Comanda_Tranzactie`. Acest tabel este legat de Client și arată data la care s-au dat banii și suma totală (pentru că un om poate cumpăra 3 bilete deodată).
- Tabelul `Bilet` este cel care adună toate firele bazei de date. Un bilet generat aici se leagă de Comanda_Tranzactie (ca să arate că e plătit), de Programare (ca să știm la ce oră și dată trebuie să meargă clientul), de Loc (ca să știm exact pe ce scaun are voie să se așeze) și de Categorie_Bilet (ca să știm dacă e bilet cu reducere).

## 4. Ce găsești în acest proiect
- `docs/` - Aici este documentația oficială în format Word.
- `diagrams/` - Schema vizuală cu legăturile dintre cele 14 tabele.
- `db/` - Fișierele cu cod SQL unde se creează tabelele și se adaugă datele.
- `app/` - Aici va fi aplicația finală și codul pentru inteligența artificială.

## 5. Ce am făcut până acum (Săptămâna 4 și 5)
- Am setat dosarele pe GitHub.
- Am regândit logica proiectului și am mărit baza de date la 14 tabele ca să pot gestiona cele 5 clădiri.
- Am refăcut diagrama bazei de date și documentația Word la părțile de scop, obiective, analiză și dicționar de date.
- Am scris codul SQL pentru crearea tabelelor cu toate legăturile logice.
