import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';

class DiscountCard extends StatelessWidget {
  final String title;
  final String imagePath;

  final Widget? overlayWidget;

  final double? overlayTop;
  final double? overlayBottom;
  final double? overlayLeft;
  final double? overlayRight;

  const DiscountCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.overlayWidget,
    this.overlayTop,
    this.overlayBottom,
    this.overlayLeft,
    this.overlayRight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 165,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: coffeeCardGradient,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: darkYellow,
              width: 1.5,
            ),
          ),

          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),

                    standardButtonDesign(
                      buttonName: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                context.t.moreInfo,
                                style: TextStyle(
                                  color: darkGreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.keyboard_double_arrow_right,
                                color: darkGreen,
                                size: 18,
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.grey,
                            width: 80,
                            height: 2,
                          )
                        ],
                      ),
                      buttonColor: mediumYellow,
                      width: 115,
                      height: 32,
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),

              const SizedBox(width: 15),

              Image.asset(
                imagePath,
                height: 90,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),

        if (overlayWidget != null)
          Positioned(
            top: overlayTop,
            bottom: overlayBottom,
            left: overlayLeft,
            right: overlayRight,
            child: overlayWidget!,
          ),
      ],
    );
  }
}