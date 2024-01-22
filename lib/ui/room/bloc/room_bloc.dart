import 'package:bloc/bloc.dart';
import 'package:hotel_app/domain/models/room_model.dart';
import 'package:hotel_app/domain/services/network_service.dart';
import 'package:meta/meta.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    on<RoomEvent>(_getRooms);
  }

  _getRooms(RoomEvent event, Emitter<RoomState> emit) async {
    emit(RoomLoadingState());
    try {
      List<Room> rooms = await NetworkService().getRooms();
      if(rooms.isEmpty) {
        emit(RoomErrorState(error: 'Не удалось получить комнаты'));
      }
      emit(RoomLoadedState(rooms: rooms));
    } catch (e) {
      emit(RoomErrorState(error: 'Не удалось получить комнаты'));
    }
  }
}
