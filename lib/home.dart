import 'package:flutter/material.dart';
import 'clipper.dart';
// import 'main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  String _email;
  String _password;
  String _displayName;
  bool _obsecure = false;

  void initState() {
    super.initState();
  }

  //GO logo widget
  Widget logo() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 330,
          height: 200,
          child: Stack(
            children: <Widget>[
              Positioned(
                  child: Container(
                child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    width: 150,
                    height: 150,
                  ),
                ),
                height: 154,
              )),
              Positioned(
                child: Container(
                    height: 154,
                    child: Align(
                      child: Text(
                        "GO",
                        style: TextStyle(
                          fontSize: 120,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                width: 97,
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                      width: 75, // MediaQuery.of(context).size.width * 0.15,
                      height: 75, // MediaQuery.of(context).size.width * 0.15,
                      bottom: 23, // MediaQuery.of(context).size.height * 0.046,
                      left: 20, // MediaQuery.of(context).size.width * 0.22,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      width: 40, // MediaQuery.of(context).size.width * 0.08,
                      height: 40, // MediaQuery.of(context).size.width * 0.08,
                      bottom: 0,
                      left: 0, // MediaQuery.of(context).size.width * 0.32,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //input widget
  Widget _input(
      Icon icon, String hint, TextEditingController controller, bool obsecure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
        style: TextStyle(
          fontSize: 18,
        ),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 3,
              ),
            ),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(color: Theme.of(context).primaryColor),
                child: icon,
              ),
              padding: EdgeInsets.only(left: 20, right: 10),
            )),
      ),
    );
  }

  //button widget
  Widget _button(String text, Color splashColor, Color highlightColor,
      Color fillColor, Color textColor, void function()) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {
        function();
      },
    );
  }

  //login and register fuctions

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _emailController.clear();
    _passwordController.clear();

    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => MyHomePage(
    //               title: 'Rikdom3',
    //             )));
    Navigator.pushNamed(context, '/system_integrator');
  }

  void _registerUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _displayName = _nameController.text;
    _emailController.clear();
    _passwordController.clear();
    _nameController.clear();
  }

  void _loginSheet() {
    _scaffoldKey.currentState.showBottomSheet<void>(
      (BuildContext context) {
        Color primary = Theme.of(context).primaryColor;

        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 350,
            height: MediaQuery.of(context).size.height / 1.1,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white, // Theme.of(context).canvasColor,
              ),
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _emailController.clear();
                              _passwordController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          //width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: Align(
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 60),
                          child: _input(Icon(Icons.email), "EMAIL",
                              _emailController, false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: _input(Icon(Icons.lock), "PASSWORD",
                              _passwordController, true),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            child: _button("LOGIN", Colors.white, primary,
                                primary, Colors.white, _loginUser),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      backgroundColor: Theme.of(context).hintColor.withAlpha(220),
    );
  }

  void _registerSheet() {
    _scaffoldKey.currentState.showBottomSheet<void>(
      (BuildContext context) {
        Color primary = Theme.of(context).primaryColor;

        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.1,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white, // Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 10,
                        top: 10,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _emailController.clear();
                            _passwordController.clear();
                            _nameController.clear();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Align(
                              child: Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).primaryColor),
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 25, right: 40),
                              alignment: Alignment.center,
                              child: Text(
                                "REGI",
                                style: TextStyle(
                                  fontSize: 44,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.only(top: 44, left: 28),
                                width: 130,
                                child: Text(
                                  "STER",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                        top: 60,
                      ),
                      child: _input(Icon(Icons.account_circle), "DISPLAY NAME",
                          _nameController, false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: _input(
                          Icon(Icons.email), "EMAIL", _emailController, false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: _input(Icon(Icons.lock), "PASSWORD",
                          _passwordController, true),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        child: _button("REGISTER", Colors.white, primary,
                            primary, Colors.white, _registerUser),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        );
      },
      backgroundColor: Theme.of(context).hintColor.withAlpha(220),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        // backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: IntrinsicHeight(
            child: Card(
              margin: EdgeInsets.all(24),
              elevation: 4,
              color: Theme.of(context).primaryColor,
              child: Container(
                width: 400,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: logo(),
                    ),
                    Padding(
                      child: Container(
                        child: _button("LOGIN", primary, Colors.white,
                            Colors.white, primary, _loginSheet),
                        height: 50,
                      ),
                      padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                    ),
                    Padding(
                      child: Container(
                        child: OutlineButton(
                          highlightedBorderColor: Colors.white,
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          highlightElevation: 0.0,
                          splashColor: Colors.white,
                          highlightColor: Theme.of(context).primaryColor,
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            _registerSheet();
                          },
                        ),
                        height: 50,
                      ),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    ),
                    Align(
                      child: ClipPath(
                        child: Container(
                          color: Colors.white,
                          height: 100,
                        ),
                        clipper: BottomWaveClipper(),
                      ),
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                ),
              ),
            ),
          ),
        ));
  }
}
