# Casă de Bilete - Proiect BD

## 1. Informații Generale
- **Disciplina:** Proiectarea Bazelor de Date
- **Student:** Iuga Rebeca-Daniela
- **Grupa:** 1
- **Cadru didactic:** Văduva Bogdan
- **An:** 2026

## 2. Descrierea Proiectului
Acest proiect este o bază de date pentru evenimentele dintr-un oraș. Am ales 5 clădiri mari unde se țin spectacole. Baza de date mă ajută să țin o evidență clară a clădirilor, a sălilor, a spectacolelor (cu dată și oră exactă) și a biletelor cumpărate de clienți, astfel încât să nu se suprapună locurile.

## 3. Tabelele Bazei de Date
Ca să fie totul organizat și să nu repet date aiurea, am folosit 14 tabele, împărțite așa:

**Clădiri și Săli:**
1. `Cladire` (cele 5 clădiri mari din oraș)
2. `Sala` (sălile din fiecare clădire)
3. `Sector_Sala` (cum e împărțită sala, ex: VIP, Balcon)
4. `Loc` (scaunul exact pe care te așezi)

**Spectacole:**
5. `Organizator` (firma care aduce evenimentul)
6. `Tip_Eveniment` (teatru, concert, stand-up etc.)
7. `Eveniment` (numele spectacolului și cât durează)
8. `Artist` (actorii sau trupa)
9. `Eveniment_Artist` (ce artiști vin la ce spectacol)
10. `Programare` (în ce zi, la ce oră și în ce sală se ține spectacolul)

**Clienți și Bilete:**
11. `Client` (omul care cumpără biletul)
12. `Categorie_Bilet` (reducerile, ex: bilet întreg, bilet de student)
13. `Comanda_Tranzactie` (plata efectivă)
14. `Bilet` (biletul final care leagă clientul de spectacol și de scaun)

## 4. Ce găsești în acest proiect
- `docs/` - Aici este documentația oficială în format Word.
- `diagrams/` - Schema cu tabelele bazei de date.
- `db/` - Fișierele cu cod SQL unde creez tabelele.
- `app/` - Aici va fi aplicația finală și codul pentru inteligența artificială.

## 5. Ce am făcut până acum (Săptămâna 4)
- Am setat dosarele pe GitHub.
- M-am gândit mai bine la idee și am adăugat mai multe tabele ca să pot pune mai multe clădiri și săli.
- Am făcut poza nouă cu schema pentru cele 14 tabele.
- Am modificat fișierul Word la partea de "Scop".
- Am scris codul SQL care creează tabelele noi.
