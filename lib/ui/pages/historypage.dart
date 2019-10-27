import 'package:flutter/material.dart';
import 'package:foodie/data/history.dart';
import 'package:foodie/model/history.dart';
import 'package:foodie/ui/widgets/history_item.dart';
import 'package:foodie/ui/widgets/shared/common_cart.dart';
import 'package:foodie/ui/widgets/shared/common_drawer.dart';
import 'package:foodie/utils/const.dart';

class HistoryPage extends StatefulWidget {
  static String routeName = "HistoryPage";

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final TextEditingController _searchControl = new TextEditingController();
  List<History> _history;
  List<History> _filteredHistory;

  getHistoryList() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _filteredHistory.length,
        itemBuilder: (BuildContext context, int index) {
          Color bgColor = index % 2 == 0 ? Color(0xFFF7F7F9) : Colors.white;
          Color statusColor = Colors.black;
          if (_filteredHistory[index].status == Constants.sucessfullStatus) {
            statusColor = Colors.green;
          } else if (_filteredHistory[index].status ==
              Constants.pendingStatus) {
            statusColor = Colors.yellow;
          } else if (_filteredHistory[index].status == Constants.failedStatus) {
            statusColor = Colors.red;
          }
          return HistoryItem(
              _filteredHistory[index].date,
              _filteredHistory[index].amount,
              _filteredHistory[index].description,
              _filteredHistory[index].status,
              bgColor,
              statusColor);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _history = History.foodsFromJson(histories);
    _filteredHistory = _history;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[CartItem("6")],
          elevation: 6.0,
          title: Text(
            "HISTORY",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        drawer: CommonDrawer(),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  elevation: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        hintText: "Search history..",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      maxLines: 1,
                      controller: _searchControl,
                      onChanged: (string) {
                        setState(() {
                          _filteredHistory = _history
                              .where((f) => (f.description
                                      .toLowerCase()
                                      .contains(string.toLowerCase()) ||
                                  f.amount
                                      .toLowerCase()
                                      .contains(string.toLowerCase()) ||
                                  f.date
                                      .toString()
                                      .toLowerCase()
                                      .contains(string.toLowerCase()) ||
                                  f.status
                                      .toLowerCase()
                                      .contains(string.toLowerCase())))
                              .toList();
                        });
                      },
                    ),
                  ),
                ),
                getHistoryList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
