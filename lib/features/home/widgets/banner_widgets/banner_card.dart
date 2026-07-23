import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/home/banner/model/banner_model.dart';

class BannerCard extends StatelessWidget {
  final BannerModel banner;

  const BannerCard({
    super.key,
    required this.banner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            banner.imagePath,
            fit: BoxFit.cover,
          ),

          if (banner.leftWidget != null)
            Positioned(
              left: 15,
              top: 0,
              bottom: 0,
              child: Center(
                child: banner.leftWidget!,
              ),
            ),

          if (banner.rightWidget != null)
            Positioned(
              right: 15,
              top: 0,
              bottom: 0,
              child: Center(
                child: banner.rightWidget!,
              ),
            ),
        ],
      ),
    );
  }
}