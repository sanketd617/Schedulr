import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _obscurePassword = true;
  Color _passIndicatorColor = Colors.grey;

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
                _makeEmailField(),
                _makeSizedBox(0.45),
                _makePasswordField(),
                _makeForgotPasswordText(),
                _makeSizedBox(0.80),
                _makeLoginButton(context),
                _makeSizedBox(0.40),
                _makeAlternateLoginText(),
                _makeSizedBox(0.25),
                _makeSocialLoginButtons()
              ],
            )));
  }

  Row _makeSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: InkWell(
            onTap: () {
              // TODO
            },
            borderRadius: BorderRadius.circular(30.0),
            child: Icon(GroovinMaterialIcons.google),
          ),
          height: 46.0,
          width: 46.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 0.5)),
        )
      ],
    );
  }

  SizedBox _makeSizedBox(double ratio) {
    return SizedBox(
      height: kToolbarHeight * ratio,
    );
  }

  Align _makeAlternateLoginText() {
    const double fontSize = 12.0;
    Color fontColor = Colors.grey;
    const String text = "or login with";
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: fontColor),
      ),
    );
  }

  Align _makeLoginButton(BuildContext context) {
    const double buttonHeight = 50.0;
    const double buttonWidth = 270.0;
    const double borderRadius = 50.0;
    Color buttonColor = Colors.grey[900];
    const String text = "LOGIN";

    return Align(
      child: SizedBox(
        height: buttonHeight,
        width: buttonWidth,
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              //TODO
            }
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

  Padding _makeForgotPasswordText() {
    const double padding = 8.0;
    const double fontSize = 12.0;
    const Color fontColor = Colors.grey;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              //TODO
            },
            child: Text(
              "Forgot password?",
              style: TextStyle(fontSize: fontSize, color: fontColor),
            ),
          )),
    );
  }

  TextFormField _makePasswordField() {
    return TextFormField(
      onSaved: (password) {
        _password = password;
      },
      validator: (password) {
        if (password.isEmpty) {
          return "Please enter your password.";
        }
      },
      decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
                _passIndicatorColor =
                    _obscurePassword ? Colors.grey : Colors.blue;
              });
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: _passIndicatorColor,
            ),
          )),
      obscureText: _obscurePassword,
    );
  }

  TextFormField _makeEmailField() {
    return TextFormField(
      onSaved: (email) {
        _email = email;
      },
      validator: (email) {
        if (email.isEmpty) {
          return "Please enter your email.";
        }
      },
      decoration: InputDecoration(labelText: "Email address"),
    );
  }

  Padding _makeTitle() {
    const double padding = 8.0;
    const double fontSize = 42.0;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Text(
        "Login",
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
}
