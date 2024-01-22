part of 'room_bloc.dart';

@immutable
sealed class RoomState {}

final class RoomInitial extends RoomState {}

final class RoomLoadingState extends RoomState {}
final class RoomLoadedState extends RoomState {
  List<Room> rooms;
  RoomLoadedState({
    required this.rooms
  });
}
final class RoomErrorState extends RoomState {
  String error;
  RoomErrorState({
    required this.error
  });
}


