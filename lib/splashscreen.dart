import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'package:ascend19/EventListing.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer timer;

  _SplashScreenState(){
    timer = Timer(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacementNamed("/events");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 30.0),
                  width: 80,
                  child: Image(image: AssetImage("assets/saintgits.png")),),
                Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,

                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "SAINTGITS COLLEGE OF ENGINEERING",
                              style: AppTheme.splashHeading),
                          TextSpan(
                              text: "\n\nDepartment of\n",
                              style: AppTheme.splashHeading),
                          TextSpan(
                              text: "COMPUTER SCIENCE AND ENGINEERING",
                              style: AppTheme.splashHeading),
                          TextSpan(
                              text: "\nIn Association with",
                              style: AppTheme.eventSubDetails),
                          TextSpan(
                              text: "\nEXCEL",
                              style: AppTheme.splashHeading),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Column(
                    children: <Widget>[
                      Align(
                      alignment: Alignment.bottomCenter
                      ,child: Text("PRESENTS",style: AppTheme.splashHeading,)),
                      Image(image: AssetImage("assets/ascend19app.png"),),
                    ],
                  ),
                ),
//                Container(
//                  child: RaisedButton(
//                    elevation: 15,
//                    color: Colors.redAccent,
//                    padding: EdgeInsets.all(20),
//                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
//                    //color: Colors.redAccent,
//                    child: Container(
//
//                        child: Text(
//                          "LET'S GO!",
//                          style: AppTheme.splashHeading,
//                        )),
//                    onPressed: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => EventListingPage()));
//                    },
//                  ),
//                ),
                SizedBox(
                  height: 26,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 12),
              child: Hero(
                tag: "minion",
                child: FlareActor(
                  "assets/minion.flr",
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.contain,
                  //animation: "Cargando",
                  animation: "stand",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
