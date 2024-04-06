import 'dart:io';

import 'package:bmi_cal/Database/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static const dbName = "mydb.db";
  static const dbVersion = 1;
  static const dbTable = "dbtable";
  static const columId = "id";
  static const columName = "name";
  static const columTime = "time";
  static const columDiff = "diff";
  
  static final DatabaseHelper instance = DatabaseHelper();

  static Database? _database;


  Future<Database?> get database async{

    _database ??= await initDB();
      return _database;
    } 
  

  initDB() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,dbName);
    return await openDatabase(path,version: dbVersion, onCreate: createOn  );

  }
   Future createOn(Database db, int version) async {

    db.execute(
        '''
        CREATE TABLE $dbTable (

          $columId INTEGER PRIMARY KEY,
          $columName TEXT NOT NULL,
          $columTime TEXT,
          $columDiff TEXT
        )

        '''

    );
   }

   // now perform crude operation in the sqflite

   insertRecord(Map<String,dynamic> row ) async{
   Database? db = await instance.database;

       return await db!.insert(dbTable,row);

   }

   Future<List<ListModel > >queryDatabase() async{

    Database? db = await instance.database;
    List<Map<String, dynamic>> results = await db!.query(dbTable);
    return results.map((map) => ListModel.fromMap(map)).toList();
    

   }

   Future<int> UpdateDatabase(Map<String,dynamic> row ) async {
      Database? db = await instance.database;
      int id = row[columId];
      return db!.update(dbTable, row, where: '$columId = ?',whereArgs: [id]);
   }

  Future<int> deleteRow(int id) async{
    Database? db = await instance.database;
    return db!.delete(dbTable,where: '$columId = ?', whereArgs: [id]);
  }
}