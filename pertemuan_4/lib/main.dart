import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pertemuan 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Pertemuan 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  static const IconData bolt = IconData(0xe5f5, fontFamily: 'MaterialIcons');

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  void _showToast(String text) {
    setState(() {
      Fluttertoast.showToast(
          msg: text,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void _showDialog(String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog"),
          content: new Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                _showToast("Oops.. Feature disabled");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Latihan Flutter Iip'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 600,
            width: 400,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                          width: 400,
                          child: Image.asset('assets/img/iip.png',
                              fit: BoxFit.fill))),
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 32.0, horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Iip Priatna',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.w700)),
                          Padding(padding: EdgeInsets.only(bottom: 5.0)),
                          Text('18111200 - TIF-RM-18 CIDA',
                              textAlign: TextAlign.start),
                        ],
                      ))
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
        ],
      )),
      floatingActionButton: Container(
        // margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              mini: true,
              onPressed: () {
                _showToast("Oops.. Network error");
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.loop, color: Colors.yellow),
            ),
            Padding(padding: EdgeInsets.only(right: 5.0)),
            FloatingActionButton(
              onPressed: () {
                _showSnackBar("Mehh..");
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.close, color: Colors.red),
            ),
            Padding(padding: EdgeInsets.only(right: 5.0)),
            FloatingActionButton(
              mini: true,
              onPressed: () {
                _showDialog("Wow!");
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.star, color: Colors.purple),
            ),
            Padding(padding: EdgeInsets.only(right: 5.0)),
            FloatingActionButton(
              onPressed: () {
                _showSnackBar("Yeay!");
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.favorite, color: Colors.pink),
            ),
            Padding(padding: EdgeInsets.only(right: 5.0)),
            FloatingActionButton(
              mini: true,
              onPressed: () {
                _showToast("Oops.. Feature disabled");
              },
              backgroundColor: Colors.white,
              child: Icon(Icons.archive, color: Colors.lightGreen),
            ),
          ],
        ),
      ),
    );
  }
}
