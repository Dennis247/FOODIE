import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  final String date;
  final String amount;
  final String description;
  final String status;
  final Color bgColor;
  final Color statusColor;

  HistoryItem(this.date, this.amount, this.description, this.status,
      this.bgColor, this.statusColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: bgColor),
      padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(description,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              Text(amount,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(date,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold)),
              Text(status,
                  style: TextStyle(
                      color: statusColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}
