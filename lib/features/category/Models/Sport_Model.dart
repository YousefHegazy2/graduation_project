class SportModel {
  final String name;
  final String condition;
  final int amount;
  final String description;
  final String location;
  final double price;
  final String image;

  SportModel({
    required this.name,
    required this.condition,
    required this.amount,
    required this.description,
    required this.location,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'condition': condition,
      'amount': amount,
      'description': description,
      'location': location,
      'price': price,
      'image':image
    };
  }
}
