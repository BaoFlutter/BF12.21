import 'package:flutter/material.dart';
import 'package:state_base/databases/information_database.dart';
import 'package:state_base/models/information_model.dart';
class InformationFromSQLiteScreen extends StatefulWidget {
  const InformationFromSQLiteScreen({Key? key}) : super(key: key);

  @override
  _InformationFromSQLiteScreenState createState() => _InformationFromSQLiteScreenState();
}

class _InformationFromSQLiteScreenState extends State<InformationFromSQLiteScreen> {
  final db = InformationDatabase();
  Future<List<InformationModel>>? futureInformationList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInformation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông tin"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<InformationModel>>(
          future: futureInformationList,
          builder: (context, snapshot){
            if(snapshot.hasError) return Center(child: Text("Load data error !"),);
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
            List<InformationModel> informations = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: informations.length,
              itemBuilder: (BuildContext context, int index) {
                InformationModel information = informations[index];
                return Container(
                  height: 50,
                  child: Column(
                    children: [
                      Text(information.average_mark!),
                      Text(information.adjustment!)
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
          },
        ),
      ),
    );
  }

  getInformation(){
    futureInformationList = db.fetchAll();
  }


}
