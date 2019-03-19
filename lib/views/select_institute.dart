import 'package:flutter/material.dart';
import 'package:schedulr/global.dart';
import 'package:schedulr/views/login.dart';

class SelectInstitutePage extends StatefulWidget {
  SelectInstitutePage({Key key, this.loginType}) : super(key: key);

  final String loginType;

  @override
  _SelectInstitutePageState createState() => _SelectInstitutePageState();
}

class _SelectInstitutePageState extends State<SelectInstitutePage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _obscurePassword = true;
  Color _passIndicatorColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    const double padding = 16.0;
    const double paddingTop = 10.0;

    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _makeSizedBox(0.5),
          _makeBackNavigation(context),
          _makeTitle(),
          _makeTitleUnderline(),
          Divider(),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  itemBuilder: (BuildContext context, int index) {
                    _Institute inst = new _Institute(
                        "Shri Guru Gobind Singhji Institute of Engineering & Technology",
                        "Nanded");
                    return ListTile(
                      leading: Icon(Icons.school),
                      title: Text(inst.name),
                      subtitle: Text(inst.city),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoginPage(
                                    loginType: widget.loginType,
                                    instituteName: inst.name,
                                  ),
                            ));
                      },
                    );
                  },
                  itemCount: 10))
        ],
      ),
    ));
  }

  Padding _makeBackNavigation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FlatButton.icon(
          padding: const EdgeInsets.all(0.0),
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text(widget.loginType),
        ),
      ),
    );
  }

  SizedBox _makeSizedBox(double ratio) {
    return SizedBox(
      height: kToolbarHeight * ratio,
    );
  }

  Padding _makeTitle() {
    const double padding = 8.0;
    const double fontSize = 30.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        "Select Institute",
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }

  Padding _makeTitleUnderline() {
    const double paddingLeft = 16.0;
    const double paddingTop = 4.0;
    const double lineWidth = 32.0;
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

class _Institute {
  String _name, _city;

  _Institute(this._name, this._city);

  String get name => this._name;

  String get city => this._city;
}
