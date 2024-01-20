import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/colors_consts.dart';
import 'package:hotel_app/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/booking/widgets/bookind_input_info_template_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_price_widget.dart';

class BookingTouristListWidget extends StatefulWidget {
  const BookingTouristListWidget({super.key});

  @override
  State<BookingTouristListWidget> createState() =>
      _BookingTouristListWidgetState();
}

class _BookingTouristListWidgetState extends State<BookingTouristListWidget> {
  List<List<bool>> hasErrors = [
    List.filled(BookingListConsts.touristInfoTitleList.length, false)
  ];
  List<List<String>> infoTourists = [
    List.filled(BookingListConsts.touristInfoTitleList.length, '')
  ];
  List<bool> isOpen = [false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        for (int indexTourist = 0;
            indexTourist < infoTourists.length;
            indexTourist++)
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${BookingListConsts.touristNumberList[indexTourist]} турист',
                        style: BookingTextStyles.tourisButtonTitleTextStyle,
                      ),
                    ),
                    Icon(
                      isOpen[indexTourist] == true
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: BookingColors.touristButtonIconColor,
                      size: 30,
                      weight: 2,
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isOpen[indexTourist] = !isOpen[indexTourist];
                  });
                },
              ),
              if (isOpen[indexTourist] == true)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BookingInputInfoTemplateWidget(
                      hasError: hasErrors[indexTourist][index],
                      title: BookingListConsts.touristInfoTitleList[index],
                      updateError: (value) {
                        setState(() {
                          hasErrors[indexTourist][index] = value;
                        });
                      },
                      updateInfo: (value) {
                        setState(() {
                          infoTourists[indexTourist][index] = value;
                        });
                      },
                    );
                  },
                  itemCount: BookingListConsts.touristInfoTitleList.length,
                ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Добавить туриста',
                    style: BookingTextStyles.tourisButtonTitleTextStyle,
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: BookingColors.touristButtonAddBgColor,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: BookingColors.touristButtonAddIconColor,
                    size: 20,
                    weight: 2,
                  ),
                ),
              ],
            ),
            onPressed: () {
              if(infoTourists.length < 10) {
                setState(() {
                  infoTourists.add(List.filled(
                      BookingListConsts.touristInfoTitleList.length, ''));
                  hasErrors.add(List.filled(
                      BookingListConsts.touristInfoTitleList.length, false));
                  isOpen.add(false);
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Максимальное количество туристов - 10'),
                  )
                );
              }
            },
          ),
        ),
        BookingPriceWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              fixedSize: Size(size.width, 50),
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: BookingColors.buyButtonBgColor,
            ),
            child: const Text(
              'Оплатить',
              style: BookingTextStyles.buyButtonTitleTextStyle,
            ),
            onPressed: () {
              for(int indexTourist = 0; indexTourist < infoTourists.length; indexTourist++) {
                for(int indexInfo = 0; indexInfo < infoTourists[indexTourist].length; indexInfo++) {
                  if(infoTourists[indexTourist][indexInfo] == '') {
                    setState(() {
                      hasErrors[indexTourist][indexInfo] = true;
                    });
                  }
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
