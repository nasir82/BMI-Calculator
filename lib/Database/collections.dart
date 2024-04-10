import 'package:bmi_cal/Database/db_helper.dart';


class DataCollection{

  static var datas =  DatabaseHelper.instance.queryDatabase();
  
}
