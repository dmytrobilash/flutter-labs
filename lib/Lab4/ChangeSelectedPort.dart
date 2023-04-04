import 'package:flutter/material.dart';

import 'Data.dart';

class ChangeSelectedPort extends StatefulWidget {
  final Port port; 

  const ChangeSelectedPort({required this.port});

  @override
  _ChangeSelectedPort createState() => _ChangeSelectedPort();
}

class _ChangeSelectedPort extends State<ChangeSelectedPort> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;
  String text = "";
  final TextEditingController sumController = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _rotateAnimation = Tween<double>(begin: 0, end: 2 * 3.14).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is removed from the tree
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Port'),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.rotate(
            angle: _rotateAnimation.value,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
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
            ),
          );
        },
      ),
    );
  }
}
