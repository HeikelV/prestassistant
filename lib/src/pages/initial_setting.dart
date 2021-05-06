import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prestassistant/src/pages/tabs_page.dart';
import 'package:prestassistant/src/shared_prefs/prefs_user.dart';
import 'package:http/http.dart' as http;

class InitialSetting extends StatefulWidget {
  @override
  _InitialSettingState createState() => _InitialSettingState();
}

class _InitialSettingState extends State<InitialSetting> {
  String _uri;
  String _key;
  String _token;

  TextEditingController _uriController;
  TextEditingController _keyController;

  final prefs = new PrefsUser();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loadSettings();
    _uriController = new TextEditingController(text: prefs.uri);
    _keyController = new TextEditingController(text: prefs.key);

    _uri = prefs.uri;
    _key = prefs.key;

    print(_uri);
    print(_key);
    _setToken();
    print(prefs.token);
  }

  _setToken() {
    prefs.token = prefs.key;
    _token = prefs.token;
    print(_token);
  }

  _setUrl(String value) {
    prefs.uri = value;
    _uri = value;
    setState(() {});
  }

  // _setKey(String value) {
  //   prefs.key = value;
  //   _key = value;
  //   setState(() {});
  // }

  // loadSettings() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _uri = prefs.getString('url');
  //   _key = prefs.getString('key');
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff411452),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  child: Text(
                    'Set up your connection',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _uriController,
                onChanged: (value) {
                  prefs.uri = value;
                  _setUrl(value);
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'URL',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'https://your.store.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15, bottom: 0),
              child: TextField(
                controller: _keyController,
                onChanged: (value) {
                  prefs.key = value;
                  _setToken();
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'ID',
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Prestashop Webservice API KEY',
                  helperText: 'Find it in your store Admin Advanced Parameters',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                splashColor: Color(0xff411452),
                color: Color(0xff840e5f),
                autofocus: true,
                onPressed: () async {
                  {
                    showAlertDialog(context);
                    final link = Uri.parse('$_uri/api?output_format=JSON');
                    final resp = await http.get(link, headers: {HttpHeaders.authorizationHeader: "Basic $_token"});
                    Navigator.pop(context);
                    if (resp.statusCode == 200) {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TabPage()));
                    } else {
                      print(resp.statusCode);
                      print(_key);
                      print(_token);
                    }
                  }

                  //
                },
                child: Text(
                  'Connect...',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Connecting..")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
