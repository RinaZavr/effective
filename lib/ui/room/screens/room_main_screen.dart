import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/utils/consts/roomConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/room/bloc/room_bloc.dart';
import 'package:hotel_app/ui/room/widgets/room_content_widget.dart';
import 'package:flutter/material.dart';

class RoomMainScreen extends StatefulWidget {
  final String title;
  const RoomMainScreen({super.key, required this.title});

  @override
  State<RoomMainScreen> createState() => _RoomMainScreenState();
}

class _RoomMainScreenState extends State<RoomMainScreen> {
  late RoomBloc roomBloc;

  @override
  void initState() {
    roomBloc = RoomBloc();
    roomBloc.add(GetRoomsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:Text(
                widget.title,
                style: RoomTextStyles.appBarTextStyle,
              ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => roomBloc,
        child: BlocBuilder<RoomBloc, RoomState>(
          bloc: roomBloc,
          builder: (context, state) {
            if (state is RoomLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RoomErrorState) {
              return Text(state.error);
            }
            if (state is RoomLoadedState) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return RoomContentRoomWidget(room: state.rooms[index]);
                },
                itemCount: state.rooms.length,
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
