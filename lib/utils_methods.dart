import 'package:bmi_cal/Database/db_helper.dart';
import 'package:bmi_cal/Database/model.dart';
import 'package:intl/intl.dart';

void insertIntoDatabase(String bmi) async {


      var datalst = await DatabaseHelper.instance.queryDatabase();
      int sz = datalst.length;
      double dif;

      if(sz>0){

      var lst = datalst[sz -1 ];
      String? lastime = lst.name;
       dif = double.parse(bmi) - double.parse(lastime!);
      }else{
        dif = 0.0;
      }
      DateTime tim = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(tim);

      await DatabaseHelper.instance.insertRecord({DatabaseHelper.columName: bmi, DatabaseHelper.columDiff: dif.toString(),DatabaseHelper.columTime:formattedDate});
     
      
      

      /**
       *  logic will be like first fetch the availabe data if 
       * not null then set differece else set dif =0;
       * 
       */

      
  
}


