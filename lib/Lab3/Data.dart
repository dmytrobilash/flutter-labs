class Port implements Comparable<Port> {
  String name;
  String address;
  int numWorkers;
  int numEquipmentUnits;
  double costPerUnit;
  double servicingCost;
  int servicingTime;
  int numDocks;

  Port({
    required this.name,
    required this.address,
    required this.numWorkers,
    required this.numEquipmentUnits,
    required this.costPerUnit,
    required this.servicingCost,
    required this.servicingTime,
    required this.numDocks,
  });

  Port.clone(Port other)
      : name = other.name,
        address = other.address,
        numWorkers = other.numWorkers,
        numEquipmentUnits = other.numEquipmentUnits,
        costPerUnit = other.costPerUnit,
        servicingCost = other.servicingCost,
        servicingTime = other.servicingTime,
        numDocks = other.numDocks;

  void incrementDocks() {
    numDocks++;
    numEquipmentUnits += 5;
  }

  @override
  int compareTo(Port other) => numDocks.compareTo(other.numDocks);

  int calculateServiceTime(int numShips) => numShips * servicingTime;

  double calculateProfits(int numShips) =>
      numShips *
          (servicingCost + numEquipmentUnits * costPerUnit - numWorkers * 100);

  bool operator >=(int numShips) => numDocks >= (numShips / 5).ceil();
  bool operator <=(int numShips) => numDocks <= (numShips / 5).ceil();
}