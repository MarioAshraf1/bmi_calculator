import 'dart:math';
import 'package:bmi_calculator/component/gender_widget.dart';
import 'package:bmi_calculator/component/person_details.dart';
import 'package:bmi_calculator/models/gender_model.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({
    super.key,
  });

  final List<GenderModel> modelList = const [
    GenderModel(text: 'MALE', icon: Icons.male),
    GenderModel(text: 'FEMALE', icon: Icons.female),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0xFF000022),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Gender(
                      onTap: () {
                        provider.changeGenderToMale();
                      },
                      icon: Icons.male,
                      type: 'MALE',
                      color: provider.isMale
                          ? const Color(0xffD93559)
                          : const Color(0xff141427)),
                  const SizedBox(
                    width: 10,
                  ),
                  Gender(
                    onTap: () {
                      provider.changeGenderToFemale();
                    },
                    icon: Icons.female,
                    type: 'FEMALE',
                    color: provider.isMale
                        ? const Color(0xff141427)
                        : const Color(0xffD93559),
                  ),
                ],
              ),
            ),
          ),
          ////////////////////////////////////////////////////////////////////////////section2
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFF161527),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'HEIGHT',
                    style: TextStyle(color: Color(0xFF4D4C5C), fontSize: 25),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${provider.height.toInt()}',
                        style:
                            const TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ],
                  ),
                  Slider(
                      thumbColor: const Color(0xFFD93558),
                      max: 200,
                      min: 80,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      value: provider.height,
                      onChanged: (value) {
                        provider.height = value;
                      }),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////////////section3
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                PersonDetails(text: "Weight", num: provider.num),
                const SizedBox(
                  width: 10,
                ),
                PersonDetails(text: "Age", num: provider.num),
              ],
            ),
          )),
          ///////////////////////////////////////////////////////////////////////////////////////bottun
          Container(
            color: const Color(0xffD93558),
            width: double.infinity,
            child: MaterialButton(
                onPressed: () {
                  double result = provider.numW / pow(provider.height/100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResultScreen(result: result, height: provider.height,);
                  }));
                },
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
          )
        ],
      ),
    );
  }
}
