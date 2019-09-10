import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

Database notificationDB;

class NotificationDBCreator
{
  static const tableName = 'notificationtable';
  static const col_notId = 'notid';
  static const col_title = 'title';
  static const col_subtitle = 'subtitle';
  static const col_content = 'content';
  static const col_posttime = 'posttime';
  static const col_read = 'read';

  Future<void> CreateDatabase(Database db)async
  {
    final String sql = '''CREATE TABLE $tableName (
        $col_notId INTEGER PRIMARY KEY autoincrement, 
        $col_title TEXT,
        $col_subtitle TEXT,
        $col_content TEXT,
        $col_posttime DATETIME,
        $col_read BIT NOT NULL
    ) ''';

    await db.execute(sql);

  }

  Future<String> getDatabasePath(String dbName) async
  {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath,dbName);

    if(await Directory(dirname(path)).exists())
      {

      }
      else
        {
          await Directory(dirname(path)).create(recursive: true);
        }

        return path;
  }

  Future<void> initDatabase()async
  {
    final path = await getDatabasePath("notificationtable");
    notificationDB = await openDatabase(path,version:  1, onCreate: OnCreate);
  }

  Future<void> OnCreate(Database db, int version) async
  {
    await CreateDatabase(db);
  }
}