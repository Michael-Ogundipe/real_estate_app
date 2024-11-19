import 'package:flutter/material.dart';

import '../consts/app_style.dart';
import '../consts/colors.dart';
import 'animated_counting_text.dart';

class OfferCards extends StatelessWidget {
  const OfferCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 16, bottom: 36),
            decoration: const BoxDecoration(
              color: orangeColor,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BUY',
                  style: AppStyles.font12Medium,
                ),
                const SizedBox(height: 24),
                AnimatedCountingText(
                  begin: 500,
                  end: 1034,
                  style: AppStyles.font32Bold,
                ),
                Text(
                  'offers',
                  style: AppStyles.font12Medium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 16, bottom: 36),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RENT',
                  style: AppStyles.font12Medium.copyWith(
                    color: grayishBrownColor2,
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedCountingText(
                  begin: 1200,
                  end: 2212,
                  style: AppStyles.font32Bold.copyWith(color: grayishBrownColor),
                ),
                Text(
                  'offers',
                  style: AppStyles.font12Medium.copyWith(
                    color: grayishBrownColor2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
