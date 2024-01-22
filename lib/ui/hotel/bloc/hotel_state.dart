part of 'hotel_bloc.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}

final class HotelLoadingState extends HotelState {}

final class HotelLoadedState extends HotelState {
  HotelLoadedState({
    required this.hotel
  });

  Hotel hotel;
}

final class HotelErrorState extends HotelState {
  HotelErrorState({
    required this.error
  });
  String error;
}
