import 'package:bmi_calculator/models/result_model.dart';
import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  const ResultText({super.key, required this.model});
  final ResultModel model;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.text,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
          Text(
            model.result,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )
        ],
      );
  }
}
