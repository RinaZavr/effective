import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:flutter/material.dart';

class AboutButtonTemplateWidget extends StatelessWidget {
  final String image;
  final String title;
  const AboutButtonTemplateWidget(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Image.asset(
        image,
      ),
      title: Text(
        title,
        style: HotelTextStyles.aboutButtonTitleTextStyle,
      ),
      subtitle: const Text(
        'Самое необходимое',
        style: HotelTextStyles.aboutButtonSubtitleTextStyle,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
      ),
    );
  }
}
