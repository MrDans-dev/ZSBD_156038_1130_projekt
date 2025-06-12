# Dokumentacja Projektu

## Funkcje

- **NumerDokumentu**  
  Funkcja skalarna zwraca numer dokumentu z nagłówka zamówienia.

- **WynagrodzeniePracownik**  
  Funkcja tabelaryczna zwraca wynagrodzenie pracownika względem parametrów:  
  - `@ms_od`, `@ms_do` – zakres miesięcy do pobierania danych  
  - `@rok_od`, `@rok_do` – zakres lat do pobierania danych

---

## Hurtownia Danych

Dane do hurtowni danych są przeliczane za pomocą jobs. Korzystają z danych z bazy odtworzonej (`_back`), która jest przywracana za pomocą mechanizmu backup-restore  
(`Jobs -> ZSBD_BackupRestore_DW -> step: Restore`).  
Dane są odtwarzane co 3h i wtedy hurtownia danych jest przeliczana ponownie.

### Struktura danych:

- **DokumentyElem** – zebrane dane dotyczące elementów zamówienia  
  (`Jobs -> ZSBD_BackupRestore_DW -> step: DW_DokumentyElem`)
- **Klient** – zebrane dane dotyczące klientów  
  (`Jobs -> ZSBD_BackupRestore_DW -> step: DW_Klient`)
- **Ksiazki** – zebrane dane dotyczące książek  
  (`Jobs -> ZSBD_BackupRestore_DW -> step: DW_Ksiazki`)
- **NumerDokumentu** – zebrane dane dotyczące nagłówków dokumentów  
  (`Jobs -> ZSBD_BackupRestore_DW -> step: DW_Dokumenty`)
- **Pracownik** – zebrane dane dotyczące pracowników  
  (`Jobs -> ZSBD_BackupRestore_DW -> step: DW_Pracownik`)

---

## Jobs

Mechanizm automatyzacji wykonywania działań na bazie danych.  
Służy do wykonywania zapytań w odpowiedniej kolejności i czasie.

### Zastosowanie w projekcie:

- Odtwarzanie bazy danych i tworzenie hurtowni danych (`ZSBD_BackupRestore_DW`)
- Generowanie dokumentów na bazie produkcyjnej (`ZSBD_Ksiegarnia`)

### ZSBD_BackupRestore_DW

**Kroki:**

1. Wykonanie backupu bazy produkcyjnej  
2. Drop bazy odtwarzanej (`_back`)  
3. Przywrócenie bazy  
4. Usunięcie ostatniego backupu (tylko na potrzeby projektu)  
5. Przeliczenie danych do tabeli `dw.Ksiazki`  
6. Przeliczenie danych do tabeli `dw.Dokumenty`  
7. Przeliczenie danych do tabeli `dw.DokumentyElem`  
8. Przeliczenie danych do tabeli `dw.Pracownik`  
9. Przeliczenie danych do tabeli `dw.Klient`  
10. Przeliczenie danych do raportu `ZSBD_Ksiegarnia.dbo.Sprzedaz_Rok_Biezacy`  
11. Przeliczenie danych do raportu `ZSBD_Ksiegarnia.dbo.Wynagrodzenie`

### ZSBD_Ksiegarnia

**Kroki:**

1. Generuj nagłówek dokumentów zakupowych (procedura `GenerujZamNag`)  
2. Generuj elementy dokumentów zakupowych (procedura `GenerujZamElem`)  
3. Generuj dokumenty (dostawa/sprzedaż – losowo)  
4. Generuj elementy dokumentów

---

## Procedury

### Zastosowanie

Dodawanie oraz generowanie danych do tabel:

- `Ardresy`, `Autor`, `Klient`, `KsiAutLink`, `KsiazkaOpis`, `KsiazkaSeriaLink`, `Ksiazki`, `ListaPlac`, `Magazyny`, `Pracownik`, `Recenzje`, `Seria`, `Stanowisko`, `Tlumacz`, `Wydawnictwo`

### Operacje na bazie

#### DodajKlientGrupy

Dodawanie klienta do grupy lub tworzenie nowej grupy klientów.  
**Parametry:**

- `@kng_id` – id klienta / grupy  
- `@kng_idtyp` – id typu klienta / grupy  
- `@kng_gropid` – id grupy nadrzędnej  
- `@kng_groidtyp` – id typu grupy nadrzędnej  
- `@nazwa` – nazwa grupy  
- `@dom` – czy domyślna  
- `@op` – rodzaj operacji  
  - `0` – dodawanie klienta  
  - `1` – dodawanie grupy  

**Przykłady użycia:**

```sql
-- Dodanie klienta do grupy "Grupa główna"
exec dbo.DodajKlientGrupy 1,11,0,0,'',0,0

-- Dodanie grupy pod grupę "Grupa główna"
exec dbo.DodajKlientGrupy -1,-1,0,0,'Grupa 1',0,1
```

#### DodajKsiazkiGrupy

Analogiczna zasada jak w `DodajKlientGrupy`.

#### GenerujZamElem

Generowanie elementów dla nagłówków, które nie mają elementów.  
Losuje ilość i modyfikuje cenę sprzedaży.  

**Parametry:**

- `@elem_min` – minimalna ilość elementów  
- `@elem_max` – maksymalna ilość elementów  

**Przykład:**

```sql
exec dbo.GenerujZamElem 1,5
```

#### GenerujZamNag

Generowanie nagłówków zamówień w przedziale czasowym.

**Parametry:**

- `@ilosc` – ilość dokumentów  
- `@op` – rodzaj operacji  
  - `0` – losowy typ dokumentu  
  - `1` – tylko dokumenty zakupu  
- `@dataod`, `@datado` – zakres dat

**Przykład:**

