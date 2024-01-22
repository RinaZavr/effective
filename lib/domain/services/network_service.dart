import 'package:hotel_app/domain/models/booking_model.dart';
import 'package:hotel_app/domain/models/hotel_model.dart';
import 'package:dio/dio.dart';
import 'package:hotel_app/domain/models/room_model.dart';

class NetworkService {
  final String _address = 'https://run.mocky.io/v3';
  final dio = Dio();

  Future<Hotel?> getHotel() async {
    var response = await dio.get('$_address/75000507-da9a-43f8-a618-df698ea7176d');
    return response.statusCode == 200 ? Hotel.fromJson(response.data) : null;
  }

  Future<List<Room>> getRooms() async {
    var response = await dio.get('$_address/157ea342-a8a3-4e00-a8e6-a87d170aa0a2');
    List<Room> rooms = [];
    if(response.statusCode == 200) {
      for(var room in response.data['rooms']) {
        if(room != null) {
          rooms.add(Room.fromJson(room));
        }
      }
    }
    return rooms;
  }

  Future<Booking?> getBooking() async {
    var response = await dio.get('$_address/63866c74-d593-432c-af8e-f279d1a8d2ff');
    return response.statusCode == 200 ? Booking.fromJson(response.data) : null;
  }
}