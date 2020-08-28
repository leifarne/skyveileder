import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'legal.dart';

final tableColors = <Color>[
  Colors.amber[500],
  Colors.amber[500],
  Colors.amber[500],
  Colors.amber[500],
  Colors.amber[500],
  Colors.red[200],
  Colors.red[200],
  Colors.red[200],
  Colors.blue[200],
  Colors.blue[200],
  Colors.orange[300],
  Colors.orange[300],
];

class IconDropdownEntry {
  int value;
  IconData icon;
  Color iconColor;
  String text;

  IconDropdownEntry(this.value, this.icon, this.iconColor, this.text);
}

final riskDropdownEntries = <IconDropdownEntry>[
  IconDropdownEntry(Risk.high.index, Icons.report, Colors.red, 'High'),
  IconDropdownEntry(Risk.medium.index, Icons.warning, Colors.amber, 'Medium'),
  IconDropdownEntry(Risk.low.index, Icons.check, Colors.green, 'Low'),
];

final decisionDropdownEntries = <IconDropdownEntry>[
  IconDropdownEntry(0, Icons.check, Colors.green, 'Accept'),
  IconDropdownEntry(1, Icons.check, Colors.green, 'Mitigate & Accept'),
  IconDropdownEntry(2, Icons.warning, Colors.amber, 'Rework'),
  IconDropdownEntry(3, Icons.report, Colors.red, 'Reject'),
];

final actions = ['Rework', 'Mitigate & Accept', 'Accept', 'Reject'];

final title = [
  'Ref Cloud Term',
  'Cloud Term',
  'Legal Assessment',
  'Special Industry Regulation',
  'Industry Amendment',
  'Mitigation',
  'Risk before mitigation',
  'Risk after mitigation',
  'Exp. Fees Lost',
  'Max Fees at risk',
  'Decision',
  'Comment'
];

class ResellerAssessmentPage extends StatefulWidget {
  ResellerAssessmentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ResellerAssessmentPageState createState() => _ResellerAssessmentPageState();
}

class _ResellerAssessmentPageState extends State<ResellerAssessmentPage> {
  List<LegalAssessment> assessments; //List<LegalAssessment>();
  Future<List<LegalAssessment>> _getLegalAssessments;
  TextEditingController _textEditingController;
  ScrollController _scrollController;
  ScrollController _tableScrollController;

  void initState() {
    super.initState();

    // _getLegalAssessments = getLegalAssessments();
    getLegalAssessments().then((value) {
      setState(() {
        assessments = value;
      });
    });

    _textEditingController = TextEditingController();
    _scrollController = ScrollController();
    _tableScrollController = ScrollController();
  }

