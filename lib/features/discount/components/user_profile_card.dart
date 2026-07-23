import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';
import 'package:mini_ui_project/core/widget/beans_info.dart';
import 'package:mini_ui_project/core/widget/custom_button.dart';

class UserProfileCard extends StatelessWidget {

  const UserProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: gradient
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              /// User Image + Info
              Row(
                children: [
        
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      currentUser!.image ??
                          "assets/images/person.jpg",
                    ),
                  ),
        
                  const SizedBox(width: 18),
        
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
        
                        Text(
                          currentUser!.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
        
                        const SizedBox(height: 4),
        
                        Text(
                          "${currentUser!.countryCode} ${currentUser!.phoneNumber}",
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: .75),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 25),
        
              BeansInfo(
                beans: currentUser!.numberOfBeans,
              ),
        
              const SizedBox(height: 20),
        
              Text(
                context.t.collectMoreBeansToUnlockCoupons,
                style: const TextStyle(
                  color: discountColor,
                  fontSize: 15,
                ),
              ),
        
              const SizedBox(height: 16),
        
              const Divider(
                color: discountColor,
                thickness: 1,
              ),
        
              const SizedBox(height: 18),
        
              Center(
                child: standardButtonDesign(
                  width: 220,
                  height: 55,
                  buttonColor: darkYellow,
                  buttonName: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
        
                      const Icon(
                        Icons.qr_code_scanner,
                        color: darkGreen,
                        size: 24,
                      ),
        
                      const SizedBox(width: 8),
        
                      Text(
                        context.t.scanMe,
                        style: const TextStyle(
                          color: darkGreen,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}