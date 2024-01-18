import 'package:effective/domain/models/hotel_model.dart';
import 'package:dio/dio.dart';

class NetworkService {
  final String _address = 'https://run.mocky.io/v3';
  final dio = Dio();

  Future<Hotel?> getHotel() async {
    var response = await dio.get('$_address/75000507-da9a-43f8-a618-df698ea7176d');
    return response.statusCode == 200 ? Hotel.fromJson(response.data) : null;
  }
}