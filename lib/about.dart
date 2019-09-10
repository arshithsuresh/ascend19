import 'package:flutter/material.dart';
import 'AppTheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:async/async.dart';
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Ascend 19",
          textScaleFactor: 1,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: RichText(
                    textAlign: TextAlign.justify,
                    textScaleFactor: 0.9,
                    text: TextSpan(children: [
                      TextSpan(
                        text:
                            '''    Ascend 2019 is the technical fest of Computer Science and Engineering Department of Saintgits College of Engineering. The fest attracts participants from various part of the country. The fest has 9+ events and 2 workshops and many other attractions. 
                
                Saintgits College of Engineering is a self-financing technical institution located at Kottayam district of Kerala. The college was established in 2002. Saintgits is approved by All India Council for Technical Education(AICTE) and affiliated to APJ Abdul Kalam Technological University, Kerala.  We offer a B Tech Degree course in 9 engineering disciplines, and Masters Degree courses in Engineering, Computer Applications and Business Administration. In the short span of a decade of its existence and among the six batches of students that have graduated, the college bagged several university ranks and has a remarkably high percentage of pass.''',
                        style: AppTheme.eventDescription,
                      ),
                    ])),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Check us out : ",
                    style: AppTheme.eventDescription,
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    onPressed: () async{
                      await launch("https://www.instagram.com/ascend_19/");
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.facebook),
                    onPressed: () async{
                      await launch("https://www.facebook.com/ascend19/");
                    },
                  ),
                ],
              ),
              SizedBox(height: 35,),
              Container(

                //alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("\nApp Designed and Developed by",textScaleFactor: 1,),
                    Text("Vardev Solutions",textScaleFactor: 1,style: AppTheme.splashHeading,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(FontAwesomeIcons.instagram),
                        onPressed: () async{
                          await launch("https://www.instagram.com/vardevsolutions/");
                        },
                      ),

                    ],)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
