# language: nl

Functionaliteit: Verkrijgen wijzigingen.

  Een afnemer kan wijzigingen ophalen wanneer deze ter beschikking worden gesteld nadat een aantal criteria zijn voldaan.
  Deze criteria zijn:
  - De afnemer dient een volgindicatie te hebben geplaatst op het desbetreffende persoon.
  - De wijziging vindt plaats nadat de volgindicatie was geplaatst.
  - De volgindicatie heeft een einddatum in de toekomst of een ongespecificeerde einddatum.

  Scenario: Een afnemer heeft een volgindicatie op bsn 999994669 dat niet verlopen is wanneer een wijziging ontstaat
    Gegeven de volgindicatie heeft een begin datum met als waarde 08-05-2022 welke eerder is dan het moment van wijzigen
    En de volgindicatie heeft een einddatum in de toekomst of een ongespecificeerde einddatum
    Als de afnemer alle wijzigingen ophaalt op 10-05-2022
    Dan zal de afnemer een lijst met wijzigingen zien met burgerservicenummers die zijn gewijzigd waaronder 999994669.

  Scenario: Een afnemer heeft een volgindicatie op bsn 999994669 dat verlopen is wanneer een wijziging ontstaat
    Gegeven de volgindicatie heeft een begin datum met als waarde 08-05-2021 welke eerder is dan het moment van wijzigen
    En de volgindicatie heeft een einddatum in het verleden met als waarde 15-12-2021
    Als de afnemer alle wijzigingen ophaalt op 02-01-2022
    Dan zal de afnemer een lijst met wijzigingen zien met burgerservicenummers die zijn gewijzigd waar 999994669 geen onderdeel van uitmaakt.

  Scenario: Een afnemer heeft een volgindicatie op bsn 999994669 dat niet verlopen is een dag nadat een wijziging ontstaat
    Gegeven de volgindicatie heeft een begin datum met als waarde 08-05-2022 welke later is dan het moment van wijzigen
    En de volgindicatie heeft een einddatum in de toekomst of een ongespecificeerde einddatum
    Als de afnemer alle wijzigingen ophaalt op 05-05-2022
    Dan zal de afnemer een lijst met wijzigingen zien met burgerservicenummers die zijn gewijzigd waar 999994669 geen onderdeel van uitmaakt.
