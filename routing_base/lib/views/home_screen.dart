
import 'package:api_base/resources/strings.dart';
import 'package:api_base/views/video_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  var route = MaterialPageRoute(builder: (context) => VideoListScreen());
                  Navigator.push(context, route);
                },
                child: Text(LOAD_VIDEO)),
          ],
        ),
      ),
    );
  }
}


