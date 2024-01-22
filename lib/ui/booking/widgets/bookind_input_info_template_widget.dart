import 'package:flutter/material.dart';
import 'package:hotel_app/utils/consts/bookingConsts/colors_consts.dart';
import 'package:hotel_app/utils/consts/bookingConsts/textstyle_consts.dart';

class BookingInputInfoTemplateWidget extends StatefulWidget {
  final ValueChanged<String> updateInfo;
  final ValueChanged<bool> updateError;
  final bool hasError;
  final String title;
  const BookingInputInfoTemplateWidget({super.key, required this.title, required this.updateInfo, required this.updateError, required this.hasError});

  @override
  State<BookingInputInfoTemplateWidget> createState() => _BookingInputInfoTemplateWidgetState();
}

class _BookingInputInfoTemplateWidgetState extends State<BookingInputInfoTemplateWidget> {
  String inputValue = '';
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          widget.updateError(false);
          widget.updateInfo(inputValue);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
              focusNode: focusNode,
              onChanged: (value) {
                setState(() {
                  inputValue = value;
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  label: Text(
                    widget.title,
                    style: BookingTextStyles.inputPhoneTextStyle,
                  ),
                  fillColor: widget.hasError
                      ? BookingColors.inputErrorColor
                      : BookingColors.inputNotErrorColor,
                  filled: true,
                ),
            ),
    );
  }
}