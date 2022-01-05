import 'package:flutter/material.dart';
class TitleWidget extends StatelessWidget {
  final String title;
  final String address;
  final int rate;
  const TitleWidget( {Key? key, required this.title, required this.address, required this.rate,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text(address, style: TextStyle(color: Colors.black26),)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.red,),
                  Text(rate.toString())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
