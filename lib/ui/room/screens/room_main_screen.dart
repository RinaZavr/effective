import 'package:hotel_app/consts/roomConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/room/widgets/room_content_widget.dart';
import 'package:flutter/material.dart';

class RoomMainScreen extends StatefulWidget {
  final String title;
  const RoomMainScreen({super.key, required this.title});

  @override
  State<RoomMainScreen> createState() => _RoomMainScreenState();
}

class _RoomMainScreenState extends State<RoomMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title, style: RoomTextStyles.appBarTextStyle,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const RoomContentRoomWidget();
        },
        itemCount: 2,
      ),
    );
  }
}
