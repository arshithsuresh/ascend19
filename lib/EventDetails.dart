import 'package:flutter/material.dart';
import 'package:ascend19/AppTheme.dart';
import 'EventList.dart';
import 'package:ascend19/registerEvent.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

EventModel eventObject;
String HeroTag;
class EventDetails extends StatefulWidget {

  EventDetails(EventModel eventModel, String heroTag) {
    eventObject = eventModel;
    HeroTag = heroTag;
  }

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //title: Text(eventObject.eventTitle,style: AppTheme.,),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Hero(
                tag: eventObject.heroTag+HeroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Image(
                    image: eventObject.eventImage,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12,right: 12),
                child: Wrap(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceAround,
                direction: Axis.horizontal,
                  children: <Widget>[
                    Hero(
                      tag: eventObject.heroTag+HeroTag + "title",
                      child: Container(
                        child: Text(
                          eventObject.eventTitle,
                          textScaleFactor: 1,
                          style: AppTheme.fontStlye1,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          favoritedClick();
                          print("Favorite Clicked!");
                        },
                        icon: Icon(
                          eventObject.favorited ? Icons.favorite : Icons.favorite_border,
                          color: Colors.redAccent,
                          size: 40,
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 12,right: 12),
                child: Text(
                  eventObject.shortDecription,
                  style: AppTheme.eventDescription,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 14, bottom: 8, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.today,
                            size: 30,
                            color: Colors.redAccent,
                          ),
                          Text(
                            eventObject.eventDate,
                            textScaleFactor: 1,
                            style: AppTheme.eventSubDetails,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 30,
                            color: Colors.redAccent,
                          ),
                          Text(
                            eventObject.eventTime,
                            textScaleFactor: 1,
                            style: AppTheme.eventSubDetails,
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.room,
                            size: 30,
                            color: Colors.redAccent,
                          ),
                          Text(
                            eventObject.venue,
                            textScaleFactor: 1,
                            style: AppTheme.eventSubDetails,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        eventObject.descriptions,
                        style: AppTheme.eventDescription,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      textScaleFactor: 1,
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Registration Fee \n",
                            style: AppTheme.eventDescription),
                        TextSpan(
                            text: eventObject.regFee,
                            style: AppTheme.RulesAndRegu)
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Prizes Worth : ",

                            style: AppTheme.eventDescription),
                        TextSpan(
                            text: eventObject.PrizeMoney,
                            style: AppTheme.RulesAndRegu)
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ExpansionTile(
                      title: Text(
                        "Rules and Regulations",
                        textScaleFactor: 1,
                        style: AppTheme.RulesAndRegu,
                      ),
                      children: <Widget>[
                        Container(
                          child: Text(
                            eventObject.RulesAndRegulations,
                            style: AppTheme.eventDescription,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ExpansionTile(
                      title: Text(
                        "Contact Info",
                        style: AppTheme.RulesAndRegu,
                      ),
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 26,right: 26),
                            child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RichText(
                                    textScaleFactor: 1,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: eventObject.Heads[0]+" ",
                                        style: AppTheme.eventDescription),

                                  ]),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                FlatButton(
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.black,
                                  ),
                                  onPressed: () async {
                                    await launch("tel:${eventObject.HeadContacts[0]}");
                                  },
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: <Widget>[
                                RichText(
                                  textScaleFactor: 1,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: eventObject.Heads[1]+" ",
                                        style: AppTheme.eventDescription),
                                  ]),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                FlatButton(
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.black,
                                  ),
                                  onPressed: () async {
                                    await launch("tel:${eventObject.HeadContacts[1]}");
                                  },
                                )
                              ],)


                              ],
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
                      color: Colors.redAccent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterEvent(eventObject.eventId),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.launch,
                            color: Colors.white,
                          ),
                          Text(
                            " Register",
                            style: AppTheme.eventSubHeading,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void favoritedClick() {
    setState(() {
      //favorited = !favorited;
      eventObject.favorited=!eventObject.favorited;
      Favorited_Pref();
    });
  }

  void Favorited_Pref()async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(eventObject.eventId.toString(), eventObject.favorited);
  }
}
