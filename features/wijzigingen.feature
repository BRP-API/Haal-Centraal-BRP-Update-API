# language: nl

Functionaliteit: Als gebruiker wil ik wijzigingen doorkrijgen op gebruikers die ik volg
    De update API levert burgerservicenummers van personen waarbij er een (of meerdere) wijziging(en) in de registratie zijn gedaan.
    Een gebruiker krijgt burgerservicenummers geleverd van alleen die personen waar een wijziging heeft plaatsgevonden tijdens de actieve volgindicatie. Dit zijn default de wijzigingen vanaf de dag dat de volgindicatie is gezet.
    
    De gebruiker kan ook een latere datum opgeven in parameter "vanaf" om alleen wijzigingen te krijgen vanaf de opgegeven datum.
    
    Rule: Burgerservicenummers van personen waar een wijziging heeft plaatsgevonden tijdens de actieve volgindicatie worden geleverd

        Voorbeeld: Gebruiker heeft een volgindicatie op een persoon en er wordt een wijziging doorgevoerd in de registratie bij de persoon
            Gegeven gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999993653" en geen einddatum
            En op 12 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999993653"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" een item met de waarde "999993653"

        Voorbeeld: Gebruiker heeft een volgindicatie op een persoon en er worden meerdere wijziging doorgevoerd in de registratie bij de persoon
            Gegeven gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999993653" en geen einddatum
            En op 10 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999993653"
            En op 12 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999993653"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" exact één (1) item met de waarde "999993653"

        Voorbeeld: Gebruiker heeft een volgindicatie op een persoon en er is geen wijziging doorgevoerd in de registratie bij de persoon
            Gegeven gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999993483" en geen einddatum
            En sinds 5 maart 2021 is er in de BRP registratie geen wijziging doorgevoerd in de gegevens van de persoon "999993483"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" GEEN item met de waarde "999993483"

        Voorbeeld: Gebruiker zet een volgindicatie met een einddatum in de toekomst
            Gegeven gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999992855" met einddatum "2021-03-16"
            En op 12 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999992855"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" een item met de waarde "999992855"
        
        Voorbeeld: Gebruiker heropent de volgindicatie
            Gegeven gebruiker "A" heeft op 17 januari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999994220" met einddatum "2021-03-01"
            En gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999994220" en geen einddatum
            En op 12 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999994220"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" een item met de waarde "999994220"

        Voorbeeld: Gebruiker krijgt wijzigingen tot en met wijzigingen tot moment van request
            Gegeven gebruiker "A" heeft op 17 januari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999993847" en geen einddatum
            En op 4 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999993847"
            Als gebruiker "A" op 4 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" een item met de waarde "999993847"

    Rule: Wanneer de wijziging heeft plaatsgevonden vóór het zetten van de actuele volgindicatie wordt het burgerservicenummer niet geleverd
    
        Voorbeeld: Wijzigingen vóór het zetten van de volgindicatie worden niet gemeld
            Gegeven op 4 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999990457"
            En gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999990457" en geen einddatum
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" GEEN item met de waarde "999990457"

        Voorbeeld: Gebruiker heropent de volgindicatie en wijzigingen vóór het heropenen worden niet gemeld
            Gegeven gebruiker "A" heeft op 17 januari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999992351" met einddatum "2021-03-01"
            En op 21 februari 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999992351"
            En gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999992351" en geen einddatum
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" GEEN item met de waarde "999992351"

        Voorbeeld: Gebruiker vraagt expliciet wijzigingen van vóór het zetten van de volgindicatie
            Gegeven op 4 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999992971"
            En gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999992971" en geen einddatum
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen?vanaf=2021-03-01
            Dan bevat het antwoord in "burgerservicenummers" GEEN item met de waarde "999992971"
            
        Voorbeeld: Gebruiker verlengt de volgindicatie en eerdere wijzigingen worden wel gemeld
            Gegeven gebruiker "A" heeft op 17 januari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "000009945" met einddatum "2021-03-05"
            En op 21 februari 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "000009945"
            En gebruiker "A" heeft op 4 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "000009945" en geen einddatum
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" een item met de waarde "000009945"

    Rule: Wanneer de volgindicatie is beëindigd, wordt het burgerservicenummer niet geleverd in geval er een wijziging heeft plaatsgevonden

        Voorbeeld: Gebruiker vraagt wijzigingen na de einddatum van de volgindicatie
            Gegeven gebruiker "A" heeft op 5 maart 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999992806" met einddatum "2021-03-15"
            En op 12 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999992806"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord in "burgerservicenummers" GEEN item met de waarde "999992806"

        Voorbeeld: Meerdere gebruikers volgen zelfde persoon met verschillende einddatum
            Gegeven gebruiker "A" heeft op 17 januari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999990962" met einddatum "2021-03-10"
            En gebruiker "B" heeft op 2 februari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999990962" en geen einddatum
            En op 12 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999990962"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            En gebruiker "B" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen
            Dan bevat het antwoord voor gebruiker "A" in "burgerservicenummers" GEEN item met de waarde "999990962"
            En bevat het antwoord voor gebruiker "B" in "burgerservicenummers" een item met de waarde "999990962"

    Rule: Wanneer de parameter "vanaf" wordt gegeven worden alleen wijzigingen meegenomen die plaatsvonden op of na de vanaf datum

        Voorbeeld: Gebruiker vraagt wijzigingen vanaf een datum na de laatste wijziging
            Gegeven gebruiker "A" heeft op 17 januari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999993847" en geen einddatum
            En op 4 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999993847"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen?vanaf=2021-03-05
            Dan bevat het antwoord in "burgerservicenummers" GEEN item met de waarde "999993847"

        Voorbeeld: Gebruiker vraagt wijzigingen vanaf de datum van de laatste wijziging
            Gegeven gebruiker "A" heeft op 17 januari 2021 een volgindicatie gezet op de persoon met burgerservicenummer "999993847" en geen einddatum
            En op 4 maart 2021 is in de BRP registratie een wijziging doorgevoerd in de gegevens van de persoon "999993847"
            Als gebruiker "A" op 15 maart 2021 de wijzigingen vraagt met /wijzigingen?vanaf=2021-03-04
            Dan bevat het antwoord in "burgerservicenummers" een item met de waarde "999993847"
