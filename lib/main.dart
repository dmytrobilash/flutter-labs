import 'package:flutter/material.dart';
import 'Lab1/LB1.dart';
import 'Lab2/LB2.dart';
import 'Lab3/LB3.dart';
import 'Lab4/LB4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button Demo',
      home: Navigator( // Wrap MaterialApp with a Navigator widget
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лабораторні ПМП'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LB1()),
                );
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200, 60)),
              ),
              child: const Text('ЛР 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LB2()),
                );
              },
              child: Text('ЛР 2'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200, 60)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context) => LB3()),
                );
              },
              child: Text('ЛР 3'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200, 60)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LB4()),
                );
              },
              child: Text('ЛР 4'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200, 60)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
