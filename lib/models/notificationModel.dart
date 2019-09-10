class NotificationModel
{
  int notiId;
  String title;
  String subTitle;
  String content;
  DateTime postTime;
  bool read;

  NotificationModel({this.notiId,this.title,this.subTitle,this.content,this.postTime,this.read});

  NotificationModel.fromJson(Map<String,dynamic> parsedJson)
  {
    if(parsedJson.containsKey('notid'))
      notiId = parsedJson['notid'];

    title = parsedJson['title'];
    subTitle = parsedJson['subtitle'];
    content = parsedJson['content'];
    //print("Debug : 22");
    postTime = DateTime.parse(parsedJson['posttime']);
    //print("Debug : 23");
    read = parsedJson['read']==1?true:false;
  }

}