import 'package:flutter/material.dart';
class Gender extends StatelessWidget {
  const Gender({super.key, required this.icon, required this.type, required this.color, this.onTap, });

final IconData icon;
final String type;
final Color color;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap ,
        child: Container(
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon , size: 50, color: Colors.white,),
              Text(type,style: const TextStyle(fontSize: 30 ,color: Color(0xFF474657)),),
            ],
          ),
        ),
      ),
    );
  }
}
