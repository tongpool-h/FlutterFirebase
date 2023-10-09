import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreenWithOutWidgets extends StatelessWidget {
  const OnBoardingScreenWithOutWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/images/on_boarding_page1.png',
                height: 280,
              ),
              const Spacer(),
              Text(
                "Find the item you've \nbeen looking for",
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
                "Here you'll see rich variteies of goods, carefully classified for seamless browsing experience.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodySmall,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
