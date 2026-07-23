import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:mini_ui_project/core/icons/app_icons.dart';
import 'package:mini_ui_project/core/languages/app_localization_extension.dart';
import 'package:mini_ui_project/core/resources/colors_and_styles.dart';
import 'package:mini_ui_project/core/system_users/current_user.dart';

class PaymentCard extends StatelessWidget {
   final VoidCallback? onTap;
  const PaymentCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap?.call();
      },
      child: FlipCard(
        speed: 600,
        fill: Fill.fillBack,
        front: _frontCard(context),
        back: _backCard(context),
      ),
    );
  }

  Widget _frontCard(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        gradient: paymentCardGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [

          Positioned(
            top: -50,
            right: -40,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .08),
              ),
            ),
          ),

          Positioned(
            bottom: -70,
            left: -50,
            child: Container(
              width: 190,
              height: 190,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: .05),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [

                    Icon(
                      AppIcons.sim,
                      color: darkYellow,
                      size: 42,
                    ),

                    const Spacer(),

                    Text(
                      context.t.visa,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                const Text(
                  "1234  5678  9012  3456",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  ),
                ),

                const Spacer(),

                Row(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          context.t.cardHolder,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: .7),
                            fontSize: 11,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          currentUser?.name ?? "",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          context.t.expires,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: .7),
                            fontSize: 11,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "12/29",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _backCard(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        gradient: paymentCardGradient,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [

          Positioned(
            top: 22,
            left: 0,
            right: 0,
            child: Container(
              height: 45,
              color: Colors.black87,
            ),
          ),

          Positioned(
            top: 90,
            left: 20,
            right: 20,
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              color: Colors.white,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "357",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            bottom: 55,
            child: Text(
              "${context.t.authorizedSignatureOnly}\n${context.t.cardProperty}",
              style: TextStyle(
                color: Colors.white.withValues(alpha: .8),
                fontSize: 10,
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 22,
            child: Text(
              context.t.visa,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}