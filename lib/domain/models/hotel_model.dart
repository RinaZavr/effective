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

/*
{
 "id": 1,
 "name": "Лучший пятизвездочный отель в Хургаде, Египет",
 "adress": "Madinat Makadi, Safaga Road, Makadi Bay, Египет",
 "minimal_price": 134268,
 "price_for_it": "За тур с перелётом",
 "rating": 5,
 "rating_name": "Превосходно", 
 "image_urls": ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://media.admagazine.ru/photos/61408b2f4311246f36873963/16:9/w_1280,c_limit/w2000%20-%202020-07-14T164056.159.jpg", "https://travelata.ru/blog/wp-content/uploads/2019/06/Starlight-Convention-Center-Thalasso-Spa.jpg"],
 "about_the_hotel": {
    "description": "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!",
    "peculiarities": ["Бесплатный Wifi на всей территории отеля", "1 км до пляжа", "Бесплатный фитнес-клуб", "20 км до аэропорта"]
    
  }
}
*/