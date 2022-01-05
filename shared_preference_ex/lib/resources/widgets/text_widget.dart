import 'package:flutter/material.dart';
class TextWidget extends StatelessWidget {
  final String title;
  final String content;
  const TextWidget({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold), ),
          const SizedBox( width: 10,),
          Text(content),
        ],
      ),
    );
  }
}
