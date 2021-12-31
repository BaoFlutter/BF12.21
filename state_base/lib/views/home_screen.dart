import 'package:flutter/material.dart';
import 'package:state_base/resources/strings.dart';
import 'package:state_base/resources/widgets/information_card.dart';
import 'package:state_base/resources/widgets/text_input_widget.dart';



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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mathController = TextEditingController();
    litetureController = TextEditingController();
    englishController = TextEditingController();
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
      body: Container(
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
              },
            ),
            const SizedBox(
              height: 30,
            ),
            InformationCard(avarageMark: averageMark, adjustment: adjustment),
          ],
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


}
