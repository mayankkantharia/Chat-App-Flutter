import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_flash_chat/screens/login_screen.dart';
import 'package:my_flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:my_flash_chat/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

//TickerProviderStateMixin  for multiple tickers
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      upperBound: 1, //for curved animation upper bound has to be 1
    );

    //For curved animation
    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.easeInSine,
    // );

    //for back n forth animation
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FadeInUpBig(
              // from: 200,
              duration: const Duration(seconds: 1),
              child: Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      child: Image.asset('images/logo.png'),
                      height: 60,
                    ),
                  ),
                  Expanded(
                    child: TextLiquidFill(
                      text: 'Flash Chat',
                      loadDuration: const Duration(seconds: 4),
                      waveColor: Colors.red[600]!,
                      boxBackgroundColor: animation.value,
                      textStyle: const TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      // boxHeight: 200.0,
                    ),
                  ),
                  // DefaultTextStyle(
                  //   style: const TextStyle(
                  //     fontSize: 30.0,
                  //     fontWeight: FontWeight.w900,
                  //     color: Colors.black,
                  //   ),
                  //   child: AnimatedTextKit(
                  //     totalRepeatCount: 2,
                  //     animatedTexts: [
                  //       WavyAnimatedText(
                  //         'Flash Chat',
                  //         speed: const Duration(milliseconds: 120),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            FadeInUpBig(
              // from: 200,
              duration: const Duration(seconds: 1),
              child: RoundedButton(
                text: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ),
            FadeInUpBig(
              // from: 200,
              duration: const Duration(seconds: 1),
              child: RoundedButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: () {
                  //Go to registration screen.
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
