import 'package:bmi_cal/Database/db_helper.dart';
import 'package:bmi_cal/Database/db_plans.dart';
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
     String theDif =  dif.toStringAsPrecision(4);
      DateTime tim = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(tim);

      await DatabaseHelper.instance.insertRecord({DatabaseHelper.columName: bmi, DatabaseHelper.columDiff: theDif,DatabaseHelper.columTime:formattedDate});
     
      
      

      /**
       *  logic will be like first fetch the availabe data if 
       * not null then set differece else set dif =0;
       * 
       */

      
  
}

void insertPlan(String title,String time,String details) async{

await PlansDatabase.instance.insertRecord({PlansDatabase.columTitle: title,PlansDatabase.columTime:time,PlansDatabase.columDetails: details});

print("inserted");

}
