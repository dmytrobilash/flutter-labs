import 'package:flutter/material.dart';

import 'Data.dart';

class AddPort extends StatefulWidget {
  final ListPorts listPorts;

  const AddPort({Key? key, required this.listPorts}) : super(key: key);

  @override
  AddPortScreen createState() => AddPortScreen();
}

class AddPortScreen extends State<AddPort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Port'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Port newPort = Port(
                  name: "New Port",
                  address: "New Address",
                  numWorkers: 0,
                  numEquipmentUnits: 0,
                  costPerEquipmentUnit: 0,
                  servicingCost: 0,
                  servicingTime: 0,
                  numDocks: 0,
                );
                widget.listPorts.addPort(newPort);
                Navigator.pop(context);
              },
              child: Text('Add Port'),
            ),
          ],
        ),
      ),
    );
  }
}