import 'package:flutter/material.dart';
import 'package:rikdom2/widget_helpers.dart';
import 'model.dart';

class CustomerProfilePage extends StatefulWidget {
  CustomerProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CustomerProfilePageState createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:
            IntrinsicHeight(child: Container(width: 400, child: buildCard())),
      ),
    );
  }

  Widget buildCard() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Company',
                style: Theme.of(context).textTheme.headline4,
              ),
              buildTextFormField(
                Icon(Icons.business),
                'Hva heter firma?',
                'Firmanavn',
                clientConfiguration.companyName,
                (v) => clientConfiguration.companyName = v,
              ),
              buildTextFormField(
                Icon(Icons.code),
                'Organisasjonsnummer',
                'Organisasjonsnummer',
                clientConfiguration.orgNo,
                (v) => clientConfiguration.orgNo = v,
              ),
              buildTextFormField(
                Icon(Icons.build),
                'Hvilken industri tilhører du?',
                'Industri',
                clientConfiguration.industry,
                (v) => clientConfiguration.industry = v,
              ),
              buildDropDown2<ClientType>(
                  Icon(Icons.person_outline),
                  'Kundetype',
                  clientTypeDefinitions,
                  clientConfiguration.clientType,
                  (ClientType v) => clientConfiguration.clientType = v),
              SizedBox(
                height: 40,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.arrow_right),
                label: Text('Continue'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
