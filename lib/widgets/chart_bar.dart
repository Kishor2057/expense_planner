import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String label;
  double spendAmount;
  double spendAmountPer;
  ChartBar({
    required this.label,
    required this.spendAmount,
    required this.spendAmountPer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('\$${spendAmount.toString()}'),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 60,
            width: 10,
            child: Container(
                child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(
                      color: Colors.grey,
                      width: 10,
                    ),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendAmountPer,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            )),
          ),
          SizedBox(
            height: 4,
          ),
          Text(label),
        ],
      ),
    );
  }
}
