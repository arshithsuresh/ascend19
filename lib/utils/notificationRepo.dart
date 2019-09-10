import 'dart:async';
import 'package:ascend19/utils/notificationDBCreator.dart';
import 'package:ascend19/models/notificationModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationReposistory{

  static Future<List<NotificationModel>> getLastWeekNotification({limit=15}) async
  {
    print("Notification : Getting Local Data");
    final sql = ''' select * from ${NotificationDBCreator.tableName} order by posttime desc limit $limit''';
    final data = await notificationDB.rawQuery(sql);
    List<NotificationModel> notificationList = List();
    //print(data);
    for(final node in data)
      {
          //print(node);
          notificationList.add(NotificationModel.fromJson(node));
          print("Notification : Converted!");
      }
    print("Notification : Fetched Local Data");
    return notificationList;
  }


  static Future<DateTime> getLastNotificationDate() async
  {
    print("Notification : Getting Local Data");
    final sql = ''' select * from ${NotificationDBCreator.tableName} order by posttime desc limit 1''';
    final data = await notificationDB.rawQuery(sql);
    if(data.length>0) {
      NotificationModel model = NotificationModel.fromJson(data[0]);
      print("Notification : Last Notification Tine ${model.postTime}");
      return model.postTime;
    }
    return null;


  }

  static Future<List<NotificationModel>> getNewNotifications() async
  {

    DateTime lastDate = await getLastNotificationDate();
    print("Notification : Geting online data...");
    List<NotificationModel> onlineNotifications = List();
    String url = "http://ascend19.com/app/getNotifications.php";
    if(lastDate!=null)
      url+="?lastdate=${lastDate.toString()}";
    bool networkError = false;
    http.Response response = await http.get(url).catchError((err){
      networkError = true;
    });
    if(networkError)
      {
        print("Notifications : Network error");
        return onlineNotifications;
      }
    if(response.contentLength<2) {
      print("Notifications : No new Notifications!");
      return null;
    }
    List<dynamic> parseJson = json.decode(response.body);
    print("Notification : Geting online data... Done!");
    print("Notification : Processing Data!");

    for (final data in parseJson)
      {
        //print(data);
        NotificationModel noti = NotificationModel.fromJson(data);
        noti.read = false;
        onlineNotifications.add(noti);
      }

      return onlineNotifications;
  }
  static Future<List<NotificationModel>> updateLocalDatabase() async
  {
    print("Notification : Updating Local Database!");
    List<NotificationModel> newNotifications = await getNewNotifications();
    newNotifications.forEach((notification)async{
          await InsertNotification(notification);
    });
    return newNotifications;
  }

  static Future<void> InsertNotification(NotificationModel notification) async
  {
    final sql = '''INSERT INTO ${NotificationDBCreator.tableName} 
    (
        ${NotificationDBCreator.col_title},
        ${NotificationDBCreator.col_subtitle},
        ${NotificationDBCreator.col_content},
        ${NotificationDBCreator.col_posttime},
        ${NotificationDBCreator.col_read}        
    )VALUES (?,?,?,DATETIME('${notification.postTime}'),?)''';
    List<dynamic> params = [
      notification.title,
      notification.subTitle,
      notification.content,
      notification.read?1:0
    ];
    int lastInsert = await notificationDB.rawInsert(sql,params);
    print(lastInsert);
  }

  static Future<void> readNotification(NotificationModel notification) async
  {
    final sql ='''UPDATE ${NotificationDBCreator.tableName} SET ${NotificationDBCreator.col_read}=1 WHERE ${NotificationDBCreator.col_notId}=${notification.notiId} ''';
    int result = await notificationDB.rawUpdate(sql);
  }

}