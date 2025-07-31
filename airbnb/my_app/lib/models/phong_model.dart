class Phong {
  final String namePlace;
  final String description;
  final String date;
  final String price;
  final List<String> images;

  Phong({
    required this.namePlace,
    required this.description,
    required this.date,
    required this.price,
    required this.images,
  });
  factory Phong.fromJson(Map<String, dynamic> json) {
    return Phong(
      namePlace: json['namePlace'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      price: json['price'] as String,
      images: List<String>.from(json['images'] as List),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'namePlace': namePlace,
      'description': description,
      'date': date,
      'price': price,
      'images': images,
    };
  }
}