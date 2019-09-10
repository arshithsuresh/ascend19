import 'dart:async';
import 'package:ascend19/models/notificationModel.dart';
import 'package:ascend19/utils/notificationRepo.dart';

class NotificationStream {
  NotificationStream(){
    print("Getting Notifications");
    addLocalData();
  }

  void addLocalData({limit = 10}) async
  {
    List<NotificationModel> notifications = await NotificationReposistory.getLastWeekNotification(limit: limit);
    _controller.sink.add(notifications);

    notifications = await NotificationReposistory.updateLocalDatabase();
    print(notifications);
    _controller.sink.add(notifications);

  }

  final _controller = StreamController<List<NotificationModel>>();

  Stream<List<NotificationModel>> get stream => _controller.stream;
}


