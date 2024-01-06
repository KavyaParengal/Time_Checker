
import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {

  int intValue=0;
  String? valueChecker;
  int attemptCounter = 0;
  int correctAnswer = 0;
  Color backClr = Colors.yellow.shade700;

  void checkTimer(){
    if(DateTime.now().second == intValue){
      valueChecker='Success :)';
      attemptCounter++;
      correctAnswer++;
      backClr = Colors.green;
    }
    else{
      valueChecker='Sorry try Again !';
      backClr = Colors.yellow.shade700;
      attemptCounter++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        title: const Text('Time Checker',style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: buildContainer('Current Second', '${DateTime.now().second}', Colors.indigo.shade100, Colors.indigo.shade300)
                ),
                Gap(7),
                Expanded(
                    child: buildContainer('Random Number', '${intValue}', Colors.deepPurple.shade100, Colors.deepPurple.shade300)
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                  color: backClr,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.lime.shade900, width: 2)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 8, right: 8,),
                    child: Text(valueChecker??'Result',style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                    ),),
                  ),
                  Divider(thickness: 1.5, color: Colors.lime.shade900, ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
                    child: Text('Attempts : ${attemptCounter} / ${attemptCounter}',style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                ],
              ),
            ),
            CircularCountDownTimer(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 4,
                duration: 5,
                fillColor: Colors.green,
                ringColor: Colors.grey,
                isReverse: true,
                textFormat: '0:00',
            ),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    intValue = Random().nextInt(60);
                    //print(intValue);
                    checkTimer();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Click',style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Container buildContainer(String title, String data, Color backColor, Color borderColor) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
              decoration: BoxDecoration(
                color: backColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: borderColor, width: 2)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 8, right: 8,),
                    child: Text(title,style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17
                    ),),
                  ),
                  Divider(thickness: 1.5, color: Colors.grey.shade400, ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12,),
                    child: Text(data,style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),),
                  ),
                ],
              ),
            );
  }
}
