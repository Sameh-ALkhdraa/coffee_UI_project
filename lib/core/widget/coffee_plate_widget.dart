import 'package:flutter/material.dart';
// import 'dart:math';

// import 'package:mini_ui_project/core/resources/colors_and_styles.dart';

// Widget coffeePlate({
//   required double plateSize,
//   required Color plateColor,
//   required double beanSize,
// }) {
//   final double cupOuterSize = plateSize * 0.37;
//   final double coffeeSize = cupOuterSize * 0.83;
//   final double handleWidth = cupOuterSize * 0.27;
//   final double handleHeight = cupOuterSize * 0.12;
//   return SizedBox(
//     width: plateSize,
//     height: plateSize,
//     child: Stack(
//       alignment: Alignment.center,
//       children: [
//         // Plate
//         Container(
//           width: plateSize,
//           height: plateSize,
//           decoration: BoxDecoration(
//             color: plateColor,
//             shape: BoxShape.circle,
//           ),
//         ),
//         // Decorative shadow
//         ClipOval(
//           child: Transform.rotate(
//             angle: -0.4,
//             child: Container(
//               width: plateSize,
//               height: plateSize,
//               color: Colors.black.withValues(alpha: 0.06),
//             ),
//           ),
//         ),
//         // Coffee Beans
//         ...List.generate(12, (index) {
//           final angle = (index * 30) * pi / 180;
//           final radius = plateSize / 2 - beanSize * 1.4;
//           return Positioned(
//             left: plateSize / 2 +
//                 radius * cos(angle) -
//                 beanSize / 2,
//             top: plateSize / 2 +
//                 radius * sin(angle) -
//                 beanSize / 2,
//             child: Transform.rotate(
//               angle: angle + pi / 2,
//               child: Image.asset(
//                 'assets/images/ph_coffee-bean-fill.png',
//                 width: beanSize,
//                 height: beanSize,
//               ),
//             ),
//           );
//         }),
//         // Cup shadow
//         Container(
//           width: cupOuterSize,
//           height: cupOuterSize,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.15),
//                 blurRadius: plateSize * 0.05,
//                 offset: Offset(0, plateSize * 0.015),
//               ),
//             ],
//           ),
//         ),
//         // Cup
//         Container(
//           width: cupOuterSize,
//           height: cupOuterSize,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.circle,
//           ),
//         ),
//         // Coffee
//         Container(
//           width: coffeeSize,
//           height: coffeeSize,
//           decoration: const BoxDecoration(
//             color: coffeeColor,
//             shape: BoxShape.circle,
//           ),
//         ),
//         // Handle
//         Positioned(
//           right: plateSize * 0.20,
//           child: Container(
//             width: handleWidth,
//             height: handleHeight,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(100),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }



Widget coffee({required String imagePath, required Color plateColor, required double imageWidth, required double imageHeight}){
  return Container(
    // clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(
      color: plateColor,
      shape: BoxShape.circle
    ),

    child: Image.asset(imagePath, width: imageWidth, height: imageHeight,),
  );
}

