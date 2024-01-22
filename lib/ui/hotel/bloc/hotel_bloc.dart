import 'package:bloc/bloc.dart';
import 'package:hotel_app/domain/models/hotel_model.dart';
import 'package:hotel_app/domain/services/network_service.dart';
import 'package:meta/meta.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<GetHotelEvent>(_getHotel);
  }

  _getHotel(GetHotelEvent event, Emitter<HotelState> emit) async {
    emit(HotelLoadingState());
    try {
      Hotel? hotel = await NetworkService().getHotel();
      if(hotel == null) {
        emit(HotelErrorState(error: 'Не удалось получить отель'));
      }
      emit(HotelLoadedState(hotel: hotel!));
    } catch (e) {
      emit(HotelErrorState(error: 'Не удалось получить отель'));
    }
  }
}
