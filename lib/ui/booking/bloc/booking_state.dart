part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoadingState extends BookingState {}
final class BookingLoadedState extends BookingState {
  Booking booking;
  BookingLoadedState({
    required this.booking
  });
}
final class BookingErrorState extends BookingState {
  String error;
  BookingErrorState({
    required this.error
  });
}

