import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            child: const Row(
                              children: [
                                Icon(Icons.location_on,
                                    color: grayishBrownColor),
                                SizedBox(width: 8),
                                Text(
                                  'Saint Petersburg',
                                  style: TextStyle(
                                    color: Color(0xFFA5957E),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ).animate().fadeIn(duration: 500.ms).slide(
                                begin: Offset(-1, 0),
                                end: Offset(0, 0),
                                duration: 1000.ms,
                              ),
                          const CircleAvatar(
                            radius: 25,
                            child: Icon(Icons.person),
                          )
                              .animate()
                              .fadeIn(duration: 500.ms) // Fade in effect
                              .scale(duration: 1500.ms),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Hi, Marina',
                        style: TextStyle(
                          color: grayishBrownColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "let's select your\nperfect place",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
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
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(32)),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      ListingCard(
                        address: 'Gladkova St., 25',
                        imageUrl:
                            'https://cf.bstatic.com/xdata/images/hotel/max1024x768/543655031.jpg?k=e8edd5b9fde055d0a378f10f04b121ea094d178174717f58ed0554bafa65d312&o=&hp=1',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListingCard(
                              address: 'Trefoleva St., 43',
                              imageUrl:
                                  'https://a0.muscache.com/im/pictures/hosting/Hosting-1105566431715894222/original/a984124c-7503-4454-8f2c-95141789e676.jpeg?im_w=720',
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: ListingCard(
                              address: 'Trefoleva St., 43',
                              imageUrl:
                                  'https://a0.muscache.com/im/pictures/miso/Hosting-1045027151296604859/original/e0b6a72a-ff8f-4786-abf2-bd6eab2a05d5.jpeg?im_w=720',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
