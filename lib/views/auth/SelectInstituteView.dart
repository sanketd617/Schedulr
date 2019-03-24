import 'package:flutter/material.dart';
import 'package:schedulr/controllers/ApiController.dart';
import 'package:schedulr/Global.dart';
import 'package:schedulr/controllers/StorageController.dart';
import 'package:schedulr/models/Institute.dart';
import 'package:schedulr/views/auth/LoginTypeView.dart';
import 'package:schedulr/views/auth/LoginView.dart';

class SelectInstitutePage extends StatefulWidget {
  SelectInstitutePage({Key key, this.loginType}) : super(key: key);

  final String loginType;

  @override
  _SelectInstitutePageState createState() => _SelectInstitutePageState();
}

class _SelectInstitutePageState extends State<SelectInstitutePage> {
  var listContent;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _makeBody());
  }

  @override
  void initState() {
    super.initState();

    listContent = FutureBuilder(
      future: StorageController.getInstitutes(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data == null) {
            return FutureBuilder(
              future: APIController.getInstitutes(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return _makeList(snapshot.data);
                  } else if (snapshot.hasError) {
                    return somethingWentWrong();
                  }
                }
                return loader();
              },
            );
          }
          else if (snapshot.hasData) {
            return _makeList(snapshot.data);
          }
        }
        return loader();
      },
    );
  }

  void loadInstitutes() {
    setState(() {
      listContent = FutureBuilder(
        future: APIController.getInstitutes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return _makeList(snapshot.data);
            } else if (snapshot.hasError) {
              return somethingWentWrong();
            }
          }
          return loader();
        },
      );
    });
  }

  Container _makeBody() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _makeSizedBox(0.5),
          _makeBackNavigation(context),
          _makeTitle(),
          _makeTitleUnderline(),
          Divider(),
          Expanded(child: listContent)
        ],
      ),
    );
  }

  ListView _makeList(List<Institute> institutes) {
    return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.school),
            title: Text(institutes[index].name),
            subtitle: Text(institutes[index].city),
            onTap: () {
              StorageController.save("institute", institutes[index].toJSON());
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(
                          loginType: widget.loginType,
                          institute: institutes[index],
                        ),
                  ));
            },
          );
        },
        itemCount: institutes.length);
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
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LoginTypePage(),
                ));
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
    const double fontSize = 30.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Text(
            "Select Institute",
            style: TextStyle(fontSize: fontSize),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(Icons.refresh),
                onTap: () {
                  loadInstitutes();
                },
              ),
            ),
          )
        ],
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
