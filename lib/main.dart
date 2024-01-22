import 'package:hotel_app/domain/services/network_service.dart';
import 'package:hotel_app/ui/hotel/screens/hotel_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/utils/routs.dart';

void main() {
  GetIt.instance.registerSingleton<NetworkService>(
      NetworkService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HotelMainScreen(),
    );
  }
}
