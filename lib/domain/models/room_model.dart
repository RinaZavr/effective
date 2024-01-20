class Room {
  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.imageUrls,
    required this.peculiarities
  });
  final int id;
  final String name;
  final int price;
  final String pricePer;
  final List imageUrls;
  final List peculiarities;

  Room.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      name = json['name'],
      price = json['price'],
      pricePer = json['price_per'],
      imageUrls = json['image_urls'],
      peculiarities = json['peculiarities'];
}