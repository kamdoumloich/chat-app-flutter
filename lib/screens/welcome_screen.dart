import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_flutter_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation logo_animation;
  late Animation screen_animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // upperBound: 100.0,
    );

    logo_animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    screen_animation =
        ColorTween(begin: Colors.grey, end: Colors.white).animate(controller);

    controller.forward();

    logo_animation.addStatusListener((status) {});

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
      backgroundColor: screen_animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: logo_animation.value * 100,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                title: 'Register',
                colour: Colors.lightBlue,
                onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
            RoundedButton(
                title: 'Log In',
                colour: Colors.blueAccent,
                onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
