import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:schedulr/global.dart';
import 'package:schedulr/views/select_institute.dart';

class LoginTypePage extends StatefulWidget {
  LoginTypePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginTypePageState createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const double padding = 22.0;
    const double paddingTop = 0.0;

    return Scaffold(
        body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(
                  padding, paddingTop, padding, padding),
              children: <Widget>[
                _makeSizedBox(1.0),
                _makeTitle(),
                _makeTitleUnderline(),
                _makeSizedBox(1.0),
                _makeSubTitle(),
                _makeSizedBox(0.5),
                _makeLoginButton(context, "Student", LoginType.studentLogin),
                _makeSizedBox(0.5),
                _makeLoginButton(context, "Faculty", LoginType.facultyLogin),
                _makeSizedBox(0.5),
                _makeLoginButton(
                    context, "Institute", LoginType.instituteLogin),
              ],
            )));
  }

  Padding _makeSubTitle() {
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

  Padding _makeTitle() {
    const double padding = 8.0;
    const double fontSize = 42.0;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Text(
        AppDetails.appName,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  Padding _makeTitleUnderline() {
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

  Align _makeLoginButton(BuildContext context, String text, String loginType) {
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
            Navigator.push(
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

  SizedBox _makeSizedBox(double ratio) {
    return SizedBox(
      height: kToolbarHeight * ratio,
    );
  }
}
