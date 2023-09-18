import 'package:bmi_calculator/component/result_text.dart';
import 'package:bmi_calculator/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/result_model.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    required this.result,
    super.key,
    required this.height,
  });
  final double result;
  final double height;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    final List<ResultModel> resultModel = [
      ResultModel(
        result: provider.isMale == true ? ' MALE' : ' FEMALE',
        text: 'Gender :',
      ),
      ResultModel(result: '${provider.height.toInt()}', text: 'Height : '),
      ResultModel(text: 'Weight : ', result: '${provider.numW}'),
      ResultModel(text: 'Age : ', result: '${provider.numAge}'),
      ResultModel(result: '$result', text: 'Result = ')
    ];
    return Scaffold(
      backgroundColor: const Color(0xff000022),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '  Your Result',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff161527),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:40.0),
                  child: Center(
                    child: ListView.separated(
                      physics:const BouncingScrollPhysics(),
                      itemCount: resultModel.length,
                      itemBuilder: (context, index) =>
                          ResultText(model: resultModel[index]),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        height: 30,
                      ),
                    ),
                  ),
                )),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            color: const Color(0xffD93558),
            width: double.infinity,
            child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'RE-CALCULATE',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                )),
          )
        ],
      ),
    );
  }
}
