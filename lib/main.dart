import 'package:flutter/material.dart';
import 'package:ascend19/EventListing.dart';
import 'package:ascend19/splashscreen.dart';
import 'package:ascend19/utils/notificationDBCreator.dart';

void main() async{
  await NotificationDBCreator().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ascend 19',
      theme: ThemeData(
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          primarySwatch: Colors.red,
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white,
          )),
      //home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/events': (context) => EventListingPage(),
      },
    );
  }
}
