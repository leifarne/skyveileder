import 'package:flutter/material.dart';

import 'home.dart';
import 'intro.dart';
import 'project_context.dart';
import 'customer_profile.dart';
import 'reseller_assessment.dart';

void main() => runApp(MyApp());

bool editMode = true;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nordheim Digital',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Colors.deepPurple[100],
          // hintColor: Color(0xFFC0F0E8),
          // primaryColor: Color(0xFF80E1D1),
          // fontFamily: "Montserrat",
          canvasColor: Colors.transparent,
          primarySwatch: Colors.deepPurple,
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 12))),
      initialRoute: '/customer_profile',
      routes: {
        // Velkomstside m/innlogging eller registrer
        // Login
        // '/login': (context) => LoginScreen(),
        // Register
        // '/register': (context) => Register(),
        '/login': (context) => Splash(),
        // Customer profile registration. Choose Customer or Reseller (System Integrator). For lawyers, by lawyers!
        '/customer_profile': (context) =>
            CustomerProfilePage(title: 'Profile registration'),
        // Project/Cloud context definition
        '/project_context': (context) =>
            ProjectContextPage(title: 'Project context definition'),
        // Intro, news, general issues, 4 min read.
        '/intro': (context) => Intro(),
        '/reseller': (context) =>
            ResellerAssessmentPage(title: 'Reseller assessment tool'),
        '/system_integrator': (context) => MyHomePage(title: 'Rikdom3'),
      },
    );
  }
}

class MyApp2 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primarySwatch: Colors.deepPurple,
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 12))),
      home: new MyHomePage(title: 'Rikdom2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).textTheme.bodyText2.fontFamily);
    return Container();
  }
}
