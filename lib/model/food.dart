class Food {
  final String id;
  final String name;
  final String categoryId;
  final double price;
  final String description;
  final String frequency;
  final String img;
  final String rating;

  Food(
      {this.id,
      this.name,
      this.categoryId,
      this.price,
      this.description,
      this.frequency,
      this.img,
      this.rating});

  Food.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        price = double.parse(json['price'].toString()),
        description = json['description'],
        frequency = "",
        img = json['img'],
        categoryId = json['categoryId'],
        rating = json['rating'];

  static List<Food> foodsFromJson(List collection) {
    List foods = collection.map((json) => Food.fromjson(json)).toList();
    return foods;
  }

  static List<Food> getOrderedFood(List<String> foodIds, List<Food> foods) {
    var foodsOrdered = foods.where((Food ofood) => foodIds.contains(ofood.id));
    return foodsOrdered;
  }
}
