import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_base/databases/information_database.dart';
import 'package:state_base/models/information_model.dart';
import 'package:state_base/resources/strings.dart';
import 'package:state_base/resources/widgets/information_card.dart';
import 'package:state_base/resources/widgets/text_input_widget.dart';
import 'package:state_base/views/information_from_sqlite.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
 //1. Tạo State
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 2. mounted = true
  TextEditingController? mathController, litetureController, englishController;
  String averageMark = "Chưa xác định";
  String adjustment = "Chưa xác định";
   // 3. initState  : Khởi tạo State
  bool isFirstLoad = true;

  final db = InformationDatabase();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<Map<String, dynamic>> ? futureMapData;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathController = TextEditingController();
    litetureController = TextEditingController();
    englishController = TextEditingController();
    getInformationFromStorage();
  }
  // 4. loading Dependencies của State Object, context đã sẵn dùng
  // Được dùng để đặt lệnh liên quan đến context trước khi hàm build đc chạy
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  //5. build
  @override
  Widget build(BuildContext context) {
   // if(mounted) print(mounted);
    return Scaffold(
      appBar: AppBar(
        title: Text(STUDENT_ADJUSTMENT),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              TextInputWidget(
                  label: MATH_MARK,
                  hintText: MATH_MARK_INPUT,
                  controller: mathController!),
              TextInputWidget(
                  label: LITETURE_MARK,
                  hintText: LITETURE_MARK_INPUT,
                  controller: litetureController!),
              TextInputWidget(
                  label: ENGLISH_MARK,
                  hintText: ENGLISH_MARK_INPUT,
                  controller: englishController!),
              ElevatedButton(
                child: Text(ADJUSTMENT),
                onPressed: (){
                  setState(() {
                    averageMark = getAverageMark(
                        mathMark: double.parse(mathController!.text),
                        litetureMark: double.parse(litetureController!.text),
                        englishMark: double.parse(englishController!.text)).toStringAsFixed(2);
                    adjustment = getAdjustment(averageMark: double.parse(averageMark));
                  });
                  storeResultIntoStorage(averageMark: double.parse(averageMark), adjustment: adjustment);
                  saveInformationToSQFLiteDB(averageMark: averageMark, adjustment: adjustment);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              isFirstLoad ?
              FutureBuilder<Map<String, dynamic>>(
                  future: futureMapData,
                  builder: (context, snapshot)
              {
                if(snapshot.hasError) return Center(
                  child: Text("Load Data Error"),
                );
                if(!snapshot.hasData) return Center(
                  child: CircularProgressIndicator(),
                );
                Map<String, dynamic> informationMap = snapshot.data!;
                isFirstLoad = false;
                return InformationCard(avarageMark: informationMap["average_mark"], adjustment: informationMap["adjustment"]);

              }):
              InformationCard(avarageMark: averageMark, adjustment: adjustment),
              TextButton(
                child: Text("Show Data From SQFlite"),
                onPressed: (){
                  var route = MaterialPageRoute(builder: (context)=> InformationFromSQLiteScreen());
                  Navigator.push(context, route);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // tính điểm trung bình
  double getAverageMark({required double mathMark, required double litetureMark, required double englishMark }){
    return (mathMark + litetureMark + englishMark)/3;
  }
  // đánh giá
  String getAdjustment({required double averageMark})
  {
    if(averageMark < 5)  return "Không đạt";
    if(averageMark < 8.5)  return "Đạt";
    if(averageMark <= 10)  return "Xuất sắc";
    return "Điểm không hợp lệ";
  }
  //6. update Widget Configuration
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }
  //7. setState : Cập nhật lại State của Widget
  // 8. deactivate : dừng State lại , tự động chạy khi huỷ Widget
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }
  // 9. dispose : Huỷ State
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mathController!.dispose();
    litetureController!.dispose();
    englishController!.dispose();
  }
  //10. mounted = false  ; đánh dấu rằng State này đã bị huỷ hoặc không có

 storeResultIntoStorage({required double averageMark, required String adjustment }) async {
  final SharedPreferences prefs = await _prefs;
  await prefs.setDouble("average_mark", averageMark);
  await prefs.setString("adjustment", adjustment);
}

Future<Map<String, dynamic>?> getInformationFromStorage () async {
  futureMapData = _prefs.then((SharedPreferences prefs) {
  String averageMarkTemp =  (prefs.getDouble("average_mark")??"0").toString() ;
  String adjustmentTemp = prefs.getString("adjustment")??"Chưa xác định";
  return {
    "average_mark": averageMarkTemp,
    "adjustment": adjustmentTemp
  };
});
}

  saveInformationToSQFLiteDB({required String averageMark, required String adjustment}) async {
    InformationModel informationModel = InformationModel(id: null, average_mark: averageMark, adjustment: adjustment);
    print("Saving to SQFLite") ;
    await db.addInformation(informationModel);

  }

}
