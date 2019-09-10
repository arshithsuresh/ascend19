import 'package:ascend19/widgets/eventWidget.dart';
import 'package:flutter/material.dart';
import 'package:ascend19/AppTheme.dart';
import 'package:ascend19/EventList.dart';
import 'package:ascend19/notification_page.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:ascend19/about.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';

class EventListingPage extends StatefulWidget {
  @override
  _EventListingPageState createState() => _EventListingPageState();
}

class _EventListingPageState extends State<EventListingPage> {
  FlareController controller;
  String currentAnimation="wave";
  List<String> animations=["wave","stand","dance"];
  int index=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllFavorited();
  }

  void getFavorited(EventModel eventDetails)async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(eventDetails.eventId.toString()))
    {
      setState(() {
        eventDetails.favorited = sharedPreferences.getBool(eventDetails.eventId.toString());
      });
    }
    else {
      print("No Sharef pref found");
    }
  }

  void getAllFavorited()
  {
    Events.forEach((eventDetail){
      getFavorited(eventDetail);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async=>true,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          actions: <Widget>[],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: (){
                  print("Change Anim");
                  setState(() {
                    index=(index+1)%3;
                    currentAnimation = animations[index];
                  });
                },
                child: Hero(
                  tag: "minion",
                  child: FlareActor(
                    "assets/minion.flr",
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.contain,
                    controller: controller,
                    animation: currentAnimation,
                  ),
                ),
              ),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 8),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "ASCEND '19", style: AppTheme.fontStlye1),
                      TextSpan(text: "\n"),
                      TextSpan(text: "CODE . DEBUG . DEPLOY", style: AppTheme.eventSubDetails)
                    ]),
                  ),
                ),
                SizedBox(height: 8,),
                Expanded(

                    child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top:10.0,left:8,right:8,bottom: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)

                          ),
                          child: ExpansionTile(
                            initiallyExpanded: false,
                          title: Text(
                                "  Events",
                                style: AppTheme.fontStlye2,
                                textScaleFactor: 1,
                              ),
                          children: Events.map((event) => EventWidget(event, ""))
                              .toList(),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)

                          ),
                          child: ExpansionTile(

                          title: Text(
                              "  Workshops",
                              style: AppTheme.fontStlye2,
                              textScaleFactor: 1,
                            ),

                          children: Workshops.map((event) => EventWidget(event, ""))
                              .toList(),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)

                          ),
                          child: ExpansionTile(
                          onExpansionChanged: (bool) {
                            setState(() {});
                          },
                          title: Text(
                              "  Favourites",
                            textScaleFactor: 1,
                              style: AppTheme.fontStlye2,
                            ),

                          children: Events.map((event) {
                            if (event.favorited) {
                              return EventWidget(event, "fav");
                            }
                            return Container();
                          }).toList(),
                          ),
                        ),
                        SizedBox(height: 8,),
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white,
                                border: Border.all(color: Colors.black)

                            ),
                            child: Row(
                              children: <Widget>[Text(
                                "  Notifications",
                                style: AppTheme.fontStlye2,
                                textScaleFactor: 1,
                              ),]
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NotificationPage()))
                                .then((value) {
                              print("Returned from Details");
                            });
                          },
                        )

                      ],
                    ),
                  ),
                )),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 4,right: 16),
                child: FloatingActionButton(
                  tooltip: "About",
                  backgroundColor: Colors.white,
                  child: Icon(Icons.help_outline,size: 36,color: Colors.black87,),
                  onPressed: (){
                    print("Floating Action Pressed!");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutPage()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
