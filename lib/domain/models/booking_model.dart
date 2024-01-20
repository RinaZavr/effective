class Booking {
  final int id;
  final String hotelName;
  final String hotelAdress;
  final int hotelRating;
  final String ratingName;
  final String departure;
  final String arrivalCountry;
  final String tourDateStart;
  final String tourDateStop;
  final int numberOfNights;
  final String room;
  final String nutrition;
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;

  Booking.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      hotelName = json['hotel_name'],
      hotelAdress = json['hotel_adress'],
      hotelRating = json['horating'],
      ratingName = json['rating_name'],
      departure = json['departure'],
      arrivalCountry = json['arrival_country'],
      tourDateStart = json['tour_date_start'],
      tourDateStop = json['tour_date_stop'],
      numberOfNights = json['number_of_nights'],
      room = json['room'],
      nutrition = json['nutrition'],
      tourPrice = json['tour_price'],
      fuelCharge = json['fuel_charge'],
      serviceCharge = json['service_charge'];
}