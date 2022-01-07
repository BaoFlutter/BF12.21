import 'package:flutter/material.dart';
import 'package:state_base/resources/widgets/text_widget.dart';

import '../strings.dart';
class InformationCard extends StatelessWidget {
  final String avarageMark;
  final String adjustment;

  const InformationCard({Key? key, required this.avarageMark, required this.adjustment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
          child: Column(
            children: [
              Center(
                child: Text(INFORMATION, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              ),
              TextWidget(title: AVERAGE_MARK, content: avarageMark),
              const SizedBox(height: 10),
              TextWidget(title: ADJUSTMENT, content: adjustment)
            ],
          ),
        ),
      ),
    );
  }
}
