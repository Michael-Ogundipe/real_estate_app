import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../consts/app_style.dart';
import '../consts/assets.dart';
import '../consts/colors.dart';
import '../widgets/listing_card.dart';
import '../widgets/offer_cards.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [lightPeachColor, whiteColor],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.0 + MediaQuery.paddingOf(context).top),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on,
                                  color: grayishBrownColor),
                              const SizedBox(width: 8),
                              Text(
                                'Saint Petersburg',
                                style: AppStyles.font16Regular,
                              ),
                            ],
                          ),
                        ).animate().fadeIn(duration: 500.ms).slide(
                              begin: const Offset(-1, 0),
                              end: const Offset(0, 0),
                              duration: 1000.ms,
                            ),
                        const CircleAvatar(
                          radius: 25,
                          child: Icon(Icons.person),
                        )
                            .animate()
                            .fadeIn(duration: 500.ms) // Fade in effect
                            .scale(duration: 1000.ms),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text('Hi, Marina', style: AppStyles.font24Medium)
                        .animate()
                        .fadeIn(
                          delay: 1500.ms,
                          duration: 1000.ms,
                        ),
                    const SizedBox(height: 10),
                    Text(
                      "let's select your\nperfect place",
                      style: AppStyles.font36Regular,
                    )
                        .animate()
                        .fadeIn(delay: 1500.ms, duration: 1000.ms)
                        .slideY(
                          begin: 0.5,
                          end: 0.0,
                          curve: Curves.easeInOut,
                        ),
                    const SizedBox(height: 30),
                    const OfferCards(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                margin: const EdgeInsets.only(bottom: 18),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(32)),
                child:  const Column(
                  children: [
                    ListingCard(
                      address: 'Gladkova St., 25',
                      imageUrl: Assets.image3,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListingCard(
                            address: 'Trefoleva St., 43',
                            imageUrl: Assets.image2,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: ListingCard(
                            address: 'Trefoleva St., 43',
                            imageUrl: Assets.image1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).animate()
                  .fadeIn(
                delay: 3500.ms,
                duration: 1000.ms,
              )
                  .slideY(begin: 1, end: 0, duration: 1000.ms),
            ],
          ),
        ),
      ),
    );
  }
}
