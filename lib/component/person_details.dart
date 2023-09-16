import 'package:flutter/material.dart';
class PersonDetails extends StatefulWidget {
   PersonDetails({super.key, required this.text, required this.num, });
     String text;
     int num;

  @override
  State<PersonDetails> createState() => _PersonDetailsState();
}

class _PersonDetailsState extends State<PersonDetails> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF161527),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(widget.text ,style: TextStyle(color: Color(0xFF3E3D4F),fontSize: 25),),
            Text('${widget.num}' , style: TextStyle(fontSize: 30 ,color: Colors.white),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              FloatingActionButton(
                foregroundColor: Colors.black,
                mini: true,
                  backgroundColor: Color(0xffEBDDFF),
                  child: Icon(Icons.remove),
                  onPressed: (){
                    setState(() {
                      widget.num--;
                    });
                  }),
                SizedBox(width: 5,),
                FloatingActionButton(
                  mini: true,
                    backgroundColor: Color(0xffEBDDFF),
                    child: Icon(Icons.add ,color: Colors.black,),
                    onPressed: (){
                      setState(() {
                        widget.num++;
                      });
                    }),
            ],),
        ],),
      ),
    );
  }
}
