import 'package:flutter/material.dart';
import 'package:mini_ui_project/features/home/banner/model/banner_model.dart';
import 'package:mini_ui_project/features/home/widgets/banner_widgets/banner_card.dart';

class BannerList extends StatelessWidget {
  final List<BannerModel> banners;

  const BannerList({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return BannerCard(
            banner: banners[index],
          );
        },
      ),
    );
  }
}