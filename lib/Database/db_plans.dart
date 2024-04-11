import 'dart:io';

import 'package:bmi_cal/Database/plan_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PlansDatabase{

  static const dbName = "plans.db";
  static const dbVersion = 1;
  static const dbTable = "planstable";
  static const columId = "id";
  static const columTitle = "title";
  static const columTime = "time";
  static const columDetails = "details";
  
  static final PlansDatabase instance = PlansDatabase();

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
          $columTitle TEXT NOT NULL,
          $columTime TEXT,
          $columDetails TEXT
        )

        '''

    );
   }

   // now perform crude operation in the sqflite

   insertRecord(Map<String,dynamic> row ) async{
   Database? db = await instance.database;

       return await db!.insert(dbTable,row);

   }

   Future<List<PlanListModel > >queryDatabase() async{

    Database? db = await instance.database;
    List<Map<String, dynamic>> results = await db!.query(dbTable);
    return results.map((map) => PlanListModel.fromMap(map)).toList();
    

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