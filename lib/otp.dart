import 'dart:math';

import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  // colour code

  Color c1 = Color(0xff2D033B);
  Color c2 = Color(0xff810CA8);
  Color c3 = Color(0xffC147E9);
  Color c4 = Color(0xffE5B8F4);

  // text from textfield
  TextEditingController t1 = TextEditingController();

  // length of otp
  int otpLength = 0;

  // random otp number list
  List rndOTPnumberList = [];

  // otp container
  Container box1 = Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
          width: 2, color: Color(0xff2D033B), style: BorderStyle.solid),
    ),
    //child: Text(rndOTPnumberList[0]),
  );

  /*****************************************************************************************/

  // coding part

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: c1,
          leading: Icon(Icons.all_inclusive, size: 30, color: c4),
          title: Text(
            "OTP Generator",
            style: TextStyle(letterSpacing: 2, color: c4),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.refresh, size: 28, color: c4),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: TextField(
                maxLength: 1,
                controller: t1,
                style: TextStyle(color: c1, letterSpacing: 2),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  label: Text("Enter Total OTP Length..",
                      style: TextStyle(letterSpacing: 2, color: c1)),
                  //labelText: "Enter Total Dice Value ..",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 3,
                      color: c1,
                    ),
                  ),
                ),
              ),
            ),

            // generate button
            InkWell(
              onTap: () {
                var tx = t1.text;
                otpLength = int.parse(tx);
                rndOTPnumberList.clear();
                setState(() {
                  for (int i = 0; i < otpLength; i++) {
                    var rnd = Random();
                    int rndNo = rnd.nextInt(9);
                    rndOTPnumberList.add(rndNo);
                  }
                });
                print(otpLength);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 2, blurRadius: 2)
                  ],
                  color: c1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Generate",
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 2,
                    color: c4, //Color(0xffF5EDED),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(padding: EdgeInsets.all(10),child: box1,),
                // Padding(padding: EdgeInsets.all(10),child: box1,),
                // Padding(padding: EdgeInsets.all(10),child: box1,),
                // Padding(padding: EdgeInsets.all(10),child: box1,),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 2,
                            color: Color(0xff2D033B),
                            style: BorderStyle.solid),
                      ),
                      child: Text("$rndOTPnumberList",
                          style: TextStyle(fontSize: 30, letterSpacing: 4)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: c4,
      ),
    );
  }
}
