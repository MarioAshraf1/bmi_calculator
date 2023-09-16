import 'package:bmi_calculator/component/gender_widget.dart';
import 'package:bmi_calculator/component/person_details.dart';
import 'package:bmi_calculator/models/gender_model.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key,});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final List<GenderModel> modelList = const [
    GenderModel(text: 'MALE', icon: Icons.male),
    GenderModel(text: 'FEMALE', icon: Icons.female),
  ];
 double value=100;
 int num= 50;
 int age= 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000022),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('BMI CALCULATOR'),),

     body: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
      // Row(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: modelList.length,
      //         scrollDirection: Axis.horizontal,
      //         itemBuilder: (context, index) => Gender(model: modelList[index]),),
      //     ),
      //   ],
      // ),

      Expanded(
         child: Container(
margin: EdgeInsets.symmetric(horizontal: 10),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             color: Color(0xFF161527),
           ),
           child: Column(
             children: [
               SizedBox(height: 20,),
             Text('HEIGHT' ,style: TextStyle(color: Color(0xFF4D4C5C) ,fontSize: 25),),
             Spacer(flex: 1,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.baseline,
               textBaseline: TextBaseline.alphabetic,
               children: [
                 Text('${value.toInt()}', style: TextStyle(fontSize: 40 , color: Colors.white),),
                 Text('cm', style: TextStyle(fontSize: 10 , color: Colors.white),),
               ],
             ),
               Slider(
                 thumbColor: Color(0xFFD93558),
                   max: 200,
                   min: 80,
                   activeColor: Colors.white,
                   inactiveColor: Colors.grey,
                   value: value, onChanged: (value){
                  setState(() {
                    this.value=value;
                  });
               }
               ),
               Spacer(flex: 1,)
           ],),
         ),
       ),
      Expanded(
         child:Padding(
           padding: const EdgeInsets.all(10),
           child: Row(
             children: [
               PersonDetails(text: 'WEIGHT', num: num,),
               SizedBox(width: 10,),
               PersonDetails(text: 'AGE', num: age,),
             ],
           ),
         )
       ),

        Container(
          color: Color(0xffD93558),
            width: double.infinity,
          child:   MaterialButton(
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                 return ResultScreen();
               } ));
             }, child: Text('CALCULATE' ,style: TextStyle(color: Colors.white ,fontSize:17 ),)),
)
     ],
     ),
    );
  
  }
}
