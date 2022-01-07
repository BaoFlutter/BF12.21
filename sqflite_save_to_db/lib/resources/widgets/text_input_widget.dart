import 'package:flutter/material.dart';
class TextInputWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final controller;

  const TextInputWidget({Key? key, required this.label, required this.hintText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
