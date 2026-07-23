import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/widget/beans_counter.dart';

class BeansInfo extends StatelessWidget {
  final int beans;

  const BeansInfo({
    super.key,
    required this.beans,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Text(context.t.myTotalBeans, style: TextStyle(color: adminColor, fontSize: 15, fontStyle: FontStyle.normal),),
      
          const Spacer(),
      
          BeansCounter(
            beans: beans,
          ),
        ],
      ),
    );
  }
}