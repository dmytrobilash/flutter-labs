class ListPorts{
  static Port port1 = Port(
  name: "Port1",
  address: "Los Angeles, CA",
  numWorkers: 500,
  numEquipmentUnits: 1000,
  costPerEquipmentUnit: 100.0,
  servicingCost: 50000.0,
  servicingTime: 24,
  numDocks: 10,
  );

  static Port port2 = Port(
  name: "Port2",
  address: "Singapore",
  numWorkers: 1000,
  numEquipmentUnits: 2000,
  costPerEquipmentUnit: 150.0,
  servicingCost: 75000.0,
  servicingTime: 36,
  numDocks: 15,
  );

  static Port port3 = Port(
  name: "Port3",
  address: "Rotterdam, Netherlands",
  numWorkers: 800,
  numEquipmentUnits: 1500,
  costPerEquipmentUnit: 120.0,
  servicingCost: 60000.0,
  servicingTime: 30,
  numDocks: 12,
  );

  static Port port4 = Port(
  name: "Port4",
  address: "Shanghai, China",
  numWorkers: 1200,
  numEquipmentUnits: 2500,
  costPerEquipmentUnit: 180.0,
  servicingCost: 90000.0,
  servicingTime: 42,
  numDocks: 18,
  );

  List<Port> ports = [port1, port2, port3, port4];

  void addPort(Port port) {
    ports.add(port);
  }
  Port getPort(String name) {
    return ports.firstWhere((port) => port.name == name);
  }
}

class Port implements Comparable<Port> {
  String name;
  String address;
  int numWorkers;
  int numEquipmentUnits;
  double costPerEquipmentUnit;
  double servicingCost;
  int servicingTime;
  int numDocks;

  Port({
    required this.name,
    required this.address,
    required this.numWorkers,
    required this.numEquipmentUnits,
    required this.costPerEquipmentUnit,
    required this.servicingCost,
    required this.servicingTime,
    required this.numDocks,
  });

  Port.clone(Port other)
      : name = other.name,
        address = other.address,
        numWorkers = other.numWorkers,
        numEquipmentUnits = other.numEquipmentUnits,
        costPerEquipmentUnit = other.costPerEquipmentUnit,
        servicingCost = other.servicingCost,
        servicingTime = other.servicingTime,
        numDocks = other.numDocks;

  Port copy() {
    return Port.clone(this);
  }

  void incrementDocks() {
    numDocks++;
    numEquipmentUnits += 5;
  }

  @override
  int compareTo(Port other) => numDocks.compareTo(other.numDocks);

  int calculateServiceTime(int numShips) => numShips * servicingTime;

  double calculateProfits(int numShips) =>
      numShips *
          (servicingCost + numEquipmentUnits * costPerEquipmentUnit - numWorkers * 100);

  bool operator >=(int numShips) => numDocks >= (numShips / 5).ceil();
  bool operator <=(int numShips) => numDocks <= (numShips / 5).ceil();
}