import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flare_flutter/flare_actor.dart';

class RegisterEvent extends StatefulWidget {
  int eventId;

  RegisterEvent(int eventId) {
    this.eventId = eventId;
  }

  @override
  _RegisterEventState createState() => _RegisterEventState(eventId);
}

class _RegisterEventState extends State<RegisterEvent> {
  int eventId;

  _RegisterEventState(eventId) {
    this.eventId = eventId;
  }


  Completer<WebViewController> _webViewController = Completer();

  loadingCircle(String value)
  {
    setState(() {
      stackIndex = 0;
    });
  }

  int stackIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("REGISTER"),),
        appBar: AppBar(
          title: Text("Register Event"),
        ),
        /*body: WebviewScaffold(
          url: "http://ascend19.com/eventregmobile.php?id=$eventId",
          withJavascript: true,
          hidden: true,
        )*/
        body: IndexedStack(
          index: stackIndex,
          children: <Widget>[
            WebView(
              onWebViewCreated: (WebViewController controller){
                _webViewController.complete(controller);
              },
              initialUrl: "http://ascend19.com/eventregmobile.php?id=$eventId",
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: loadingCircle,
            ),
            Container(
              color: Colors.transparent,
              child: Center(
                child:  CircularProgressIndicator(),
              ),
            )
          ],
        ),
    );
  }
}

//WebView(
//onWebViewCreated: (WebViewController e){
//_webViewController = e;
//},
//javascriptMode: JavascriptMode.unrestricted,
//initialUrl: "http://ascend19.com/eventregmobile.php?id=$eventId",
//onPageFinished: (String url){
//
//},
//),
