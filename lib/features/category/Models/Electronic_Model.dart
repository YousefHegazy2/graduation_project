class ElectronicModel {
  final String name;
  final String brand;
  final String model;
  final String condition;
  final int amount;
  final String description;
  final String location;
  final double price;
  final String image;

  ElectronicModel({
    required this.name,
    required this.brand,
    required this.model,
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
      'brand':brand,
      'model':model,
      'condition': condition,
      'amount': amount,
      'description': description,
      'location': location,
      'price': price,
      'image':image
    };
  }
}
