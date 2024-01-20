import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/colors_consts.dart';
import 'package:hotel_app/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';
import 'package:hotel_app/ui/booking/widgets/bookind_input_info_template_widget.dart';

class BookingTouristButtonWidget extends StatefulWidget {
  final ValueChanged<List<String>> updateInfoTourist;
  final ValueChanged<List<bool>> updateErrorsTourist;
  final List<bool> hasErrors;
  const BookingTouristButtonWidget({super.key, required this.updateInfoTourist, required this.hasErrors, required this.updateErrorsTourist});

  @override
  State<BookingTouristButtonWidget> createState() =>
      _BookingTouristButtonWidgetState();
}

class _BookingTouristButtonWidgetState
    extends State<BookingTouristButtonWidget> {
  bool isOpen = false;
  List<String> inputValues =
      List.filled(BookingListConsts.touristInfoTitleList.length, '');
  List<bool> hasErrors = [];
  // late List<FocusNode> focusNodes;

  @override
  void initState() {
  //   focusNodes = List.filled(BookingListConsts.touristInfoTitleList.length, FocusNode());
    hasErrors = widget.hasErrors;
  //   for(FocusNode focus in focusNodes) {
  //     focus.addListener(() {
  //     if (!focus.hasFocus) {
  //       setState(() {
  //         widget.updateErrorsTourist(hasErrors);
  //         widget.updateInfoTourist(inputValues);
  //       });
  //     }
  //   });
  //   }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Первый турист',
                  style: BookingTextStyles.tourisButtonTitleTextStyle,
                ),
              ),
              Icon(
                isOpen == true
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
              isOpen = !isOpen;
            });
          },
        ),
        if (isOpen == true)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BookingInputInfoTemplateWidget(
                hasError: hasErrors[index],
                title: BookingListConsts.touristInfoTitleList[index],
                updateError: (value) {
                  setState(() {
                    hasErrors[index] = value;
                  });
                },
                updateInfo: (value) {
                  setState(() {
                    inputValues[index] = value;
                  });
                },
              );
          },
          itemCount: BookingListConsts.touristInfoTitleList.length,
        ),
      //   Column(
      // children: [
        // for (int index = 0;
        //     index < BookingListConsts.touristInfoTitleList.length;
        //     index++)
        //   TextFormField(
        //     showCursor: false,
        //     focusNode: focusNodes[index],
        //     onChanged: (value) {
        //       setState(() {
        //         hasErrors[index] = false;
        //         inputValues[index] = value;
        //       });
        //     },
        //     onTap: () {
        //       setState(() {
        //         hasErrors[index] = false;
        //       });
        //     },
        //     decoration: InputDecoration(
        //         border: InputBorder.none,
        //         label: Text(
        //           BookingListConsts.touristInfoTitleList[index],
        //           style: BookingTextStyles.inputPhoneTextStyle,
        //         ),
        //         fillColor: hasErrors[index]
        //             ? const Color(0x26EB5757)
        //             : Colors.white,
        //         filled: true),
        //   ),
    //   ],
    // ),
          // BookingTouristInfoWidget(
          //   hasErrors: hasErrors[0],
          //   updateErrorsTourist: (value) {
          //     hasErrors[0] = value;
          //     print(hasErrors);
          //   },
          //   updateInfoTourist: (value) {
          //     infoTourists[0] = value;
          //     print(infoTourists);
          //   },
          // ),
      ],
    );
  }
}
