import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'check.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "to do list",
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        primaryColor: Color(0xff007AFF),
      ),
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                child: Image.asset(
                  alignment: Alignment.topCenter,
                  'asset/Frame 28 (1).png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 400,
                ),
              ),
              const SizedBox(height: 17),
              Container(
                  width: 274,
                  height: 72,
                  child: const Text(
                    'Task Management &To-Do List',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      //font-family: Lexend Deca;

                      // height: 100,
                    ),
                  )),
              const SizedBox(
                height: 10,
              ), //mainAxisAlignment: MainAxisAlignment.center,
              Container(
                  width: 266,
                  height: 56,
                  child: const Text(
                    'This productive tool is designed to help you better manage your task project-wise conveniently!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      //font-family: Lexend Deca;

                      // height: 100,
                    ),
                  )
                  //mainAxisAlignment: MainAxisAlignment.center,
                  ),

              const SizedBox(
                height: 20,
              ),
              Container(
                width: 331,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff007AFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    // padding: EdgeInsets.all(),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const CheckScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Expanded(
                        child: Text(
                          'Let’s Start',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Color(0xffFFFFFF),
                            //font-family: Lexend Deca;

                            // height: 100,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.fast_forward,
                        color: Colors.white,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
