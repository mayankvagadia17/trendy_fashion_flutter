import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_fashion/screens/signupScreen.dart';
import 'package:trendy_fashion/widget/CircularIconButton.dart';

import '../helper/Color.dart';
import '../provider/LoginProvider.dart';
import '../widget/ButtonDesing.dart';
import '../widget/networkAvailablity.dart';
import '../widget/setSnackbarScafold.dart';
import '../widget/validation.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

bool _isLoading = false;

class _loginScreenState extends State<loginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  bool isShowPass = true;
  FocusNode? passFocus, monoFocus = FocusNode();
  late LoginProvider provider;
  bool _isAndroid = false;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<LoginProvider>(context, listen: false);
    _checkAppStatus();
  }

  Future<void> _checkAppStatus() async {
    if (Platform.isAndroid) {
      setState(() {
        _isAndroid = true;
      });
    } else if (Platform.isIOS) {
      setState(() {
        _isAndroid = false;
      });
    }
  }

  setStateNow() {
    setState(() {
      _isLoading = false;
      if (provider.isSuccess) {
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => home(),
        // ));
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        body: _isLoading
            ? Stack(
                children: [
                  Opacity(
                    opacity: 0.3,
                    child:
                        ModalBarrier(dismissible: false, color: Colors.black),
                  ),
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/logo.png', // Replace with your logo URL
                            height: 50,
                          ),
                          SizedBox(height: 40),
                          Container(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: primaryBrown,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            child: Text(
                              'Hi! Welcome back, you\'ve been missed',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                color: black,
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                          TextFormField(
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(passFocus);
                            },
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                            keyboardType: TextInputType.text,
                            focusNode: monoFocus,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: primaryBrown),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                color: primaryBrown,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            validator: (val) =>
                                StringValidation.validateEmail(val!, context),
                            onSaved: (String? value) {
                              context.read<LoginProvider>().email = value;
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                            onFieldSubmitted: (v) {
                              passFocus!.unfocus();
                            },
                            keyboardType: TextInputType.text,
                            obscureText: isShowPass,
                            focusNode: passFocus,
                            textInputAction: TextInputAction.next,
                            validator: (val) => StringValidation.validatePass(
                                val!, context,
                                onlyRequired: true),
                            onSaved: (String? value) {
                              context.read<LoginProvider>().password = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1, color: primaryBrown),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(
                                    () {
                                      isShowPass = !isShowPass;
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 10.0),
                                  child: Icon(
                                    !isShowPass
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 22,
                                  ),
                                ),
                              ),
                              suffixIconConstraints: const BoxConstraints(
                                  minWidth: 40, maxHeight: 20),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                color: primaryBrown,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
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
                                'Forgot Password?',
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
                          SizedBox(height: 16),
                          AppBtn(
                            title: 'Sign In',
                            onBtnSelected: () async {
                              validateAndSubmit();
                            },
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 0.5,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: primaryBrown,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Or"),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 0.5,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: primaryBrown,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          _isAndroid
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularIconButton(
                                      icon: Icons.g_mobiledata,
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircularIconButton(
                                      icon: Icons.facebook,
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularIconButton(
                                      icon: Icons.apple,
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircularIconButton(
                                      icon: Icons.g_mobiledata,
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CircularIconButton(
                                      icon: Icons.facebook,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                          SizedBox(height: 32),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Signup',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => signupScreen(),
                                      ));
                                    },
                                  style: TextStyle(
                                    color: primaryBrown,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      // setState(() {
      //   _isLoading = true;
      // });
      checkNetwork();
    }
  }

  bool validateAndSave() {
    final form = _formkey.currentState!;
    form.save();
    if (form.validate()) {
      return true;
    }
    return false;
  }

  Future<void> checkNetwork() async {
    isNetworkAvail = await isNetworkAvailable();
    if (isNetworkAvail) {
      provider.getLoginUser(
        context,
        scaffoldMessengerKey,
        setStateNow,
      );
    } else {
      Future.delayed(const Duration(seconds: 2)).then(
        (_) async {
          setState(
            () {
              setSnackbarScafold(
                  scaffoldMessengerKey, context, "No internet connection");
            },
          );
        },
      );
    }
  }
}
