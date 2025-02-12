import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trendy_fashion/helper/Color.dart';
import 'package:trendy_fashion/screens/settingScreen.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 70.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 60, // Adjust size
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-vector/avatar-profile-icon-flat-style-male-user-profile-vector-illustration-isolated-background-man-profile-sign-business-concept_157943-38764.jpg?semt=ais_hybrid'), // Replace with your image URL
                ),
                // Stack(
                //   children: [
                //     CircleAvatar(
                //       radius: 60, // Adjust size
                //       backgroundImage: NetworkImage(
                //           'https://img.freepik.com/premium-vector/avatar-profile-icon-flat-style-male-user-profile-vector-illustration-isolated-background-man-profile-sign-business-concept_157943-38764.jpg?semt=ais_hybrid'), // Replace with your image URL
                //     ),
                //     Positioned(
                //       bottom: 10,
                //       right: 10,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: Colors.brown,
                //           // Background color for the icon
                //           shape: BoxShape.circle,
                //         ),
                //         padding: EdgeInsets.all(8), // Padding for the icon
                //         child: Icon(
                //           Icons.edit, // Edit Icon
                //           color: Colors.white,
                //           size: 20, // Adjust size as needed
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 0.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Icon(
                                      Icons.person_2_outlined,
                                      color: primaryBrown,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'Your Profile'),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: primaryBrown,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Icon(
                                      Icons.credit_card,
                                      color: primaryBrown,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'Payment Methods'),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: primaryBrown,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Icon(
                                      Icons.assignment,
                                      color: primaryBrown,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'My Orders'),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: primaryBrown,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Settingscreen(),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Icon(
                                        Icons.settings_outlined,
                                        color: primaryBrown,
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: 'Settings'),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: primaryBrown,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Icon(
                                      Icons.error_outline,
                                      color: primaryBrown,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'Help Center'),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: primaryBrown,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Icon(
                                      Icons.lock_outline,
                                      color: primaryBrown,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'Privacy Policy'),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: primaryBrown,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Icon(
                                      Icons.person_add_alt_1_outlined,
                                      color: primaryBrown,
                                    ),
                                  ),
                                ),
                                TextSpan(text: 'Invites Friends'),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                            color: primaryBrown,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          showLogoutDialog(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 0.0, 16.0, 0.0),
                                      child: Icon(
                                        Icons.logout_outlined,
                                        color: primaryBrown,
                                      ),
                                    ),
                                  ),
                                  TextSpan(text: 'Log out'),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: primaryBrown,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey.shade200,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey.shade200,
              ),
              SizedBox(height: 16),
              Text(
                "Are you sure you want to log out?",
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        foregroundColor: primaryBrown,
                        side: BorderSide(color: primaryBrown),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 24.0),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: primaryBrown,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBrown,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 24.0),
                        child: Text(
                          "Yes, Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
