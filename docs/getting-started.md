---
layout: page-with-side-nav
title: Getting Started
---
# Getting Started
De 'BRP update' Web API is gespecificeerd in [OpenAPI specifications (OAS)](https://swagger.io/specification/).

Wil je de API gebruiken? Dit kun je doen:

1. Bekijk de [functionaliteit en specificaties](#functionaliteit-en-specificaties)
2. [Implementeer de API Client](#implementeer-de-api-client)


## Functionaliteit en specificaties
Met deze API kun je een lokale kopie actueel houden. Je kunt beheren welke personen je wilt volgen, en opvragen van welke gevolgde personen gegevens zijn gewijzigd vanaf een bepaalde datum.

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
* Gebruik de burgerservicenummers om de actuele gegevens van de persoon op te vragen

## Implementeer de API client
Client code kun je genereren met de "[genereervariant](https://github.com/BRP-API/Haal-Centraal-BRP-Update-API/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank" rel="noopener"}" van de API-specificaties en een code generator. Een overzicht met codegeneratoren kun je vinden op [OpenAPI.Tools](https://openapi.tools/#sdk){:target="_blank" rel="noopener"}.

Deze repo bevat scripts waarmee je met [OpenAPI Generator](https://openapi-generator.tech/){:target="_blank" rel="noopener"} client code kunt genereren in JAVA, .NET (Full Framework & Core) en Python. De makkelijkste manier om de code generatie scripts te gebruiken, is door deze repo te clonen. Na het clonen kun je met `npm install` de benodigde packages installeren en kun je met npm run <script naam> één van de volgende scripts uitvoeren:
- oas:generate-java-client (voor JAVA client code)
- oas:generate-netcore-client (voor .NET Core client code)
- oas:generate-net-client (voor .NET Full Framework client code)
- oas:generate-python-client (voor Python client code)

Een lijst met andere ondersteunde generator opties kun je vinden in de [Generators List](https://openapi-generator.tech/docs/generators){:target="_blank" rel="noopener"} van OpenAPI Generator.

Note. De prerequisite van OpenAPI Generator is JAVA. Je moet een JAVA runtime installeren voordat je OpenAPI Generator kunt gebruiken.

## Uitproberen en testen
Vraag jouw gemeente naar demo- en testomgevingen die zij voor hun afnemers beschikbaar stellen.
