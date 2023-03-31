import 'package:first_lb_flutter/Lab1/Classes.dart';
import 'package:flutter/material.dart';

import 'Logged.dart';

class LB1 extends StatelessWidget {
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: _textController1,
                decoration: InputDecoration(
                  hintText: 'Press Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: _textController2,
                decoration: InputDecoration(
                  hintText: 'Account number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if(Check().checkInput(_textController1.text, _textController2.text)){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Logged()),
                  );
                }
                //BankAccount(ownerName: _textController1.text, accountNumber: _textController2.text, balance: 0);
                // Do something with the text inputs when the button is pressed
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}