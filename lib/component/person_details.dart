import 'package:bmi_calculator/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({
    super.key,
    required this.text,
    required this.num,
  });
final String text;
final int num;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyAppProvider>(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF161527),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Color(0xFF3E3D4F), fontSize: 25),
            ),
            Text(
              "${text == 'Weight' ? provider.numW : provider.numAge}",
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    heroTag: null,
                    foregroundColor: Colors.black,
                    mini: true,
                    backgroundColor: const Color(0xffEBDDFF),
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      text == 'Weight' ? provider.minW() : provider.minAge();
                    }),
                const SizedBox(
                  width: 5,
                ),
                FloatingActionButton(
                    heroTag: null,
                    mini: true,
                    backgroundColor: const Color(0xffEBDDFF),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    onPressed: () {
                    
                     text == 'Age' ? provider.addAge() : provider.addW();
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
