import 'package:flutter/material.dart';
class ButtonItem extends StatefulWidget {
  final String text;
  final icon;
  final onPressed;

  const ButtonItem({Key? key, required this.text, required this.icon, required this.onPressed}) : super(key: key);

  @override
  _ButtonItemState createState() => _ButtonItemState();
}

class _ButtonItemState extends State<ButtonItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(widget.icon, color:Colors.blue),
            const SizedBox(
              height: 10,
            ),
            Text(widget.text.toUpperCase(), style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}
