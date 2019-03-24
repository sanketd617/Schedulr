import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'package:schedulr/controllers/AuthController.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/models/Institute.dart';
import 'package:schedulr/models/User.dart';
import 'package:schedulr/views/InstituteHomeView.dart';
import 'package:schedulr/views/StudentHomeView.dart';
import 'package:schedulr/views/auth/SelectInstituteView.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.loginType, this.institute}) : super(key: key);

  final String loginType;
  final Institute institute;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _obscurePassword = true;
  Color _passIndicatorColor = Colors.grey;
  bool isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: isLoading ? loader() : buildForm(context));
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
            buildBackNavigation(context),
            buildTitle(),
            buildTitleUnderline(),
            buildSizedBox(1.0),
            buildEmailField(),
            buildSizedBox(0.45),
            buildPasswordField(),
            buildForgotPasswordText(),
            buildSizedBox(0.80),
            buildLoginButton(context),
            buildSizedBox(0.40),
            buildAlternateLoginText(),
            buildSizedBox(0.25),
            buildSocialLoginButtons()
          ],
        ));
  }

  Align buildBackNavigation(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: FlatButton.icon(
        padding: const EdgeInsets.all(0.0),
        icon: Icon(Icons.navigate_before),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SelectInstitutePage(
                      loginType: widget.loginType,
                    ),
              ));
        },
        label: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.8,
          child: Text(widget.institute.name, overflow: TextOverflow.ellipsis,),
        ),
      ),
    );
  }

  Row buildSocialLoginButtons() {
    var height = 46.0;
    var width = 23.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildSocialLoginButton(GroovinMaterialIcons.google),
        Container(
          child: null,
          height: height,
          width: width,
        ),
        buildSocialLoginButton(GroovinMaterialIcons.fingerprint)
      ],
    );
  }

  Container buildSocialLoginButton(IconData icon) {
    var radius = 30.0;
    var height = 46.0;
    var width = 46.0;
    var borderWidth = 0.5;
    return Container(
      child: InkWell(
        onTap: () {
          // TODO
        },
        borderRadius: BorderRadius.circular(radius),
        child: Icon(icon),
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: borderWidth)),
    );
  }

  SizedBox buildSizedBox(double ratio) {
    return SizedBox(
      height: kToolbarHeight * ratio,
    );
  }

  Align buildAlternateLoginText() {
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

  Align buildLoginButton(BuildContext context) {
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
              setState(() {
                isLoading = true;
              });
              if (widget.loginType == LoginType.studentLogin) {
                AuthController.login(
                    _email, _password, widget.institute.serverURL,
                    widget.loginType, onStudentLoginSuccess, onError);
              }
              else if (widget.loginType == LoginType.facultyLogin) {

              }
              else if (widget.loginType == LoginType.instituteLogin) {
                AuthController.login(
                    _email, _password, widget.institute.serverURL,
                    widget.loginType, onInstituteLoginSuccess, onError);
              }
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

  Padding buildForgotPasswordText() {
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

  TextFormField buildPasswordField() {
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

  TextFormField buildEmailField() {
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

  Padding buildTitle() {
    const double padding = 8.0;
    const double fontSize = 42.0;
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Text(
        widget.loginType,
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

  void onStudentLoginSuccess(User user) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              StudentHomePage(
                user: user,
              ),
        ));
    setState(() {
      isLoading = false;
    });
  }

  void onInstituteLoginSuccess(Institute institute) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              InstituteHomePage(
                institute: institute,
              ),
        ));
    setState(() {
      isLoading = false;
    });
  }

  void onError(String error) {
    setState(() {
      isLoading = false;
    });

    _scaffoldKey.currentState.showSnackBar(new SnackBar(content: Text(error)));
  }
}
