import 'package:flutter/material.dart';
class InformationScreen extends StatelessWidget {

  final String userName;
  final String age;

  const InformationScreen({Key? key,  required this.userName, required this.age}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin chi tiết"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: informationCard(userName: userName, age: age) ,
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
