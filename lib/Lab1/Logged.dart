import 'package:first_lb_flutter/Lab1/Classes.dart';
import 'package:flutter/material.dart';

class Logged extends StatefulWidget {
  final String name;
  final String number;
  final double balance;
  final BankAccount bn;
  late List<Deposit> depositList;
  Logged({required this.name, required this.number, required this.balance})
      : bn = BankAccount(name, number, balance){
    bn.deposits = List<Deposit>.empty(growable: true);
  }

  @override
  _Logged createState() => _Logged();
}

class _Logged  extends State<Logged> {
  String userInfo = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('You are logged in'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.name,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Number:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.number,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Balance:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.bn.balance.toString(),
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.bn.setOnMoney();
                      });
                    },
                    child: Text('Increase Balance'),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.bn.withdrawMoney();
                      });
                    },
                    child: Text('Decrease Balance'),
                  ),
                ),
              ],
            ),
        SizedBox(height: 16.0),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(widget.bn.balance > 0){
                      widget.bn.openDeposit(Deposit(name: (widget.bn.deposits.length+1).toString(), amount: widget.bn.balance, interestRate: 3));
                      widget.bn.balance = 0;
                    }
                  });
                },
                child: Text('Create Deposit'),
              ),
            ),
            ]
        ),
            SizedBox(height: 16.0),
            Text(
              'Deposits:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.bn.deposits.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Text(
                      widget.bn.deposits[index].toString(),
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(width: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.bn.breakDeposit(index);
                        });
                      },
                      child: Text('Delete'),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userInfo = widget.bn.toString();
                      });
                    },
                    child: Text('Show User Information'),
                  ),
                ),
                ]
            ),
                SizedBox(width: 16.0),
            Text(
              userInfo,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}