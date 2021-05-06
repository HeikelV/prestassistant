import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:prestassistant/src/pages/initial_setting.dart';

class OnBoardingPage extends StatelessWidget {
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => InitialSetting()),
    );
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        child: IntroductionScreen(
          color: Colors.white,
          globalBackgroundColor: Color(0xff840e5f),
          pages: [
            PageViewModel(
              title: "Welcome to your Prestashop Assistant!!!",
              body: "A simple way for manage your online store",
              image: Center(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset('assets/img1.png', height: 250.0),
              )),
              decoration: buildPageDecoration(),
            ),
            PageViewModel(
              title: "Title of first page",
              body: "Here you can write the description of the page, to explain someting...",
              image: Center(child: Image.asset('assets/img2.png', height: 250.0)),
              decoration: buildPageDecoration(),
            )
          ],
          onDone: () => _onIntroEnd(context),
          onSkip: () => _onIntroEnd(context),
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          //rtl: true, // Display as right-to-left
          skip: const Text('Skip'),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            activeColor: Colors.white,
            color: Colors.white,
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        ),
      );

  PageDecoration buildPageDecoration() {
    return const PageDecoration(
      boxDecoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xff411452),
          Color(0xff840e5f),
        ],
      )),
    );
  }
}
