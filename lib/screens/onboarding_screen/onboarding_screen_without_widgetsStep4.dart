//This step we extract widgets name OnBoardingWidgets
// Step1 -------------------------------
// final String image, title, description;
// Add final parameter > required this.image, required this.title, required this.description
// Send parameters to OnBoardingWidgets()
// Step2 -------------------------------
// Wrap with PageView.builder() => OnBoardingWidgets()
// Wrap with Column and Expanded for PageView.builder() => OnBoardingWidgets()
// Step3 -------------------------------
// Add ZiseBox and ElevatedButton
// Change StatelessWidget > StatefulWidget
// Step4 -------------------------------
// Add late PageController _pageController;
// Create initState() and dispose()
// Add properties > controller: _pageController, in PageView.builder()
//ElevatedButton( onPressed: () {
                    //   _pageController.nextPage(
                    //     duration: const Duration(microseconds: 300),
                    //     curve: Curves.ease,
                    //   );
                    // },

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemBuilder: (context, index) => const OnBoardingWidgets(
                    image: "assets/images/on_boarding_page1.png",
                    title: "Find the item you've \nbeen looking for",
                    description:
                        "Here you'll see rich variteies of goods, carefully classified for seamless browsing experience.",
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(microseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.pink),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    )),
              ),
            ],
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
