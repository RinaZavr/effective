import 'package:hotel_app/utils/consts/hotelConsts/image_consts.dart';
import 'package:hotel_app/utils/consts/hotelConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/hotelConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_about_button_template_widget.dart';
import 'package:hotel_app/ui/hotel/widgets/hotel_peculiarities_row_widget.dart';
import 'package:flutter/material.dart';

class HotelAboutWidget extends StatelessWidget {
  final Map<String, dynamic> aboutHotel;
  const HotelAboutWidget({super.key, required this.aboutHotel});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                HotelStringConsts.aboutTitle,
                style: HotelTextStyles.aboutTitleTextStyle,
              ),
            ),
            HotelPeculiaritiesRowWidget(peculiarities: aboutHotel["peculiarities"],),
            SizedBox(height: size.height * 0.014,),
            Text(aboutHotel["description"], style: HotelTextStyles.aboutDescriptionTextStyle,),
            SizedBox(height: size.height * 0.018,),
            const HotelAboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonComfortImage, title: HotelStringConsts.aboutButtonComfortTitle),
            const HotelAboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonIncludedImage, title: HotelStringConsts.aboutButtonIncludedTitle),
            const HotelAboutButtonTemplateWidget(image: HotelImageConsts.aboutButtonNotIncludedImage, title: HotelStringConsts.aboutButtonNotIncludedTitle),
            SizedBox(height: size.height * 0.018,),
          ],
        ),
      );
  }
}
