class Hotel {
  Hotel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel
  });
  final int id;
  final String name;
  final String adress;
  final int minimalPrice;
  final String priceForIt;
  final int rating;
  final String ratingName;
  final List imageUrls;
  final Map<String, dynamic> aboutTheHotel;

  Hotel.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      name = json['name'],
      adress = json['adress'],
      minimalPrice = json['minimal_price'],
      priceForIt = json['price_for_it'],
      rating = json['rating'],
      ratingName = json['rating_name'],
      imageUrls = json['image_urls'],
      aboutTheHotel = json['about_the_hotel'];
}