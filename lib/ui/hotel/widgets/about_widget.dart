import 'package:effective/consts/hotelConsts/image_consts.dart';
import 'package:effective/consts/hotelConsts/textstyle_consts.dart';
import 'package:effective/ui/hotel/widgets/about_button_template_widget.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  final Map<String, dynamic> aboutHotel;
  const AboutWidget({super.key, required this.aboutHotel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Об отеле',
                style: HotelTextStyles.aboutTitleTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text(aboutHotel["peculiarities"][0], style: HotelTextStyles.aboutPeculiaritiesTextStyle, textAlign: TextAlign.center,)),
                const SizedBox(width: 28,),
                Expanded(child: Text(aboutHotel["peculiarities"][1], style: HotelTextStyles.aboutPeculiaritiesTextStyle, textAlign: TextAlign.center,)),
              ],
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text(aboutHotel["peculiarities"][2], style: HotelTextStyles.aboutPeculiaritiesTextStyle, textAlign: TextAlign.center,)),
                const SizedBox(width: 28,),
                Expanded(child: Text(aboutHotel["peculiarities"][3], style: HotelTextStyles.aboutPeculiaritiesTextStyle, textAlign: TextAlign.center,)),
              ],
            ),
            const SizedBox(height: 12,),
            Text(aboutHotel["description"], style: HotelTextStyles.aboutDescriptionTextStyle,),
            const SizedBox(height: 16,),
            const AboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonComfortImage, title: 'Комфорт'),
            const AboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonIncludedImage, title: 'Что включено'),
            const AboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonNotIncludedImage, title: 'Что не включено'),
            const SizedBox(height: 16,),
          ],
        ),
      );
  }
}
