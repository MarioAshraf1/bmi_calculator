import 'package:bmi_calculator/models/gender_model.dart';
import 'package:flutter/material.dart';
class Gender extends StatelessWidget {
  const Gender({super.key, required this.model,});
final GenderModel model;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Color(0xFF161527),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(model.icon,size: 50, color: Colors.white,),
          Text(model.text,style: TextStyle(fontSize: 30 ,color: Color(0xFF474657)),),
        ],
      ),
    );
  }
}
