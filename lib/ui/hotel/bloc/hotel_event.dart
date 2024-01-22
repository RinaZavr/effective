part of 'hotel_bloc.dart';

@immutable
sealed class HotelEvent {}

class GetHotelEvent extends HotelEvent {}