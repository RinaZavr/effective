import 'package:bloc/bloc.dart';
import 'package:hotel_app/domain/models/booking_model.dart';
import 'package:hotel_app/domain/services/network_service.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>(_getBooking);
  }

  _getBooking(BookingEvent event, Emitter<BookingState> emit) async {
    emit(BookingLoadingState());
    try {
      Booking? booking = await NetworkService().getBooking();
      if(booking == null) {
        emit(BookingErrorState(error: 'Не удалось получить бронь'));
      }
      emit(BookingLoadedState(booking: booking!));
    } catch (e) {
      emit(BookingErrorState(error: 'Не удалось получить бронь'));
    }
  }
}
