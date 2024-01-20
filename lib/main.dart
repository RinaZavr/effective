import 'package:hotel_app/domain/services/network_service.dart';
import 'package:hotel_app/ui/hotel/screens/hotel_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.instance.registerSingleton<NetworkService>(NetworkService()); // использовать один экземпяр класса везде
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HotelMainScreen(),
    );
  }
}
