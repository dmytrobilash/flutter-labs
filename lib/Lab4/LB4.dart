import 'package:flutter/material.dart';
import 'AddPort.dart';
import 'ChangeSelectedPort.dart';
import 'Data.dart';

class LB4 extends StatefulWidget {
  ListPorts _listPorts = ListPorts();
  @override
  _PortListScreenState createState() => _PortListScreenState();
}

class _PortListScreenState extends State<LB4> {
  late Port _selectedItemForCopying;
  late Port _selectedItemForComparisonLeft;
  late Port _selectedItemForComparisonRight;

  @override
  void initState() {
    super.initState();
    _selectedItemForCopying = widget._listPorts.ports.first;
    _selectedItemForComparisonLeft = widget._listPorts.ports.first;
    _selectedItemForComparisonRight = widget._listPorts.ports.first;
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
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangeSelectedPort(port: _selectedItemForCopying)),
                );
              },
              child: Text('Get port details'),
            ),
            SizedBox(height: 16.0),

            //2
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Item',
                    ),
                    value: _selectedItemForComparisonLeft.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForComparisonLeft = widget._listPorts.getPort(value!);
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
                    value:  _selectedItemForComparisonRight.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForComparisonRight = widget._listPorts.getPort(value!);
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
                    if (_selectedItemForCopying >= 2) {
                      print('The first port can accommodate at least 20 ships, and the second port can accommodate no more than 10 ships.');
                    } else {
                      print('The comparison criteria were not met.');
                    }
                  },
                  child: Text('Compare Ports'),
                ),
              ],
            ),

            //3
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Item',
                    ),
                    value: _selectedItemForComparisonLeft.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForComparisonLeft = widget._listPorts.getPort(value!);
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
                    value:  _selectedItemForComparisonRight.name,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemForComparisonRight = widget._listPorts.getPort(value!);
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
                    int result = _selectedItemForComparisonLeft.compareTo( _selectedItemForComparisonRight);
                    print(result);
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