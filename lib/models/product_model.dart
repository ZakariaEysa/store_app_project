class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    double price = (json['price'] as num).toDouble();

    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: price,
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating:
          RatingModel.fromJson(json['rating'] ?? {"rate": 12.5, "count": 1}),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;
  RatingModel({
    required this.rate,
    required this.count,
  });
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    double rate = (json['rate'] as num).toDouble();

    return RatingModel(
      rate: rate,
      count: json['count'],
    );
  }
}
