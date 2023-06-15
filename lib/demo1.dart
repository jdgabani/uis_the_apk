import 'package:flutter/material.dart';

class Demo1Screen extends StatefulWidget {
  const Demo1Screen({Key? key}) : super(key: key);

  @override
  State<Demo1Screen> createState() => _Demo1ScreenState();
}

class _Demo1ScreenState extends State<Demo1Screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          Center(
            child: Container(
              width: double.infinity,color: Colors.green,child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Column(
                  children: [
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),
                    Text('abc'),

                  ],
                ),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
