import 'package:bmi_cal/Database/db_helper.dart';
import 'package:flutter/material.dart';

class DataCollection{

  static var datas =  DatabaseHelper.instance.queryDatabase();
  
}
