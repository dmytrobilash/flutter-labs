import 'package:flutter/material.dart';
import 'AddPort.dart';
import 'Data.dart';

class LB3 extends StatefulWidget {
  ListPorts _listPorts = ListPorts();
  @override
  _PortListScreenState createState() => _PortListScreenState();
}

class _PortListScreenState extends State<LB3> {
  late Port _selectedItemForCopying;

  @override
  void initState() {
    super.initState();
    _selectedItemForCopying = widget._listPorts.ports.first.copy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Port List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddPort(listPorts: widget._listPorts)),
                );
              },
              child: Text('Add new port'),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select a port to copy',
              ),
              value: _selectedItemForCopying.name,
              onChanged: (value) {
                setState(() {
                  _selectedItemForCopying = widget._listPorts.getPort(value!).copy();
                });
              },
              items: widget._listPorts.ports.map((item) {
                return DropdownMenuItem<String>(
                  value: item.name,
                  child: Text(item.name),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Port newPort = _selectedItemForCopying.copy();
                widget._listPorts.addPort(newPort);
                print(widget._listPorts.ports);
              },
              child: Text('Add copied port'),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Item',
                    ),
                    value: _selectedItemForCopying.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForCopying.name = value!;
                      });
                    },
                    items: widget._listPorts.ports.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.name,
                        child: Text(item.name),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Second Item',
                    ),
                    value: _selectedItemForCopying.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForCopying.name = value!;
                      });
                    },
                    items: widget._listPorts.ports.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.name,
                        child: Text(item.name),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Compare ports button logic
                  },
                  child: Text('Compare Ports'),
                ),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Item',
                    ),
                    value: _selectedItemForCopying.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForCopying.name = value!;
                      });
                    },
                    items: widget._listPorts.ports.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.name,
                        child: Text(item.name),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Second Item',
                    ),
                    value: _selectedItemForCopying.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForCopying.name = value!;
                      });
                    },
                    items: widget._listPorts.ports.map((item) {
                      return DropdownMenuItem<String>(
                        value: item.name,
                        child: Text(item.name),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Compare ports button logic
                  },
                  child: Text('Compare Ports'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}