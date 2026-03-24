import 'package:flutter/material.dart';

class StateManagement extends StatefulWidget {
  const StateManagement({super.key});


 

  @override
  State<StateManagement> createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
  int count = 0;

   void CounterApp(){
    setState((){
      count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' increament bar')),
      body: Column(
        children: [
          Text(' counnt : $count'),
          ElevatedButton(
            onPressed: () {
              CounterApp();
            },
            child: Text(' increament'),
          ),
        ],
      ),
    );
  }
}
