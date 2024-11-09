import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scratcher/widgets.dart';
import 'package:confetti/confetti.dart';
import 'package:sratcher/constants/colors.dart';

class ScratchCardWinningScreen extends StatefulWidget {
  const ScratchCardWinningScreen({super.key});

  @override
  State<ScratchCardWinningScreen> createState() =>
      _ScratchCardWinningScreenState();
}

class _ScratchCardWinningScreenState extends State<ScratchCardWinningScreen> {
  late ConfettiController _confettiController; // Confetti controller

  @override
  void initState() {
    super.initState();
    // Initialize the confetti controller
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    // Dispose the confetti controller when no longer needed
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.titleTextColor,
            size: 26,
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// congratulation text
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.titleTextColor,
                ),
              ),
              const SizedBox(height: 20),

              /// description text
              const Text(
                'Here is your scratch card',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4D4D4D),
                ),
              ),
              const Spacer(flex: 1),
              Stack(
                alignment: Alignment.center, // Center items in the Stack
                children: [
                  /// cute circle background
                  SvgPicture.asset(
                    "assets/images/svg/background-circle.svg",
                    height: 380,
                    width: 380,
                    fit: BoxFit.cover,
                    clipBehavior: Clip.none,
                  ),

                  /// scratcher
                  Center(
                    // Center the Scratcher widget
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Scratcher(
                        brushSize: 30,
                        threshold: 50,
                        image: Image.asset(
                          "assets/images/png/scratcher.png",
                          fit: BoxFit.cover,
                        ),
                        onChange: (value) {
                          print("Scratch progress: $value%");
                        },
                        // Trigger confetti when the scratch threshold is reached
                        onThreshold: () {
                          print("Threshold reached, you won!");
                          _confettiController
                              .play(); // Start confetti animation
                        },
                        child: Container(
                          height: 280,
                          width: 280,
                          decoration: const BoxDecoration(
                            color: AppColors.secondaryColor,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFCF3E4),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      "assets/images/svg/award.svg",
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Hey Flutter Dev 😉",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.titleTextColor,
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Nice meeting you!',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4D4D4D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ConfettiWidget to show the confetti animation
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    emissionFrequency: 0.05,
                    numberOfParticles: 50,
                    gravity: 0.1,
                  ),
                ],
              ),
              const Spacer(flex: 1),

              /// rules for scratch card
              const Text(
                'Scratch the above card by swiping on it',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4D4D4D),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
