part of 'room_bloc.dart';

@immutable
sealed class RoomEvent {}

class GetRoomsEvent extends RoomEvent {}