import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoFacebook(),
    );
  }
}


// learned from
// https://www.youtube.com/watch?v=tfjmW0LEb64&ab_channel=snowexpertrohit

class DemoFacebook extends StatefulWidget {
  const DemoFacebook({Key? key}) : super(key: key);

  @override
  State<DemoFacebook> createState() => _DemoFacebookState();
}

class _DemoFacebookState extends State<DemoFacebook> {

  String SendtoFacebook = '';

  DemoFacebookSubmit() async {
    var response =
        await http.post(
        Uri.parse("https://graph.facebook.com/v14.0/108311288660067/feed?message=${SendtoFacebook}&access_token=EAAvo9yBhyW8BAFB8oY8TlyMCLXDfuSma2e3Hrx4aLyfyMTO7CM4h4fV7i9kilWlnZBLcvcJ3LOqmiEZBfGOoAaL9mZCe8uZAxakbaa1idXbgZCu5gwqoKmlZBPsJOJZC3fAmFOKI4ZCKgDyJCHnFsIPbLAYxs8pHyupxiMooIDL7QCrJkuyFIffZANLFbz8j2AekZD"));

    if (response.statusCode == 200) {
      print("Done");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Done",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffC85E2D),
                    fontWeight: FontWeight.bold),
              ),
              content: Text(
                "Posted On Facebook",
                style: TextStyle(
                    // color:Color(0xffE75A29)
                    ),
              ),
              scrollable: true,
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.blue, Color(0xff075A9E)]),
            ),
          ),
          title: Center(child: Text("Facebook Test")),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              TextFormField(
                onChanged: (input){
                  SendtoFacebook= input;
                },
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  DemoFacebookSubmit();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(
                          colors: [Colors.blue, Color(0xff075A9E)])),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "Send to Facebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
