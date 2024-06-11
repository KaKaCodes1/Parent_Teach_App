//This page is the onboarding screen and holds the auth screen

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';//this is a dependancy that has what I used to create the onboarding screen
//import 'package:parentteach/screen/login_screen.dart';
import 'package:parentteach/screen/login_screencopy.dart';
//import 'package:parentteach/screen/registration_screen.dart';
import 'package:parentteach/screen/registration_screencopy.dart';
//import 'package:parentteach/screen/solution_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //final PageController _pageController = PageController();

  //These make the done button display the login and register buttons
  bool _showButtons = false;
  bool _donePressed = false;
  void _onDone() {
    setState(() {
      _showButtons = true;
      _donePressed = true;
    });
  }

  // void _onSkip() {
  //   _pageController.jumpToPage(2); // Navigate to the last page (index 2)
  // }

  //styles the login and register buttons
  final ButtonStyle myButtons = ElevatedButton.styleFrom(
    minimumSize: const Size(200, 40), 
    backgroundColor: const Color.fromARGB(255, 249, 249, 207),
    textStyle: const TextStyle(fontWeight: FontWeight.bold),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
      globalBackgroundColor: const Color.fromARGB(255, 254, 230, 119),
      scrollPhysics: const BouncingScrollPhysics(),
      //These are the different pages making up the onboarding screen
      pages: [
        //first page
        PageViewModel(
          titleWidget: const Text(
            'Welcome To The Parent Teach',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
          body: "Hi there dear parent. We are here to help you actively participate in your children's school work.",
          image: Image.asset(
            'assets/images/onboarding2.png',
            width: 400,
            height: 400,
          ),  
        ),

          //second page
          PageViewModel(
          titleWidget: const Text(
            'We Provide You With Resources',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
          body: "We have resources to help you assist your child with the assignments with the use of AI",
          image: Image.asset(
            'assets/images/onboarding3.png',
            width: 400,
            height: 400,
          ),  
        ),

          //third page    
          PageViewModel(
          titleWidget: const Text(
            'Join Us Now',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            ),
      
            image: Image.asset(
            'assets/images/onboarding1.png',
            width: 400,
            height: 400,
          ),

          bodyWidget: Column(
            children: [
           const Text("Discover the Parent Teach App" ,
          ),
      
          AnimatedOpacity(
          opacity: _showButtons ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Visibility(
            visible: _showButtons,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreencopy()),
                );
                  },
                  style: myButtons, 
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color.fromARGB(255, 6, 6, 111),
                    ),
                    ),                  
                  ),

                const SizedBox(
                  height: 10,
                ),  
      
                ElevatedButton(
                  onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationScreencopy()),
                  );
                  }, 
                  style: myButtons, 
                  child: const Text (
                    'Register',
                    style: TextStyle(
                    color: Color.fromARGB(255, 6, 6, 111),
                    ),
                    )
                  ),  
              ],
            ),
            ),
          ),
          ],
          ),  
        ),
      ],
              
      onDone: _onDone,
              

              
      showSkipButton: false,
      //onSkip: _onSkip,              
      // skip: const Text(
      //   'Skip',
      //   style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //     fontSize: 18,
      //     color: Color.fromARGB(255, 6, 6, 111), 
      //   ),
      // ),
              
      done: _donePressed ? const SizedBox.shrink()//Hide the done button when it's pressed
      : const Text(
        'Done',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color.fromARGB(255, 6, 6, 111),
        ),
      ),
              
      next: const Icon(Icons.arrow_forward_rounded),

      //To create the navigation dots        
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20, 10),
        color: Colors.black12,
        activeColor: const Color.fromARGB(255, 6, 6, 111),
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        )
      ),
              ),

    );
  }
}