class History {
  final String id;
  final String date;
  final String status;
  final String amount;
  final String customerid;
  final String foodid;
  final String description;

  History(this.id, this.date, this.status, this.amount, this.customerid,
      this.foodid, this.description);

  History.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'],
        status = json['status'],
        amount = json['amount'],
        customerid = json['customerid'],
        foodid = json['foodid'],
        description = json['description'];

  static List<History> foodsFromJson(List collection) {
    List<History> userHistory =
        collection.map((json) => History.fromjson(json)).toList();
    return userHistory;
  }
}
