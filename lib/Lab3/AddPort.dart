import 'package:flutter/material.dart';

import 'Data.dart';

class AddPort extends StatefulWidget {
  final ListPorts listPorts;

  const AddPort({Key? key, required this.listPorts}) : super(key: key);

  @override
  AddPortScreen createState() => AddPortScreen();
}

class AddPortScreen extends State<AddPort> {
  final TextEditingController titleController = TextEditingController(text: 'Port N');
  final TextEditingController addressController = TextEditingController(text: 'L. Svobody');
  final TextEditingController numWorkersController = TextEditingController(text: '12');
  final TextEditingController equipmentController = TextEditingController(text: '5');
  final TextEditingController costController = TextEditingController(text: '100');
  final TextEditingController costProcessingController = TextEditingController(text: '1000');
  final TextEditingController proccessingTimeController = TextEditingController(text: '5');
  final TextEditingController numDocsController = TextEditingController(text: '5');

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
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Address',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numWorkersController,
              decoration: InputDecoration(
                hintText: 'Number Workers',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: proccessingTimeController,
              decoration: InputDecoration(
                hintText: 'Processing time',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: 'Address',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: equipmentController,
              decoration: InputDecoration(
                hintText: 'Equipment',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: costController,
              decoration: InputDecoration(
                hintText: 'Cost',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: costProcessingController,
              decoration: InputDecoration(
                hintText: 'Cost Processing',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: numDocsController,
              decoration: InputDecoration(
                hintText: 'Num Docs',
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Port newPort = Port(
                  name: titleController.text,
                  address: addressController.text,
                  numWorkers: int.tryParse(numWorkersController.text)??0,
                  numEquipmentUnits: int.tryParse(equipmentController.text) ?? 0,
                  costPerEquipmentUnit: double.tryParse(costController.text) ?? 0,
                  servicingCost: double.tryParse(costProcessingController.text) ?? 0,
                  servicingTime: int.tryParse(proccessingTimeController.text)??0,
                  numDocks: int.tryParse(numDocsController.text) ?? 0,
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