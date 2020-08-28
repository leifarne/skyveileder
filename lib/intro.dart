import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'legal.dart';
import 'model.dart';
import 'widget_helpers.dart';

String introductionURL = '';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

// WebView introduction

class _IntroState extends State<Intro> {
  ClientModel _clientConfiguration;

  @override
  void initState() {
    // TODO: implement initState
    _clientConfiguration = ClientModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Configuration Page'),
      ),
      body: Center(
        child: Row(
          children: [
            Container(width: 400, child: buildCard()),
            Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(8), child: HtmlWidget(legalIntro)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              buildTextFormField(
                Icon(Icons.business),
                'Hva heter firma?',
                'Firmanavn',
                _clientConfiguration.companyName,
                (v) => _clientConfiguration.companyName = v,
              ),
              buildTextFormField(
                Icon(Icons.build),
                'Hvilken industri tilhører du?',
                'Industri',
                _clientConfiguration.industry,
                (v) => _clientConfiguration.industry = v,
              ),
              buildTextFormField(
                Icon(Icons.business_center),
                'Hva heter prosjektet?',
                'Prosjektnavn',
                _clientConfiguration.projectName,
                (v) => _clientConfiguration.projectName = v,
              ),
              buildTextFormField(
                Icon(Icons.create),
                'Kort beskrivelse',
                'Prosjektbeskrivelse',
                _clientConfiguration.projectDescription,
                (v) => _clientConfiguration.projectDescription = v,
              ),
              buildDropDown3(
                Icon(Icons.attach_money),
                'Project Size',
                _clientConfiguration.projectSize,
                (v) => _clientConfiguration.projectSize = v,
              ),
              buildDropDown3(
                Icon(Icons.transform),
                'Project Complexity',
                _clientConfiguration.projectComplexity,
                (v) => _clientConfiguration.projectComplexity = v,
              ),
              buildDropDown2<ProjectCriticality>(
                Icon(Icons.priority_high),
                'Project Criticality',
                projectCriticalityDefinitions,
                _clientConfiguration.projectCriticality,
                (v) => _clientConfiguration.projectCriticality = v,
              ),
              buildDropDown2<ClientType>(
                  Icon(Icons.person_outline),
                  'Kundetype',
                  clientTypeDefinitions,
                  _clientConfiguration.clientType,
                  (ClientType v) => _clientConfiguration.clientType = v),
              buildDropDown2<SolutionType>(
                  Icon(Icons.widgets),
                  'Løsningstype',
                  solutionTypeDefinitions,
                  _clientConfiguration.solutionType,
                  (SolutionType v) => _clientConfiguration.solutionType = v),
              buildDropDown2<ResellerType>(
                  Icon(Icons.group),
                  'Reseller type',
                  resellerTypeDefinitions,
                  _clientConfiguration.resellerType,
                  (ResellerType v) => _clientConfiguration.resellerType = v),
              buildDropDown2<CloudProviderType>(
                  Icon(Icons.cloud),
                  'Skyleverandør',
                  cloudProviderDefinitions,
                  _clientConfiguration.cloudProvider,
                  (v) => _clientConfiguration.cloudProvider = v),
            ],
          ),
        ),
      ),
    );
  }
}
