import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/list_consts.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';

class BookingTouristInfoWidget extends StatefulWidget {
  final ValueChanged<List<String>> updateInfoTourist;
  final ValueChanged<List<bool>> updateErrorsTourist;
  final List<bool> hasErrors;
  const BookingTouristInfoWidget(
      {super.key,
      required this.updateInfoTourist,
      required this.hasErrors,
      required this.updateErrorsTourist});

  @override
  State<BookingTouristInfoWidget> createState() =>
      _BookingTouristInfoWidgetState();
}

class _BookingTouristInfoWidgetState extends State<BookingTouristInfoWidget> {
  List<String> inputValues =
      List.filled(BookingListConsts.touristInfoTitleList.length, '');
  List<bool> hasErrors = [];
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    focusNodes = List.filled(BookingListConsts.touristInfoTitleList.length, FocusNode());
    hasErrors = widget.hasErrors;
    for(FocusNode focus in focusNodes) {
      focus.addListener(() {
      if (!focus.hasFocus) {
        setState(() {
          widget.updateErrorsTourist(hasErrors);
          widget.updateInfoTourist(inputValues);
        });
      }
    });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int index = 0;
            index < BookingListConsts.touristInfoTitleList.length;
            index++)
          TextFormField(
            showCursor: false,
            focusNode: focusNodes[index],
            onChanged: (value) {
              setState(() {
                hasErrors[index] = false;
                inputValues[index] = value;
              });
            },
            onTap: () {
              setState(() {
                hasErrors[index] = false;
              });
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                label: Text(
                  BookingListConsts.touristInfoTitleList[index],
                  style: BookingTextStyles.inputPhoneTextStyle,
                ),
                fillColor: hasErrors[index]
                    ? const Color(0x26EB5757)
                    : Colors.white,
                filled: true),
          ),
      ],
    );
  }
}
