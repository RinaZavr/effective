import 'package:hotel_app/utils/consts/roomConsts/colors_consts.dart';
import 'package:flutter/material.dart';

class RoomImageCarouselWidget extends StatefulWidget {
  final Size size;
  final List images;
  const RoomImageCarouselWidget(
      {super.key, required this.size, required this.images});

  @override
  State<RoomImageCarouselWidget> createState() =>
      _RoomImageCarouselWidgetState();
}

class _RoomImageCarouselWidgetState extends State<RoomImageCarouselWidget> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: size.height * 0.3,
        child: Stack(
          children: [
            PageView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.images[index],
                  width: widget.size.width,
                  fit: BoxFit.fill,
                ),
              ),
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  selectedImage = index;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                height: size.height * 0.02,
                width: size.width * 0.18,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: RoomColors.imageCarouselBgColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int index = 0; index < widget.images.length; index++)
                        Container(
                          width: size.width * 0.017,
                          height: size.width * 0.017,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedImage == index
                                ? RoomColors.imageCarouselSelectedItemColor
                                : RoomColors.imageCarouselUnselectedItemColor,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
