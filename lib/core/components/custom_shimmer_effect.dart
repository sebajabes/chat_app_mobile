// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// import '../core.dart';

// class CustomShimmerEffect extends StatelessWidget {
//   const CustomShimmerEffect({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: Shimmer(
//         gradient: LinearGradient(
//           colors: [
//             AppColors.white,
//             AppColors.blue.withOpacity(0.5),
//             AppColors.white,
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 10,
//               width: 100,
//             ),
//             const GapHeight(10),
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: 20,
//               width: double.infinity,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
