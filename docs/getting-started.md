---
layout: page-with-side-nav
title: Getting Started
---
# Getting Started
De 'BRP update' Web API is gespecificeerd in [OpenAPI specifications (OAS)](https://swagger.io/specification/).

Wil je de API gebruiken? Dit kun je doen:

1. Bekijk de [functionaliteit en specificaties](#functionaliteit-en-specificaties)
2. [Implementeer de API Client](#implementeer-de-api-client)
3. [Probeer en test de API](#probeer-en-test-de-api)

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
* Gebruik de burgerservicenummers om de actuele gegevens van de persoon op te vragen

## Implementeer de API client
Client code kun je genereren met de "[genereervariant](https://github.com/BRP-API/Haal-Centraal-BRP-Update-API/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank" rel="noopener"}" van de API-specificaties en een code generator. Een overzicht met codegeneratoren kun je vinden op [OpenAPI.Tools](https://openapi.tools/#sdk){:target="_blank" rel="noopener"}.

Deze repo bevat scripts waarmee je met [OpenAPI Generator](https://openapi-generator.tech/){:target="_blank" rel="noopener"} client code kunt genereren in JAVA, .NET (Full Framework & Core) en Python. De makkelijkste manier om de code generatie scripts te gebruiken, is door deze repo te clonen. Na het clonen kun je met `npm install` de benodigde packages installeren en kun je met npm run <script naam> één van de volgende scripts uitvoeren:
- oas:generate-java-client (voor JAVA client code)
- oas:generate-netcore-client (voor .NET Core client code)
- oas:generate-net-client (voor .NET Full Framework client code)
- oas:generate-python-client (voor Python client code)

Een lijst met andere ondersteunde generator opties kun je vinden in de [Generators List](https://openapi-generator.tech/docs/generators){:target="_blank" rel="noopener"} van OpenAPI Generator.

Note. De prerequisite van OpenAPI Generator is JAVA. Je moet een JAVA runtime installeren voordat je OpenAPI Generator kunt gebruiken
  
## Probeer en test de API
Wil je de 'BRP-Update' Web API proberen en testen? Dat kan op de demo omgeving!`

Om de web api op de demo-omgeving te gebruiken heb je een apikey nodig. Deze voeg je aan een request toe als header "X-API-KEY". Een API-key vraag je aan bij de product owner [c.dingemanse@comites.nl](mailto:c.dingemanse@comites.nl).

### Importeer de specificaties in Postman

De werking van de 'BRP-Update' Web API is het makkelijkst te testen met behulp van [Postman](https://www.getpostman.com/){:target="_blank" rel="noopener"}. In Postman kun je de "[API specificaties](https://github.com/BRP-API/Haal-Centraal-BRP-Update-API/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank" rel="noopener"}" importeren en visueel de BRP-update API aanroepen. Volg deze stappen om de Postman collection te importeren:

In Postman kun je de 'Bevraging Persoon' OpenAPI specificatie importeren en visueel de verschillende endpoints aanroepen. Volg deze stappen om het OpenAPI specificatie bestand te importeren:

1.Klik op de Import button om de Import dialog box te openen

2.Selecteer 'Import From Link' tab, plak de volgende url in de 'Enter a URL and press Import' textbox en klik op de Import button

``` url
https://raw.githubusercontent.com/BRP-API/Haal-Centraal-BRP-Update-API/master/specificatie/genereervariant/openapi.yaml
```

3.Klik op de Next button om een Postman collectie te genereren uit het OpenAPI specificatie bestand

### Configureer de url en api key

1. Klik bij "BRP Update API" op de drie bolletjes.
2. Klik vervolgens op Edit
3. Selecteer tabblad "Authorization"
4. Kies TYPE "API Key"
5. Vul in Key: "x-api-key", Value: de API key die je van Cathy hebt ontvangen, Add to: "Header"
6. Selecteer tabblad "Variables"
7. Vul bij baseUrl INITIAL VALUE en bij CURRENT VALUE: `https://www.haalcentraal.nl/haalcentraal/api/brpupdate`
8. Klik op de knop Update

### Gebruik van de BRP-update API testvoorziening

Op de BRP-update API in de Haal Centraal demo-omgeving worden elke dag enkele personen (burgerservicenummers) als wijziging toegevoegd. Op deze manier kan je voor elke dag nieuwe wijzigingen ontvangen.

Om wijzigingen te ontvangen moet je eerst een volgindicatie toevoegen met PUT /volgindicaties/:burgerservicenummer. Daarbij vul je in Postman bij Path Variable 'burgerservicenummer' als VALUE het burgerservicenummer in van de persoon waarop je wijzigingen wilt ontvangen. 

Bij het zetten van een volgindicatie moet ook een request body worden opgenomen, waarmee een einddatum kan worden opgegeven. Wanneer je geen einddatum wilt opgeven, is de request body een leeg object: 
```
{ }
```

Je kan een volgindicatie beëindigen door de einddatum voor het volgen op te nemen in de request body. Bijvoorbeeld: 
```
{
  "einddatum": "2022-04-19"
}
```

Op elke werkdag worden er wijzigingen ontvangen voor enkele burgerservicenummers. Je kunt de volgende burgerservicenummers gebruiken:

| Weekdag   | burgerservicenummers |
|---------- |--------------------- |
| maandag   | 999994669, 999992740 |
| dinsdag   | 999990019, 999990925 |
| woensdag  | 999993276, 999993252 |
| donderdag | 999991176, 999993136 |
| vrijdag   | 999993215, 999990317 |
| zaterdag  | 999994281, 999990743 |
| zondag    | 999993070, 999991334 |

Vervolgens kun je wijzigingen opvragen met GET /wijzigingen. Daarbij kan je de query-parameter 'vanaf' gebruiken om alleen wijzigingen te ontvangen vanaf de opgegeven datum.

Je zult pas wijzigingen ontvangen van na het moment dat je de volgindicatie hebt gezet. Wanneer je vandaag een volgindicatie toevoegt op een burgerservicenummer, dan zal je dus nog niet direct wijzigingen hebben voor die persoon.
Als je bijvoorbeeld op maandag 11 april PUT /volgindicaties/999994669 doet (dit burgerservicenummer krijgt elke maandag een wijziging), dan zal je op 11 april bij GET /wijzigingen?vanaf=2022-04-11 nog niet burgerservicenummer '999994669' ontvangen. Wanneer je vervolgens op 18 april (maandag een week later) GET /wijzigingen?vanaf=2022-04-18 vraagt, zal je burgerservicenummer '999994669' wel ontvangen.

Als je bijvoorbeeld op maandag 11 april PUT /volgindicaties/999990019 doet (dit burgerservicenummer krijgt elke dinsdag een wijziging), dan zal je op 11 april bij GET /wijzigingen?vanaf=2022-04-11 nog niet burgerservicenummer '999990019' ontvangen. Wanneer je vervolgens op 12 april (maandag een week later) GET /wijzigingen?vanaf=2022-04-12 vraagt, zal je burgerservicenummer '999990019' wel ontvangen.

Houd er dus rekening mee dat je ten minste twee kalenderdagen nodig hebt om de BRP update API uit te proberen of testen: eerste dag om de volgindicatie te zetten, tweede dag om de wijzigingen op te vragen.

