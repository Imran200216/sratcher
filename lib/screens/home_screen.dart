import 'package:flutter/material.dart';
import 'package:sratcher/constants/colors.dart';
import 'package:sratcher/screens/scratch_card_winning_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// app bar
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 160.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Gamify",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      size: 18,
                      Icons.more_vert,
                      color: AppColors.secondaryColor,
                    ),
                  )
                ],
              ),
              titlePadding: const EdgeInsets.only(
                left: 20,
                bottom: 100,
              ),
              background: Image.asset(
                "assets/images/jpg/planet-bg-2.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// space
          const SliverToBoxAdapter(
            child: SizedBox(height: 20), // Space of 20 pixels
          ),

          /// your reward text
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              height: 40,
              child: const Text(
                'Your rewards',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColors.titleTextColor,
                ),
              ),
            ),
          ),

          /// sliver grid with padding
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Sets the number of columns
                mainAxisSpacing: 10, // Vertical spacing between cards
                crossAxisSpacing: 10, // Horizontal spacing between cards
                childAspectRatio: 1, // Sets the aspect ratio of each card
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ScratchCardWinningScreen();
                        },
                      ));
                    },
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/png/scratcher.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 4, // Specifies 15 scratcher cards
              ),
            ),
          ),
        ],
      ),
    );
  }
}
