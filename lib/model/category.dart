class Category {
  final String id;
  final String name;
  final String image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  Category.fromjson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];

  static List<Category> categoryFromJson(List collection) {
    List<Category> categories =
        collection.map((json) => Category.fromjson(json)).toList();
    return categories;
  }
}
