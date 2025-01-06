import 'package:flutter/material.dart';
import 'package:trendy_fashion/helper/Color.dart';
import 'package:trendy_fashion/screens/loginScreen.dart';
import 'package:trendy_fashion/screens/signupScreen.dart';

import '../widget/ButtonDesing.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash_bg.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/welcome_images.png'),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Step into style with',
                    style: TextStyle(
                      fontFamily: 'SourceSans',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: 5,
                    ),
                  ),
                  Text(
                    'Trendy Fashion',
                    style: TextStyle(
                      fontFamily: 'Playfair',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: primaryBrown,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 50),
                  AppBtn(
                    title: 'Let\'s Get Started',
                    onBtnSelected: () async {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => signupScreen(),
                      ));
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => loginScreen(),
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: primaryBrown,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: primaryBrown,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