```sql
exec dbo.GenerujZamNag 100,0,'2025-06-01','2025-06-05'
```

---

## Widoki

Widoki w projekcie służą do szybkiego dostępu do raportów sprzedażowych z tabeli w pamięci (`Sprzedaz_Rok_Biezacy`) przygotowanej z danych z hurtowni.

---

## Wyzwalacze

- **KlientGrpyDelete** – usuwanie powiązanych klientów przy usunięciu grupy nadrzędnej  
- **KlientGrupyUpdate** – aktualizacja nazw klientów w grupach po zmianie nazwy w tabeli `dbo.Klient`  
- **KsiazkaGrupyDelete** – analogiczne do `KlientGrpyDelete`  
- **KsiazkaGrupyUpdate** – analogiczne do `KlientGrupyUpdate`  
- **StanCheckUpdate** – aktualizacja stanów magazynowych po wygenerowaniu elementów dokumentu, blokuje sprzedaż, jeśli stan < 0


# Struktura bazy

## Autor

Tabela zawiera dane osobowe autorów książek: imię, nazwisko oraz datę urodzenia. Relacja z tabelą Ksiazka realizowana jest poprzez tabelę pośrednią KsiazkaAutorLink.

## KsiazkaAutorLink

Tabela pośrednia łącząca książki z autorami. Obie kolumny są kluczami obcymi wskazującymi odpowiednio na tabele Ksiazka i Autor.

## Ksiazka 

Tabela zawiera podstawowe informacje o książkach: tytuł, typ okładki, języki, rok wydania, liczbę stron, numer wydania, ISBN, cenę oraz wydawnictwo.

- ksi_jezyk_wydania oraz ksi_jezyk_oryginalu to klucze obce do tabeli Jezyki.
- ksi_wydawnictwo jest kluczem obcym do tabeli Wydawnictwo.
- prc_utw wskazuje pracownika, który dodał książkę do systemu (Pracownik).
- ksi_idtyp służy do zarządzania typami ID w systemie.

## Tlumacz

Tabela zawiera dane tłumaczy. Podobnie jak tabela Autor, tłumacze łączeni są z książkami przez tabelę KsiazkaTlumaczLink.

## KsiazkaTlumaczLink

Tabela pośrednia łącząca książki z tłumaczami.

## Jezyki 

Jest to prosta tabela zawierająca języki, które wykorzystywane są w tabeli Ksiazka.

## Seria

Tabela przechowuje nazwy serii wydawniczych. Powiązania z książkami obsługuje tabela KsiazkaSeriaLink.

## KsiazkaSeriaLink 

Tabela pośrednia łącząca książki z seriami.

## Wydawnictwo

Tabela zawiera dane wydawnictw: nazwę, NIP oraz identyfikator typu.

## KsiazkiGrupy

Tabela grupuje książki według gatunków i umożliwia tworzenie hierarchii (np. Fantastyka -> Dla dzieci) za pomocą rekurencji. Kolumna ksg_dom określa, czy grupa jest domyślna. "ksg_id" można być albo ID gatunku albo ID książki podpiętej pod gatunek.

## Recenzje

Zawiera recenzje książek przypisane do klientów. rec_ksiid to klucz obcy do tabeli Ksiazka, a rec_kntid do tabeli Klient.

## Pracownik

Zawiera dane pracowników. prc_stanowisko jest kluczem obcym do tabeli Stanowisko.

## Stanowisko

Opisuje stanowiska oraz przedziały płacowe przypisane do danego stanowiska.

## ListPlac

Zawiera informacje o wynagrodzeniach. lp_prcid jest kluczem obcym do tabeli Pracownik.

## Klient
Zawiera dane klientów: nazwa, akronim, NIP, typ oraz ID płatnika (knt_knpid).

## KlientGrupa

Tabela umożliwia grupowanie klientów oraz tworzenie podgrup. Zasada działania jest taka sama, jak w tabeli KsiazkiGrupy. Kolumna kng_dom oznacza grupę domyślną.

## Magazyn

Zawiera informacje o magazynach - ich nazwie i unikalnym kodzie.

## Stan
Opisuje stan magazynowy książek - ilość i czas przyjęcia. stn_ksiid i stn_magid są kluczami obcymi do tabel Ksiązka oraz Magazyn.

## ZamowieniaElementy

Tabela ZamowieniaElementy zawiera szczegółowe dane dotyczące pozycji w zamówieniu. Każdy rekord reprezentuje jedną linię (pozycję) zamówienia i przechowuje informacje o konkretnej książce, ilości, cenie oraz magazynie, z którego ma zostać wydana. Zawiera klucze obce łączące tabelę z "Magazynem" i "Książką".

## ZamowieniaNaglowek

Tabela przechowuje wszystkie ogólne informacje dotyczące danego zamówienia. Umożliwia powiązanie zamówienia z klientem, odbiorcą i płatnikiem, nawet jeśli są to różne podmioty. Dzięki oddzielnym typom ID możliwe jest obsługiwanie systemu opartego na wielu typach kontrahentów. Znajdują się tu również dane administracyjne, jak numeracja dokumentu czy osoba wystawiająca.

## RuchMagazynowy

Tabela RuchMagazynowy rejestruje wszelkie operacje magazynowe związane z zamówieniami. Kluczowe znaczenie mają tu powiązania z pozycjami zamówienia (rm_zamlp) oraz magazynem (rm_magid).

## Adres

Tabela przechowująca adresy różnych obiektów (np. wydawnictw, klientów). Relacje ustalane są przez adr_obid i adr_obidtyp. Np. wydawnictwo z "wyd_idtyp" o wartości 35 oraz "wyd_id" o wartości 6 odpowiada adresowi z "adr_obidtyp" 35 oraz "adr_obid" 6.
