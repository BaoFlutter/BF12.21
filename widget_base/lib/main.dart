import 'package:flutter/material.dart';
import 'package:widget_base/views/information_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? userNameController, birthYearController;
  String userName = "Chưa xác định";
  String age = "Chưa xác định";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userNameController = TextEditingController();
    birthYearController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin người dùng"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(right: 10, left: 10),
          /*
        child: Center(
          child: Text("Hello World"),
        ),
         */
          child: Column(
            children: [
              textInputWidget(
                  label: "Họ và tên",
                  hintText: "Hãy nhập họ và tên của bạn",
                  controller: userNameController!),
              textInputWidget(
                  label: "Năm sinh",
                  hintText: "Hãy nhập năm sinh của bạn",
                  controller: birthYearController!),
              Center(
                child: ElevatedButton(
                  child: Text("Xác nhận"),
                  onPressed: (){
                   setState(() {
                     userName = userNameController!.text;
                     age = ( DateTime.now().year - int.parse(birthYearController!.text)).toString();
                   });
                  },
                ),
              ),
              informationCard(userName: userName, age: age),
              TextButton(
                child: Text("Chuyển trang"),
                onPressed: (){
                  var route = MaterialPageRoute(builder: (context) => InformationScreen(userName: userName, age: age));
                  Navigator.push(context, route);
                },
              )
            ],
          ),
        ),
      )
    );
  }

  // Textinput Widget
 Widget textInputWidget({ required String label, required String hintText, required TextEditingController controller}){
    return Container(
      //color: Colors.brown,
      //margin: const EdgeInsets.only(top: 15, bottom: 10),
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hintText,
        ),
        controller: controller,
      ),
    );
 }

 Widget informationCard({required String userName, required String age}){
    return Container(
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          child: Column(
            children: [
              Center(
                child: Text("Thông tin", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              ),
              textWidget(title: "Họ và tên:", content: userName),
              const SizedBox(height: 10),
              textWidget(title: "Tuổi:", content: age)
            ],
          ),
        ),
      ),
    );

 }

 Widget textWidget({ required String title, required String content }){
    return Container(
      child: Row(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold), ),
          SizedBox( width: 10,),
          Text(content),
        ],
      ),
    );
 }


}


