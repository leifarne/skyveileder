import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

/// LegalAssessment is a data class which stores data fields of assessments.
///

final url =
    'https://script.google.com/macros/s/AKfycbzvOEelXW23dg54d1Q2XZBCIvtpRrF_RsajCB3VWT7xfehsEqE/exec';

enum Risk { low, medium, high }

class LegalAssessment {
  String ref;
  String term;
  String assessment;
  String amendment;

  int riskBefore = 1;
  int riskAfter = 1;
  int decision = 0;

  void setRiskBefore(int value) {
    riskBefore = value;
  }

  void setRiskAfter(int value) {
    riskAfter = value;
  }

  void setDecision(int value) {
    decision = value;
  }

  LegalAssessment(this.ref, this.term, this.assessment, this.amendment);

  factory LegalAssessment.fromJson(dynamic json) {
    return LegalAssessment("${json['ref']}", "${json['term']}",
        "${json['assessment']}", "${json['amendment']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'ref': ref,
        'term': term,
        'assessment': assessment,
        'amendment': amendment,
      };
}

Future<List<LegalAssessment>> getLegalAssessments() async {
  var response = await http.get(url);
  var jsonFeedback = convert.jsonDecode(response.body) as List;
  return jsonFeedback.map((json) => LegalAssessment.fromJson(json)).toList();
}

final legalIntro = '''
<html>
    <body>
    <h1>Vanlige bestemmelser</h1>
        <p>Helt overordnet kan vi nevne at Microsofts skytjenestevilkår (ved kjøp gjennom oss som forhandler/CSP) består av en rekke dokumenter. De viktigste er: </p>

<ul>
<li>Microsoft Customer Agreement</li>
<li>Online Service Terms (OST)</li>
<li>SLA</li>
<li>Financial Services Amendment</li>
<li>Data Protection Addendum (Til OST)</li>
<li>Product terms (ikke gjennomgått)</li>
</ul>

<p>Etter vår gjennomgang ser vi følgende risikopunkter, sett med kundeøyne (uavhengig av bransje): </p>

<p><b>Limited warranty:</b> Microsoft fraskriver seg i realiteten alt misligholdsansvar ved feil/nedetid. Kundens eneste sanksjon er «Service Credits» (en prosentandel av månedlig betaling i kreditt, forutsatt at Microsoft aksepterer Kundens krav). Med andre ord har man ikke rett til å holde tilbake betaling eller kreve erstatning for feil/nedetid. </p>

<p><b>Endring eller fjerning av tjenester:</b> Microsoft kan iht. OST endre eller fjerne tjenestene når som helst. Ved fjerning av vesentlige tjenester eller funksjonalitet vil en få 12 mnd varsel, med mindre sikkerhet, lovkrav eller «system performance considerations» nødvendiggjør raskere fjerning. Dette kan gjøre det vanskelig å planlegge for endringene i komplekse applikasjoner og løsninger. </p>

<p><b>Midlertidig stans:</b> Microsoft har en vid rett til å suspendere tjenesten ved brudd på «Acceptable Use Policy» fra Kundens side (inkl. enkeltansatte). Terskelen for stans er «only to the extent reasonably necessary”. En vil bli varslet om stans i “rimelig tid” med mindre Microsoft selv mener umiddelbar stans er nødvendig. En er således ikke garantert varsel i forkant eller mulighet til å utbedre før suspensjon skjer. I tillegg har MS alltid rett til å stanse tjenestene dersom kunden generelt sett er i vesentlig mislighold, og gir kun varsel «when reasonable». </p>

<p><b>Vanhjemmel:</b> Ved vanhjemmel kan Microsoft selv velge mellom å endre eller erstatte tjenesten med et «functional equivalent», eller de kan terminere Kundens bruk av Online-tjenestene på dagen. Dette uavhengig av om kundens tjenester kan flyttes til alternative tjenester raskt eller ei, og uavhengig av investeringene som er brukt for å ta i bruk aktuell tjeneste. Det er ikke krav om at Microsoft skal bruke rimelig innsats for å endre tjenesten før valget om terminering kan brukes. </p>

<p><b>Opphør av tjenestene på dagen ved heving:</b> Ved heving pga vesentlig mislighold mister kunden tilgang til tjenestene med umiddelbar virkning (30 dagers frist for å utbedre, men ved manglende utbedring kan heving skje umiddelbart). Det er altså ingen overgangsperiode frem til kunden har etablert alternative tjenester hos en annen leverandør. Slik for eksempel SSA-avtalene har som regime.</p>

<p><b>Separate vilkår:</b> Det kan gjelde egne vilkår for tredjeparts løsninger som tilgjengeliggjøres i Azure. Om slike finnes bør undersøkes, og vilkårene bør alltid gjennomgås i det enkelte tilfelle.</p>

<p><b>Endring av avtalevilkår:</b> Som nevnt over vises det i avtalevilkårene til en rekke vilkår som finnes bak en rekke URL’er, som Online Service Terms, SLA, DPA m.v. Det er en risiko for at innholdet/vilkårene som ligger bak en URL blir endret og kan endre seg til det verre. Samtidig så sier Microsoft at vilkårene ikke skal endre seg vesentlig til ulempe for kunden, noe som begrenser risikoen en del. </p>

<p><b>Lovvalg:</b> Customer Agreement reguleres av og tolkes iht. irsk rett. Irland har «common law»-tradisjon, i motsetning til norsk rett som har «civil law»-tradisjon. Dette er ikke i seg selv et problem, men viktig å huske ved tolkning og bruk av avtalen. Det skrevne ord betyr således alt.</p>

<p><b>Personvern:</b> Gjeldende databehandleravtale pt. er «Microsoft Online Services Data Protection Addendum – January 2020”. Her er det verdt å merke seg: </p>

<ul>
<li>1. Å vite hvilken versjon av DPA som gjelder for hvilke tjenester. Når Kunden tar en tjeneste i bruk, gjelder sist publiserte versjon av DPA i hele abonnementsperioden for denne tjenesten. Versjonen bør således lagres.</li>
<li>2. Ved sikkerhetsbrudd «security incidents» kan Microsoft velge å varsle på valgfri måte, inkludert epost, til Kundens kontaktperson(er). Dette kan gjøre det utfordrende å fange opp slik varsling og ev. overholde 72-timers frist for varsling til Datatilsynet. </li>
<li>3. Data slettes etter 90 dager fra utløp eller oppsigelse. Kunden må sørge for å trekke ut data i tide. </li>
<li>4. Underdatabehandlere: Kunden gir forhåndssamtykke til bruk og bytte av underdatabehandlere. Dette må kontrolleres opp i mot kravene i EBA tilknyttet «sub-outsourcing of critical or important functions» (pkt. 42, 43 og kap. 13.1).  Ved «material outsourcing» er Microsofts regulering her problematisk: EBA stiller krav til at finansinstitusjonen må varsles ved vesentlige endringer, slik at de kan utføre risikovurdering og protestere før endringen trer i krav (EBA pkt. 78 e). </li>
</ul>
    </body>
</html>
''';

final text = [
  [
    """
Licenses granted on a subscription basis <span style="color:red">expire at the end of the applicable 
subscription</span> period <span style="color:red">unless renewed</span>. Licenses granted for metered Products billed 
periodically based on usage continue as long as Customer continues to pay for 
its usage of the Product. All other licenses become perpetual upon payment in full.
""",
    "Det følger av punktet at lisensen (til å bruke Online services) utløper om den ikke blir fornyet. Dette handler først og fremst om at Kunden må ha kontroll på abonnementsperioden og planlegge alternativer/fornyelse i god tid før utløp.",
    """
For perpetual licenses, the Use Rights in effect when Customer orders a Product will apply. For subscriptions, the Use Rights in effect at the start of each subscription period will apply. Customers with subscriptions for Software may use new versions released during the subscription period subject to the Use Rights in effect when those versions are released. For metered Products billed periodically based on usage, the
Use Rights in effect at the start of each billing period will apply during that period. Microsoft may update the Use Rights periodically, but material adverse changes  for a particular version will not apply during the applicable license, subscription, or billing period.
""",
  ],
  [
    """
Her sies det at Microsoft kan oppdatere lisensvilkårene (og avtalevilkårene generelt i Product Terms og Online Service Terms) jevnlig, men vesentlig negative endringer vil ikke tre i kraft før utløpet av den inneværende abonnementperiode. <b>EBA: Regulerer ikke dette spesifikt.  Siden lisensvilkårene ikke kan endres til vesentlig ulempe for kunden, antas det at det er moderat risiko for at bruksrett kan falle bort for kritiske eller viktige tjenester, eller at vilkårene generelt svekkes i stor grad. Kunden må gjennomføre en konkret risikovurdering.</b>
""",
    """
Use Rights” means the license terms and terms of service for each Product published on the Licensing Site and updated from time to time. The Use Rights supersede the terms of any end user license agreement that accompanies a Product.  License terms for all Products are published in the Product Terms. Terms of service for Online Services are published in the Online Services Terms.
""",
    "Hurra meg rundt",
  ],
];
