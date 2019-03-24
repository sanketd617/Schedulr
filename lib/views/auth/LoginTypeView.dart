import 'package:flutter/material.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/views/auth/SelectInstituteView.dart';

class LoginTypePage extends StatefulWidget {
  LoginTypePage({Key key}) : super(key: key);

  @override
  _LoginTypePageState createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildForm(context));
  }

  Form buildForm(BuildContext context) {
    const double padding = 22.0;
    const double paddingTop = 0.0;
    return Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
              padding, paddingTop, padding, padding),
          children: <Widget>[
            buildSizedBox(1.0),
            buildTitle(),
            buildTitleUnderline(),
            buildSizedBox(1.0),
            buildSubtitle(),
            buildSizedBox(0.5),
            buildLoginButton(context, "Student", LoginType.studentLogin),
            buildSizedBox(0.5),
            buildLoginButton(context, "Faculty", LoginType.facultyLogin),
            buildSizedBox(0.5),
            buildLoginButton(context, "Institute", LoginType.instituteLogin),
          ],
        ));
  }

  Padding buildSubtitle() {
    const double padding = 8.0;
    const double fontSize = 20.0;
    return Padding(
        padding: const EdgeInsets.all(padding),
        child: Center(
          child: Text(
            "Select your login type",
            style: TextStyle(fontSize: fontSize, color: Colors.grey),
          ),
        ));
  }

  Padding buildTitle() {
    const double padding = 8.0;
    const double fontSize = 42.0;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Text(
        AppConfig.appName,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  Padding buildTitleUnderline() {
    const double paddingLeft = 12.0;
    const double paddingTop = 4.0;
    const double lineWidth = 38.0;
    const double lineHeight = 3.0;
    return Padding(
      padding: const EdgeInsets.only(left: paddingLeft, top: paddingTop),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: lineWidth,
          height: lineHeight,
          color: Colors.black,
        ),
      ),
    );
  }

  Align buildLoginButton(BuildContext context, String text, String loginType) {
    const double buttonHeight = 50.0;
    const double buttonWidth = 270.0;
    const double borderRadius = 50.0;
    Color buttonColor = Colors.grey[900];
    text = text.toUpperCase();

    return Align(
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: FlatButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SelectInstitutePage(loginType: loginType),
                ));
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          color: buttonColor,
          child: Text(
            text,
            style: Theme.of(context).primaryTextTheme.button,
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double ratio) {
    return SizedBox(
      height: kToolbarHeight * ratio,
    );
  }
}
