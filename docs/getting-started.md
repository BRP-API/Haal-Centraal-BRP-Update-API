---
layout: page-with-side-nav
title: Getting Started
---
# Getting Started
De 'BRP update' Web API is gespecificeerd in [OpenAPI specifications (OAS)](https://swagger.io/specification/).

Wil je de API gebruiken? Dit kun je doen:

1. Bekijk de functionaliteit en specificaties
2. Implementeer de API
3. Probeer en test de API

## Functionaliteit en specificaties
Met deze API kun je beheren welke personen je wilt volgen. Vervolgens kun je opvragen van welke personen die je volgt er gegevens zijn gewijzigd vanaf een bepaalde datum.

Je kunt een visuele representatie van de specificatie bekijken met [Swagger UI]({{ site.baseurl }}/swagger-ui) of [Redoc]({{ site.baseurl }}/redoc).

Je kunt de functionele documentatie lezen in [features](./features).

### Beheren welke personen worden gevolgd
* Je kunt het volgen van een persoon aanzetten met of zonder einddatum
* Je kunt het volgen van een persoon stoppen door een einddatum voor het volgen door te geven
* Je kunt een einddatum voor volgen wijzigen door een nieuwe einddatum door te geven
* Wanneer je eerder een persoon hebt gevolgd, kun je de persoon weer volgen door de einddatum te verwijderen of een einddatum in de toekomst door te geven
* Je kunt opvragen welke personen je volgt

### Opvragen wijzigingen op personen
* Vul de datum "vanaf" in om alle wijzigingen vanaf die datum te ontvangen
* In het antwoord zitten de burgerservicecnummers van personen waarbij er iets is gewijzigd aan de gegevens op of na die datum
* Gebruik het template in _links.ingeschrevenPersoon.href in combinatie met een burgerservicenummer om de actuele gegevens van de persoon op te vragen

## Implementeer de API

Je kunt code genereren op basis van de [genereervariant van de specificaties](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-Update-API/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank" rel="noopener"}.
Voor enkele ontwikkelomgevingen is al [client code](https://github.com/VNG-Realisatie/Haal-Centraal-BRP-Update-API/tree/master/code){:target="_blank" rel="noopener"} gegenereerd.

## Probeer en test
Op de Haal Centraal demo-omgeving (www.haalcentraal.nl/haalcentraal/api/) is de BRP update API nog niet beschikbaar.
