import 'package:flutter/material.dart';
import 'AddPort.dart';
import 'Data.dart';

class LB3 extends StatefulWidget {

  @override
  _PortListScreenState createState() => _PortListScreenState();
}

class _PortListScreenState extends State<LB3> {
  late Port port1;
  late Port port2;
  late Port port3;
  late Port port4;

  @override
  void initState() {
    super.initState();


    port1 = Port(
      name: "Port1",
      address: "Los Angeles, CA",
      numWorkers: 500,
      numEquipmentUnits: 1000,
      costPerEquipmentUnit: 100.0,
      servicingCost: 50000.0,
      servicingTime: 24,
      numDocks: 10,
    );

    port2 = Port(
      name: "Port2",
      address: "Singapore",
      numWorkers: 1000,
      numEquipmentUnits: 2000,
      costPerEquipmentUnit: 150.0,
      servicingCost: 75000.0,
      servicingTime: 36,
      numDocks: 15,
    );

    port3 = Port(
      name: "Port3",
      address: "Rotterdam, Netherlands",
      numWorkers: 800,
      numEquipmentUnits: 1500,
      costPerEquipmentUnit: 120.0,
      servicingCost: 60000.0,
      servicingTime: 30,
      numDocks: 12,
    );

    port4 = Port(
      name: "Port4",
      address: "Shanghai, China",
      numWorkers: 1200,
      numEquipmentUnits: 2500,
      costPerEquipmentUnit: 180.0,
      servicingCost: 90000.0,
      servicingTime: 42,
      numDocks: 18,
    );
  }

  List<Port> ports = [];


  @override
  Widget build(BuildContext context) {
    late String _selectedItem = ports.first.name;
    ports = [port1, port2, port3, port4];

    return Scaffold(
      appBar: AppBar(
        title: Text('Port List'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPort()),
                  );
                },
                child: Text('Add new port'),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select an item',
                  ),
                  value: _selectedItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value!;
                    });
                  },
                  items: ports.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.name,
                      child: Text(item.name),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // Button logic
                },
                child: Text('Button'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select an item',
                  ),
                  value: _selectedItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value!;
                    });
                  },
                  items: ports.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.name,
                      child: Text(item.name),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select an item',
                  ),
                  value: _selectedItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value!;
                    });
                  },
                  items: ports.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.name,
                      child: Text(item.name),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // Compare docs button logic
                },
                child: Text('Compare Docs'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select an item',
                  ),
                  value: _selectedItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value!;
                    });
                  },
                  items: ports.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.name,
                      child: Text(item.name),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select an item',
                  ),
                  value: _selectedItem,
                  onChanged: (value) {
                    setState(() {
                      _selectedItem = value!;
                    });
                  },
                  items: ports.map((item) {
                    return DropdownMenuItem<String>(
                      value: item.name,
                      child: Text(item.name),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(width: 16),
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
    );
  }
}