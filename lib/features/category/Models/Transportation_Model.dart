class TransportationModel {
  final String name;
  final String transmission;
  final String bodyType;
  final String fuelType;
  final String description;
  final String location;
  final double price;
  final String image;

  TransportationModel({
    required this.name,
    required this.transmission,
    required this.bodyType,
    required this.fuelType,
    required this.description,
    required this.location,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'condition': transmission,
      'bodyType':bodyType,
      'fuelType': fuelType,
      'description': description,
      'location': location,
      'price': price,
      'image':image
    };
  }
}
