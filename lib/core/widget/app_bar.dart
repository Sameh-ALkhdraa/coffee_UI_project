import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

class StandardAppBar extends StatelessWidget
  implements PreferredSizeWidget {
  final String? title;

  final Widget? leadingWidget;
  final String? profileImage;

  final VoidCallback? onLeadingPressed;
  final VoidCallback? onImagePressed;

  const StandardAppBar({
    super.key,
    this.title,
    this.leadingWidget,
    this.profileImage,
    this.onLeadingPressed,
    this.onImagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: darkGreen,
      elevation: 0,
      centerTitle: true,

      leading: InkWell(
        onTap: onLeadingPressed,
        child: leadingWidget
      ),

      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,

      actions: profileImage != null
          ? [
              InkWell(
                onTap: onImagePressed,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(profileImage!, width: 30, height: 30,)
                ),
              )
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}