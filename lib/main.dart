import 'package:flutter/material.dart';

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
              child: Text('ЛР 1'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200, 60)),
              ),
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

class LB1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One'),
      ),
      body: Center(
        child: Text('This is Screen One'),
      ),
    );
  }
}

class LB2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
      ),
      body: Center(
        child: Text('This is Screen Two'),
      ),
    );
  }
}

class LB3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Three'),
      ),
      body: Center(
        child: Text('This is Screen Three'),
      ),
    );
  }
}

class LB4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Four'),
      ),
      body: Center(
        child: Text('This is Screen Four'),
      ),
    );
  }
}