  void dispose() {
    _tableScrollController.dispose();
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.ac_unit),
        actions: [
          Icon(Icons.search),
        ],
        flexibleSpace: FlexibleSpaceBar(),
        title: Row(
          children: [
            Icon(Icons.account_balance),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('Gold Trading AS  <MS Azure>'),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildMainTable2(context, assessments),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: IconButton(icon: Icon(Icons.plus_one), onPressed: null),
          onPressed: onPressed),
    );
  }

  void onPressed() {
    print('object');
  }

  Widget buildMainTable2(
      BuildContext context, List<LegalAssessment> assessments) {
    print('hei');
    return Scrollbar(
      controller: _tableScrollController,
      child: SingleChildScrollView(
        controller: _tableScrollController,
        child: (assessments != null)
            ? buildTable(context, assessments)
            : Text('Loading...'),
      ),
    );
  }

  Widget buildMainTable(
      BuildContext context, List<LegalAssessment> assessments) {
    return Scrollbar(
      controller: _tableScrollController,
      child: SingleChildScrollView(
        controller: _tableScrollController,
        child: FutureBuilder<List<LegalAssessment>>(
          future: _getLegalAssessments,
          // initialData: assessments,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildTable(context, snapshot.data);
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
    );
  }

  Table buildTable(BuildContext context, List<LegalAssessment> assessments) {
    List<TableRow> rows = List<TableRow>();
    rows.add(buildHeaderRow(context, title));
    print(assessments.length);

    rows.addAll(assessments
        .skip(1)
        .take(5)
        .map((e) => buildTableRow(context, e))
        .toList());

    return Table(
      border: TableBorder.symmetric(
          outside: BorderSide(color: Colors.grey[500]),
          inside: BorderSide(color: Colors.grey[300])),
      columnWidths: {
        0: FlexColumnWidth(0.7),
        1: FlexColumnWidth(2),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(1),
        6: FixedColumnWidth(105),
        7: FixedColumnWidth(105),
        8: FixedColumnWidth(60),
        9: FixedColumnWidth(60),
        10: FixedColumnWidth(105),
      },
      children: rows,
    );
  }

  TableRow buildHeaderRow(BuildContext context, List<String> title) {
    return TableRow(
        decoration: BoxDecoration(color: Colors.grey[400]),
        children: [
          buildHeaderCell(title[0], tableColors[0]), // Ref
          buildHeaderCell(title[1], tableColors[1]), // Cloud Term
          buildHeaderCell(title[2], tableColors[2]), // Legal assessment
          buildHeaderCell(
              title[3], tableColors[3]), // Special Industry Regulation
          buildHeaderCell(title[4], tableColors[4]), // Industry Amendment
          buildHeaderCell(title[5], tableColors[5]), // Mitigation
          buildHeaderCell(title[6], tableColors[6]), // Risk before mitigation
          buildHeaderCell(title[7], tableColors[7]), // Risk after mitigation
          buildHeaderCell(title[8], tableColors[8]), // Expected Fees Lost
          buildHeaderCell(title[9], tableColors[9]), // Max Fees at risk
          buildHeaderCell(title[10], tableColors[10]), // Decision
          //buildHeaderCell(title[11], tableColors[11]), // Comment
        ]);
  }

  TableRow buildTableRow(BuildContext context, LegalAssessment assessment) {
    return TableRow(children: [
      buildLeadingCell(assessment.ref),
      buildRichTextCell(context, assessment.term),
      buildRichTextCell2(context, assessment.assessment),
      buildRichTextCell2(context, assessment.amendment),
      buildRichTextCell2(context, 'FSA'),
      buildRichTextCell2(
          context, 'Create on-prem infra for critical components.'),
      buildDropDownCell(context, riskDropdownEntries, assessment.riskBefore,
          assessment.setRiskBefore),
      buildDropDownCell(context, riskDropdownEntries, assessment.riskAfter,
          assessment.setRiskAfter),
      buildRichTextCell2(context, '0.5'),
      buildRichTextCell2(context, '10'),
      buildDropDownCell(context, decisionDropdownEntries, assessment.decision,
          assessment.setDecision),
      //buildRichTextCell2(context, 'hei'),
    ]);
  }

  Center buildDropDownCell(BuildContext context,
      List<IconDropdownEntry> entries, int value, void Function(int) setValue) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: buildIconDropdownButton(context, entries, value, setValue),
    ));
  }

  Scrollbar buildRichTextCell2(BuildContext context, String txt) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              filled: true,
              border: InputBorder.none),
          enabled: true,
          initialValue: txt,
          minLines: 1,
          maxLines: null,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }

  TextFormField buildRichTextCell(BuildContext context, String txt) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        filled: true,
      ),
      initialValue: txt,
      enabled: true,
      autofocus: false,
      showCursor: true,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 10,
      //maxLength: 400,
      //maxLengthEnforced: false,
      style: Theme.of(context).textTheme.bodyText2,
      enableInteractiveSelection: true,
      toolbarOptions:
          ToolbarOptions(copy: true, cut: true, paste: true, selectAll: true),
      onEditingComplete: () {
        print('onEditingComplete');
      },
      // onSubmitted: (value) {
      //   print('onSubmitted');
      // },
      onChanged: (value) {
        print('onChanged');
      },
      onTap: () {
        print('onTap');
      },
    );
  }

  Padding buildLeadingCell(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: HtmlWidget(txt),
    );
  }

  Widget buildHeaderCell(String txt, Color color) {
    return Container(
      height: 70,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  DropdownButton<int> buildIconDropdownButton(BuildContext context,
      List<IconDropdownEntry> items, int value, void Function(int) setValue) {
    return DropdownButton<int>(
        style: Theme.of(context).textTheme.bodyText2,
        value: value,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 4,
        dropdownColor: Colors.white,
        items: items.map((e) {
          return DropdownMenuItem<int>(
              value: e.value,
              child: Row(
                children: [
                  Icon(e.icon, color: e.iconColor),
                  Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(e.text)),
                ],
              ));
        }).toList(),
        onChanged: (int newValue) {
          setState(() {
            setValue(newValue);
          });
        });
  }
}
