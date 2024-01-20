import 'package:flutter/material.dart';
import 'package:hotel_app/consts/bookingConsts/textstyle_consts.dart';

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
    return TextFormField(
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
                    ? const Color(0x26EB5757)
                    : Colors.white,
                filled: true,
              ),
          );
  }
}