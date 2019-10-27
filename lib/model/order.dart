import 'package:foodie/model/food.dart';

class Order {
  final String id;
  final String foodId;
  final double amount;
  final String destination;
  final String date;
  final bool isDelivered;
  final String customerId;
  final Food foodOrdered;

  Order(
      {this.id,
      this.foodId,
      this.amount,
      this.destination,
      this.date,
      this.isDelivered,
      this.customerId,
      this.foodOrdered});

  Order.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        foodId = json["foodId"],
        amount = double.parse(json["amount"].toString()),
        destination = json["destination"],
        date = json["date"],
        isDelivered = json["isDelivered"].toString().toString() == "true",
        customerId = json["customerId"],
        foodOrdered = Food.fromjson(json["foodOrdered"]);

  static List<Order> ordersFromJson(List collection) {
    List<Order> foods = collection.map((json) => Order.fromjson(json)).toList();
    return foods;
  }
}
