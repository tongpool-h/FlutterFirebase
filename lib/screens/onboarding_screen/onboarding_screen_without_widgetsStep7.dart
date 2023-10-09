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
// Step5 -------------------------------
// Expanded(
//                 child: PageView.builder(
//                   itemCount: demo_data.length,
//                   controller: _pageController,
//                   itemBuilder: (context, index) => OnBoardingWidgets(
//                     image: demo_data[index].image,
//                     title: demo_data[index].title,
//                     description: demo_data[index].description,
//                   ),
//                 ),
//               ),
// create class Onboard{}
// add final List<Onboard> demo_data = []

// Step6 -------------------------------
// Wrap with Row > SizedBox,ElevatedButton
// Add const Container () and Spacer(),

// Step7 -------------------------------
// Extract Container to DotIndicator() widget
// Add int _pageIndex = 0;
// Add OnChange properties in PageView.builder
// onPageChanged: (index) {
//                     setState(() {
//                       _pageIndex = index;
//                     });
//                   },
// Add List.generate()
//...List.generate(
//   demo_data.length,
//   (index) => Padding(
//     padding: const EdgeInsets.only(right: 4),
//     child: DotIndicator(
//       isActive: index == _pageIndex,
//     ),
//   ),
// ),
//Change Container() at DotIndicator{} to be AnimatedContainer()

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

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
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardingWidgets(
                    image: demo_data[index].image,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    demo_data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
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
                          size: 28,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 16 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.red.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demo_data = [
  Onboard(
    image: "assets/images/on_boarding_page1.png",
    title: "Find the item you've \nbeen looking for",
    description:
        "Here you'll see rich variteies of goods, carefully classified for seamless browsing experience.",
  ),
  Onboard(
    image: "assets/images/on_boarding_page2.png",
    title: "Get those shopping \nbags filled.",
    description:
        "Add any item you want to your cart, or save it on your wishlist.",
  ),
  Onboard(
    image: "assets/images/on_boarding_page3.png",
    title: "Fast and secure \npayment",
    description: "There are many payment options for your ease.",
  ),
  Onboard(
    image: "assets/images/on_boarding_page3.png",
    title: "Fast and secure \npayment",
    description: "There are many payment options for your ease.",
  ),
  Onboard(
    image: "assets/images/on_boarding_page3.png",
    title: "Fast and secure \npayment",
    description: "There are many payment options for your ease.",
  ),
];

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
