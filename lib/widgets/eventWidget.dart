import 'package:flutter/material.dart';
import 'package:ascend19/AppTheme.dart';
import 'package:ascend19/EventDetails.dart';
import 'package:ascend19/EventList.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:async/async.dart';

class EventWidget extends StatefulWidget {
  EventModel eventObject;
  String heroTag;

  EventWidget(EventModel eventModel, String heroTag ) {
    this.eventObject = eventModel;
    this.heroTag = heroTag;
  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EventWidgetState(eventObject,heroTag);
  }
}

class _EventWidgetState extends State<EventWidget> {
  _EventWidgetState(EventModel eventDetails, String heroTag) {
    this.eventDetails = eventDetails;
    this.heroTag = heroTag;
    //getFavorited();
  }

  EventModel eventDetails;
  String heroTag;
  bool expanded = false;
  bool favorited = false;



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onLongPress: () {
                    favoritedClick();
                    print("Favorited!");
                  },
                  onTap: () {
                    print("Event Clicked!");
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  child: Hero(
                    tag: eventDetails.heroTag+heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Image(
                        image: eventDetails.eventImage,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        expanded ? BottomBanner() : Container(),
        heroTag!=""?Container():
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    favoritedClick();
                    print("Favorite Clicked!");
                  },
                  icon: Icon(
                    eventDetails.favorited ? Icons.favorite : Icons.favorite_border,
                    color: Colors.white,
                    size: 36,
                  ))),
        )
      ],
    );
  }

  void favoritedClick() {
    setState(() {
      favorited = !favorited;
      eventDetails.favorited=favorited;
      Favorited_Pref();
    });
  }

  void Favorited_Pref()async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(eventDetails.eventId.toString(), eventDetails.favorited);
  }

  void getFavorited()async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey(eventDetails.eventId.toString()))
      {
        eventDetails.favorited = sharedPreferences.getBool(eventDetails.eventId.toString());
      }
    else {
      print("No Sharef pref found");
    }
    setState(() {
      favorited = eventDetails.favorited;
    });
  }
  Widget BottomBanner() {
    return Positioned.fill(
        top: 0,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 15,
                  color: Colors.black.withOpacity(0.6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(height: 32,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Hero(
                            tag: eventDetails.heroTag+heroTag + "title",
                            child: Container(
                              child: Text(
                                eventDetails.eventTitle,
                                textScaleFactor: 0.8,
                                style: AppTheme.EventHeading,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 8, bottom: 6),
                              child: Text(
                                eventDetails.shortDecription,
                                textScaleFactor: 1,
                                style: AppTheme.eventSubHeading,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: FlatButton(
                          padding: EdgeInsets.all(12),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.launch,
                                  color: Colors.white,
                                ),
                                Text(
                                  " Details",
                                  textAlign: TextAlign.end,
                                  style: AppTheme.eventSubHeading,
                                  textScaleFactor: 1,
                                )
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EventDetails(eventDetails,heroTag))).then((value){
                                          print("Returned from Details");
                                          setState(() {
                                                  getFavorited();
                                                  expanded=false;
                                          });
                            });
                          },
                          splashColor: Colors.white,
                        ),
                      ),

                    ],
                  ),
                ))));
  }
}
