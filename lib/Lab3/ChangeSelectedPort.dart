import 'package:flutter/material.dart';

import 'Data.dart';

class ChangeSelectedPort extends StatefulWidget {
  final Port port; 

  const ChangeSelectedPort({required this.port});

  @override
  _ChangeSelectedPort createState() => _ChangeSelectedPort();
}
class _ChangeSelectedPort extends State<ChangeSelectedPort> {
  String text = "";
  final TextEditingController sumController = TextEditingController(text: '0');
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
            Text(
                "Title ${widget.port.name}"
            ),
            SizedBox(height: 10),
            Text(
                "Adress ${widget.port.address}"
            ),
            SizedBox(height: 10),
            Text(
                "Workers number ${widget.port.numWorkers}"
            ),
            SizedBox(height: 10),
            Text(
               "Number Equipment ${widget.port.numEquipmentUnits}"
            ),
            SizedBox(height: 10),
            Text(
                "Cost per Equipment ${widget.port.costPerEquipmentUnit}"
            ),
            SizedBox(height: 10),
            Text(
                "Servicing cost ${widget.port.servicingCost}"
            ),
            SizedBox(height: 10),
            Text(
                "Servicing time ${widget.port.servicingTime}"
            ),
            SizedBox(height: 10),
            Text(
                "Number docks ${widget.port.numDocks}"
            ),
            SizedBox(width: 32.0),
            ElevatedButton(
              onPressed: () {
               widget.port.incrementDocks();
               setState(() {
               });
              },
              child: Text('Increment docks'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sumController,
                    decoration: InputDecoration(
                      hintText: 'Ships number',
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            Text("Profit$text"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Update the text when the button is pressed
                  text = widget.port.calculateProfits(int.tryParse(sumController.text) ?? 0).toString();
                  text = "Profit: $text";
                });
              },
              child: Text('Profit'),
            ),
            ElevatedButton(
              onPressed: () {
                //widget.port.calculateProfits(widget.port)
                setState(() {
                  text = widget.port.calculateServiceTime(int.tryParse(sumController.text) ?? 0).toString();
                  text = "Service time: $text";
                });
              },
              child: Text('Calculate service time'),
            ),
          ],
        ),
      ),
    );
  }
}
