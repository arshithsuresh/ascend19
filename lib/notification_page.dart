import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ascend19/utils/notificationDBCreator.dart';
import 'package:ascend19/utils/notificationRepo.dart';
import 'package:ascend19/models/notificationModel.dart';
import 'package:ascend19/utils/notificationStream.dart';
import 'package:flare_flutter/flare_actor.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _notificationState();
  }
}

class _notificationState extends State<NotificationPage> {

  ScrollController _listController;
  NotificationStream _notificationStream = NotificationStream();
  List<NotificationModel> notifictions= List();
  int limit = 10;

  @override
  void initState() {
    _notificationStream.stream.listen((data)
    {
      if(this.mounted)
      setState(() {
        notifictions.addAll(data);
        notifictions.sort((a,b)=> b.postTime.compareTo(a.postTime));
      });

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Stack(
        children: <Widget>[

          Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  notifictions.length<=0?CircularProgressIndicator():Container(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: notifictions.length,
                      padding: EdgeInsets.only(bottom: 16),
                      controller: _listController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context,value){
                            return notificationCard(notifictions[value]);
                      },
//            children: <Widget>[
//              FutureBuilder(future: getNotifications(),
//              builder: (context,snapshot){
//                if(snapshot.connectionState == ConnectionState.done)
//                  {
//                      if(snapshot.data==null)
//                        {
//                          return Text("No Notifications to display!");
//                        }
//
//                      List<Widget> notiList = List();
//                      for (final node in snapshot.data)
//                        {
//                          notiList.add(notificationCard(node));
//                        }
//                        return Column(children: notiList,);
//                  }
//                  else
//                  {
//                      return Center(child: CircularProgressIndicator(),);
//                  }
//             },),
//
//              FlatButton(child: Text("Load more..."),onPressed: (){
//
//              },)
//            ],
                    ),
                  ),
                  SizedBox(height: 130,)
                ],
              )),

          IgnorePointer(
            child: FlareActor(
              "assets/rocket.flr",
              alignment: Alignment.bottomCenter,
              fit: BoxFit.contain,
              animation: "idle",
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
                color: Colors.white,
                child: Text("Load more..."),onPressed: (){
              limit+=10;
              notifictions = List();
              _notificationStream.addLocalData(limit: limit);
            }),
          ),
        ],
      ),
    );
  }

  String getDateFormated(DateTime date)
  {
    List<String> months = ['January','February','March','April','May','June','July','August','September','October','November','December'];
    String dateFormated = " ";
    dateFormated+= date.day.toString().padLeft(2,'0')+" "+months[date.month-1]+", "+date.year.toString();


    return dateFormated;
  }

  Widget notificationCard(NotificationModel notification){

    DateTime notiPost = notification.postTime;
    String postdate = getDateFormated(notiPost);
    String posttime = " "+notiPost.hour.toString().padLeft(2,'0')+":"+notiPost.minute.toString().padLeft(2,'0');
    return Card(
        elevation: 8,
        child: Stack(
          children: <Widget>[
            //Positioned(right: 15,bottom: 15,child: notification.read?Icon(Icons.check_circle):Container(),),
            Padding(
              padding: EdgeInsets.all(12),
              child: ExpansionTile(
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          notification.title,
                          style: TextStyle(
                              fontFamily: 'righteous',
                              fontSize: 22,
                              letterSpacing: 1.4),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          notification.subTitle,
                          style: TextStyle(
                              fontSize: 12, letterSpacing: 1.4),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Icon(Icons.event),
                            Text(postdate),
                            SizedBox(width: 15,),
                            Icon(Icons.access_time),
                            Text(posttime),
                          ],
                        )
                      ]),
                ),
                onExpansionChanged: (value) async {
                  if(value)
                    {
                      await NotificationReposistory.readNotification(notification);
                      setState(() {
                        notification.read = true;
                      });

                    }
                  value ? "See less" : "See more";
                },

//                trailing: Container(
//                    padding: EdgeInsets.all(8),
//                    color: Colors.grey[900],
//                    child: Text("See more",
//                      style: TextStyle(color: Colors.white),)),
                children: <Widget>[Container(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    notification.content
                  ,style: TextStyle(fontSize: 16,),),
                )
                ],
              ),
            ),
          ],
        ));
  }

  Future<List<NotificationModel>> getNotifications({limit=1})async
  {
      await NotificationReposistory.updateLocalDatabase();
      List<NotificationModel> notifications = await NotificationReposistory.getLastWeekNotification(limit: limit);
      return notifications;
  }
}
