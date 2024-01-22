import 'package:flutter/material.dart';
import 'package:hotel_app/ui/booking/screens/booking_main_screen.dart';
import 'package:hotel_app/ui/hotel/screens/hotel_main_screen.dart';
import 'package:hotel_app/ui/payment/screens/payment_main_screen.dart';
import 'package:hotel_app/ui/room/screens/room_main_screen.dart';

const String hotelRoute = '/hotel';
const String roomRoute = '/room';
const String bookingRoute = '/booking';
const String paymentRoute = '/payment';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case hotelRoute:
        return MaterialPageRoute(
          builder: (_) => const HotelMainScreen(),
          settings: settings,
        );
      case roomRoute:
        return MaterialPageRoute(
          builder: (_) { 
            var args = settings.arguments as Map<String, dynamic>?;
            return RoomMainScreen(title: args?['title']);
          },
          settings: settings,
        );
      case bookingRoute:
        return MaterialPageRoute(
          builder: (_) => const BookingMainScreen(),
          settings: settings,
        );
      case paymentRoute:
        return MaterialPageRoute(
          builder: (_) => const PaymentMainScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'Маршрут не определен для ${settings.name}',
              ),
            ),
          ),
          settings: settings,
        );
    }
  }
}
