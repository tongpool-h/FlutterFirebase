//This step we extract widgets name OnBoardingWidgets
// Step1 -------------------------------
// final String image, title, description;
// Add final parameter > required this.image, required this.title, required this.description
// Send parameters to OnBoardingWidgets()
// Step2 -------------------------------
// Wrap with PageView.builder() => OnBoardingWidgets()
// Wrap with Column and Expanded for PageView.builder() => OnBoardingWidgets()

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: PageView.builder(
            itemBuilder: (context, index) => const OnBoardingWidgets(
              image: "assets/images/on_boarding_page1.png",
              title: "Find the item you've \nbeen looking for",
              description:
                  "Here you'll see rich variteies of goods, carefully classified for seamless browsing experience.",
            ),
          ),
        ),
      ),
    );
  }
}

class OnBoardingWidgets extends StatelessWidget {
  const OnBoardingWidgets({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 280,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displayLarge,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.displaySmall,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
