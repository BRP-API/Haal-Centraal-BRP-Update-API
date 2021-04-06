# language: nl

Functionaliteit: Als gebruiker wil ik wijzigingen kunnen opvragen van zowel binnengemeentelijke als buitengemeentelijke personen
   Deze feature beschrijft de werking van de update applicatie voor het bijhouden van volgindicaties op zowel binnengemeentelijke als buitengemeentelijke personen. 
   Voor buitengemeentelijke personen moeten volgindicaties bij GBA-V worden geplaatst zodat de applicatie ook voor deze personen wijzigingen ontvangt.
   
   Om wijzigingen te ontvangen van buitengemeentelijke personen, moet een volgindicatie worden gezet in GBA-V middels een Ap01 bericht.
   Een volgindicatie in GBA-V wordt beëindigd met een Av01 bericht.
    
   Hierbij gelden 3 hoofdregels:
   1. Wanneer er ten minste één gebruiker een actieve volgindicatie heeft op een buitengemeentelijke persoon, moet er ook een actieve volgindicatie zijn voor deze persoon bij het GBA-V.
   2. Wanneer geen enkele gebruiker een actieve volgindicatie op een buitengemeentelijke persoon heeft, mag er geen actieve volgindicatie zijn voor deze persoon bij het GBA-V.
   3. Voor een binnengemeentelijke persoon mag er geen actieve volgindicatie zijn in het GBA-V.

   Volgindicaties in GBA-V kunnen worden gewijzigd n.a.v.:
     - Een PUT /volgindicaties request
     - Het bereiken van een datum
     - Een binnengemeentelijke wijziging (de update applicatie ontvangt een StUF npsLk01 kennisgeving uit het burgerzakensysteem)
       - persoon is nu ingeschreven in deze gemeente en update applicatie ontvangt StUF mutatiesoort='V': uitverhuizing
       - persoon is nu ingeschreven in een andere gemeente en update applicatie ontvangt StUF mutatiesoort≠'V' (normaliter 'T'): inverhuizing
 

   Scenario: Een gebruiker zet een volgindicatie op een binnengemeentelijk persoon
      Gegeven de persoon met burgerservicenummer "999995066" is ingeschreven in deze gemeente
      En er is geen enkele volgindicatie gezet voor de persoon met burgerservicenummer "999995066"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999995066" en geen einddatum
      Dan stuurt de update applicatie GEEN Ap01 bericht met burgerservicenummer "999995066" naar het GBA-V 

   Scenario: Een gebruiker zet als eerste een volgindicatie op een buitengemeentelijk persoon
      Gegeven de persoon met burgerservicenummer "999993653" is NIET ingeschreven in deze gemeente
      En er is geen enkele volgindicatie gezet voor de persoon met burgerservicenummer "999993653"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999993653" en geen einddatum
      Dan stuurt de update applicatie een Ap01 bericht met burgerservicenummer "999993653" naar het GBA-V 

   Scenario: Een gebruiker zet als eerste een volgindicatie op een persoon met einddatum in de toekomst
      Gegeven de persoon met burgerservicenummer "999993483" is NIET ingeschreven in deze gemeente
      En er is geen enkele volgindicatie gezet voor de persoon met burgerservicenummer "999993483"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999993483" met einddatum "2021-03-15"
      Dan stuurt de update applicatie een Ap01 bericht met burgerservicenummer "999993483" naar het GBA-V

   Scenario: Een gebruiker zet een volgindicatie op een persoon die al gevolgd wordt door een andere gebruiker
      Gegeven de persoon met burgerservicenummer "999990457" is NIET ingeschreven in deze gemeente
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999990457" en einddatum "2021-06-30"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999990457" en geen einddatum
      Dan stuurt de update applicatie GEEN Ap01 bericht met burgerservicenummer "999990457" naar het GBA-V

   Scenario: Een gebruiker zet een volgindicatie op een persoon die niet meer gevolgd wordt door een andere gebruiker
      Gegeven de persoon met burgerservicenummer "999992855" is NIET ingeschreven in deze gemeente
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999992855" en einddatum "2021-03-01"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999992855" en geen einddatum
      Dan stuurt de update applicatie een Ap01 bericht met burgerservicenummer "999992855" naar het GBA-V
    
   Scenario: Een gebruiker verlengt de einddatum van de volgindicatie
      Gegeven de persoon met burgerservicenummer "999992806" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999992806" en einddatum "2021-03-15"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999992806" met einddatum "2021-06-30"
      Dan stuurt de update applicatie GEEN Ap01 bericht met burgerservicenummer "999992806" naar het GBA-V

   Scenario: Een gebruiker wijzigt de einddatum van de volgindicatie naar vandaag
      Gegeven de persoon met burgerservicenummer "999994220" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999994220" en einddatum "2021-03-15"
      En geen enkele andere gebruiker heeft een volgindicatie voor de persoon met burgerservicenummer "999994220"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999994220" met einddatum "2021-03-05"
      Dan stuurt de update applicatie een Av01 bericht met burgerservicenummer "999994220" naar het GBA-V

   Scenario: Een gebruiker wijzigt de einddatum van de volgindicatie naar een datum in het verleden
      Gegeven de persoon met burgerservicenummer "999994220" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999994220" en geen einddatum
      En geen enkele andere gebruiker heeft een volgindicatie voor de persoon met burgerservicenummer "999994220"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999994220" met einddatum "2021-03-05"
      Dan stuurt de update applicatie een Av01 bericht met burgerservicenummer "999994220" naar het GBA-V

   Scenario: Een gebruiker beëindigt de volgindicatie die ook voor alle andere gebruikers inactief is
      Gegeven de persoon met burgerservicenummer "999992351" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999992351" en einddatum "2021-03-15"
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999992351" en einddatum "2021-03-01"
      En geen enkele andere gebruiker heeft een volgindicatie voor de persoon met burgerservicenummer "999992351"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999992351" met einddatum "2021-03-05"
      Dan stuurt de update applicatie een Av01 bericht met burgerservicenummer "999992351" naar het GBA-V

   Scenario: Een gebruiker beëindigt de volgindicatie voor een persoon die ook door een andere gebruiker gevolgd wordt
      Gegeven de persoon met burgerservicenummer "999992971" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999992971" en einddatum "2021-03-15"
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999992971" en einddatum "2021-06-30"
      En geen enkele andere gebruiker heeft een volgindicatie voor de persoon met burgerservicenummer "999992971"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999992971" met einddatum "2021-03-05"
      Dan stuurt de update applicatie GEEN Av01 bericht met burgerservicenummer "999992971" naar het GBA-V

   Scenario: Een gebruiker heropent een beëindigde volgindicatie
      Gegeven de persoon met burgerservicenummer "000009945" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "000009945" en einddatum "2021-03-01"
      En geen enkele andere gebruiker heeft een volgindicatie voor de persoon met burgerservicenummer "000009945"
      Als gebruiker "A" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "000009945" en geen einddatum
      Dan stuurt de update applicatie een Ap01 bericht met burgerservicenummer "000009945" naar het GBA-V

   Scenario: Een gebruiker heropent een beëindigde volgindicatie die eerder door een andere gebruiker gevolgd werd
      Gegeven de persoon met burgerservicenummer "999990949" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999990949" en einddatum "2021-03-01"
      En geen enkele andere gebruiker heeft een volgindicatie voor de persoon met burgerservicenummer "999990949"
      En de update applicatie heeft op 1 maart 2021 een Av01 bericht met burgerservicenummer "999990949" naar het GBA-V gestuurd
      Als gebruiker "B" op 5 maart 2021 een volgindicatie zet op de persoon met burgerservicenummer "999990949" en geen einddatum
      Dan stuurt de update applicatie een Ap01 bericht met burgerservicenummer "999990949" naar het GBA-V

   Scenario: De einddatum van een volgindicatie is vandaag voor een persoon die ook door een andere gebruiker gevolgd wordt
      Gegeven de persoon met burgerservicenummer "999990962" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999990962" en einddatum "2021-03-01"
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999990962" en einddatum "2021-03-05"
      En geen enkele andere gebruiker heeft een actieve volgindicatie voor de persoon met burgerservicenummer "999990962"
      Als de datum vandaag is 1 maart 2021
      Dan stuurt de update applicatie GEEN Av01 bericht met burgerservicenummer "999990962" naar het GBA-V

   Scenario: De einddatum van een volgindicatie is vandaag en er zijn geen andere actieve volgindicaties op deze persoon
      Gegeven de persoon met burgerservicenummer "999990962" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999990962" en einddatum "2021-03-01"
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999990962" en einddatum "2021-03-05"
      En geen enkele andere gebruiker heeft een actieve volgindicatie voor de persoon met burgerservicenummer "999990962"
      Als de datum vandaag is 5 maart 2021
      Dan stuurt de update applicatie een Av01 bericht met burgerservicenummer "999990962" naar het GBA-V

   Scenario: De einddatum van een volgindicatie is een datum in het verleden (Av01 wordt maar één keer gestuurd)
      Gegeven de persoon met burgerservicenummer "999990962" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999990962" en einddatum "2021-03-01"
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999990962" en einddatum "2021-03-05"
      En geen enkele andere gebruiker heeft een volgindicatie voor de persoon met burgerservicenummer "999990962"
      En de update applicatie heeft op 5 maart 2021 een Av01 bericht met burgerservicenummer "999990962" naar het GBA-V gestuurd
      Als de datum vandaag is 6 maart 2021
      Dan stuurt de update applicatie GEEN Av01 bericht met burgerservicenummer "999990962" naar het GBA-V

   Scenario: De persoon verhuist naar deze gemeente
      Gegeven de persoon met burgerservicenummer "999992971" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999992971" en geen einddatum
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999992971" en einddatum "2021-06-30"
      En de update applicatie ontvangt binnengemeentelijke wijzigingen via StUF BG kennisgevingsberichten
      Als de update applicatie op 5 maart 2021 een npsLk01 bericht met mutatiesoort "T" en burgerservicenummer "999992971" ontvangt
      Dan stuurt de update applicatie een Av01 bericht met burgerservicenummer "999992971" naar het GBA-V

   Scenario: De persoon verhuist naar buiten deze gemeente
      Gegeven de persoon met burgerservicenummer "999993847" is ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999993847" en geen einddatum
      En gebruiker "B" heeft een volgindicatie voor de persoon met burgerservicenummer "999993847" en einddatum "2021-06-30"
      En de update applicatie ontvangt binnengemeentelijke wijzigingen via StUF BG kennisgevingsberichten
      Als de update applicatie op 5 maart 2021 een npsLk01 bericht met mutatiesoort "V" en burgerservicenummer "999993847" ontvangt
      Dan stuurt de update applicatie een Ap01 bericht met burgerservicenummer "999993847" naar het GBA-V

   Scenario: Een persoon die niet wordt gevolgd verhuist naar deze gemeente
      Gegeven de persoon met burgerservicenummer "000009891" is NIET ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "000009891" en einddatum "2021-03-01"
      En de update applicatie heeft op 1 maart 2021 een Av01 bericht met burgerservicenummer "999990962" naar het GBA-V gestuurd
      En de update applicatie ontvangt binnengemeentelijke wijzigingen via StUF BG kennisgevingsberichten
      Als de update applicatie op 5 maart 2021 een npsLk01 bericht met mutatiesoort "T" en burgerservicenummer "999992971" ontvangt
      Dan stuurt de update applicatie GEEN Av01 bericht met burgerservicenummer "000009891" naar het GBA-V

   Scenario: Een persoon die niet wordt gevolgd verhuist naar buiten deze gemeente
      Gegeven de persoon met burgerservicenummer "999992235" is ingeschreven in deze gemeente
      En gebruiker "A" heeft een volgindicatie voor de persoon met burgerservicenummer "999992235" en einddatum "2021-03-01"
      En de update applicatie ontvangt binnengemeentelijke wijzigingen via StUF BG kennisgevingsberichten
      Als de update applicatie op 5 maart 2021 een npsLk01 bericht met mutatiesoort "V" en burgerservicenummer "999992235" ontvangt
      Dan stuurt de update applicatie GEEN Av01 bericht met burgerservicenummer "999992235" naar het GBA-V
      