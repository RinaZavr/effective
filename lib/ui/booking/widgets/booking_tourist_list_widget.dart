import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/bookingConsts/colors_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/string_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/booking/widgets/bookind_input_info_template_widget.dart';
import 'package:hotel_app/ui/booking/widgets/booking_price_widget.dart';

class BookingTouristListWidget extends StatefulWidget {
  final String? phone;
  final String? email;
  final bool? hasErrorPhone;
  final bool? hasErrorEmail;
  final ValueChanged<bool?> setErrorPhone;
  final ValueChanged<bool?> setErrorEmail;
  final int tourPrice;
  final int fuelCharge;
  final int serviceCharge;
  const BookingTouristListWidget(
      {super.key,
      required this.phone,
      required this.email,
      required this.setErrorPhone,
      required this.setErrorEmail,
      required this.hasErrorPhone,
      required this.hasErrorEmail,
      required this.tourPrice,
      required this.fuelCharge,
      required this.serviceCharge});

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
  bool isError = false;

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
                        BookingListConsts.touristNumberList[indexTourist],
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
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
                ),
            ],
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              foregroundColor: BookingColors.touristButtonAddForegroundColor,
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    BookingStringConsts.buttonAddTitleString,
                    style: BookingTextStyles.tourisButtonTitleTextStyle,
                  ),
                ),
                Container(
                  width: size.width * 0.07,
                  height: size.width * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: BookingColors.touristButtonAddBgColor,
                  ),
                  child: Icon(
                    Icons.add,
                    color: BookingColors.touristButtonAddIconColor,
                    size: size.width * 0.049,
                    weight: 2,
                  ),
                ),
              ],
            ),
            onPressed: () {
              if (infoTourists.length < 10) {
                setState(() {
                  infoTourists.add(List.filled(
                      BookingListConsts.touristInfoTitleList.length, ''));
                  hasErrors.add(List.filled(
                      BookingListConsts.touristInfoTitleList.length, false));
                  isOpen.add(false);
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(BookingStringConsts.limitErrorTitleString),
                ));
              }
            },
          ),
        ),
        BookingPriceWidget(
          tourPrice: widget.tourPrice,
          fuelCharge: widget.fuelCharge,
          serviceCharge: widget.serviceCharge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              fixedSize: Size(size.width, 50),
              padding: const EdgeInsets.symmetric(vertical: 15),
              backgroundColor: BookingColors.buyButtonBgColor,
            ),
            child: const Text(
              BookingStringConsts.buttonBuyTitleString,
              style: BookingTextStyles.buyButtonTitleTextStyle,
            ),
            onPressed: () {
              isError = false;
              for (int indexTourist = 0;
                  indexTourist < infoTourists.length;
                  indexTourist++) {
                for (int indexInfo = 0;
                    indexInfo < infoTourists[indexTourist].length;
                    indexInfo++) {
                  if (infoTourists[indexTourist][indexInfo] == '') {
                    setState(() {
                      hasErrors[indexTourist][indexInfo] = true;
                      isError = true;
                      isOpen[indexTourist] = true;
                    });
                  }
                }
              }
              if (widget.email == null || widget.phone == null) {
                widget.setErrorEmail(true);
                widget.setErrorPhone(true);
                isError = true;
              } else {
                widget.setErrorEmail(null);
                widget.setErrorPhone(null);
              }
              if (isError == false &&
                  (widget.hasErrorEmail != true &&
                      widget.hasErrorPhone != true)) {
                Navigator.pushNamed(
                  context,
                  '/payment',
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
