import 'package:flutter/material.dart';

import 'models/result_model.dart';

class MyAppProvider extends ChangeNotifier {
  int num = 0;
  int numW = 50;
  int numAge = 20;
  double height=100;
  bool isMale = true;
  

List<ResultModel> creatResultsList(){
  List <ResultModel> resultModel = [
       ResultModel(result: isMale == true ? ' MALE' : ' FEMALE', text: 'Gender :',),
                ResultModel ( result: '${height.toInt()}', text: 'Height : '),
                ResultModel(text: 'Weight : ', result: '$numW'),
                ResultModel(text: 'Age : ', result: '$numAge'),
     ];
     List<ResultModel> newResult = [];
  for(int i = 0; i < 4; i++){
   newResult.add(resultModel[i]);
  }
  return newResult;
}


  void changeGenderToMale() {
    isMale = true;
    notifyListeners();
  }

  void changeGenderToFemale() {
    isMale = false;
    notifyListeners();
  }

  void addW() {
    numW++;
    notifyListeners();
  }

  void minW() {
    numW--;
    notifyListeners();
  }

  void addAge() {
    numAge++;
    notifyListeners();
  }

  void minAge() {
    numAge--;
    notifyListeners();
  }

}
