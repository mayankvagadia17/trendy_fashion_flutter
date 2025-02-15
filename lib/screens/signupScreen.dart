import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_fashion/screens/loginScreen.dart';
import 'package:trendy_fashion/screens/verifyEmailScreen.dart';

import '../helper/Color.dart';
import '../provider/SignupProvider.dart';
import '../widget/appWidget/networkAvailablity.dart';
import '../widget/appWidget/setSnackbarScafold.dart';
import '../widget/appWidget/validation.dart';
import '../widget/appWidget/ButtonDesing.dart';
import '../widget/appWidget/CircularIconButton.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

bool _isLoading = false;

class _signupScreenState extends State<signupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  bool isShowPass = true;
  FocusNode? passFocus, monoFocus, nameFocus = FocusNode();
  late SignupProvider provider;
  bool _isAndroid = false;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<SignupProvider>(context, listen: false);
    _checkAppStatus();
  }

  setStateNow() {
    setState(() {
      _isLoading = false;
      if (provider.isProfileCreated) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => verfyEmailScreen(email: provider.email!),
        ));
      } else {}
    });
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
                              'Create Account',
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
                              'Fill your information below or register\n with your social account.',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                color: black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 24),
                          TextFormField(
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(monoFocus);
                            },
                            style: TextStyle(
                              fontFamily: 'Poppins',
                            ),
                            keyboardType: TextInputType.text,
                            focusNode: nameFocus,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Name',
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
                                StringValidation.validateThisFieldRequered(
                                    val!, context),
                            onSaved: (String? value) {
                              context.read<SignupProvider>().name = value;
                            },
                          ),
                          SizedBox(height: 16),
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
                              context.read<SignupProvider>().email = value;
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
                              context.read<SignupProvider>().password = value;
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isChecked = newValue!;
                                  });
                                },
                                activeColor: primaryBrown,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                },
                                child: Align(
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
                                      'Accept Terms & Conditions',
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
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          AppBtn(
                            title: 'Sign Up',
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
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.6,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => loginScreen(),
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
    if (isChecked) {
      if (validateAndSave()) {
        setState(() {
          _isLoading = true;
        });
        checkNetwork();
      }
    } else {
      setSnackbarScafold(scaffoldMessengerKey, context, "Please accept terms & conditions");
    }
  }

  Future<void> checkNetwork() async {
    isNetworkAvail = await isNetworkAvailable();
    if (isNetworkAvail) {
      provider.CreateUser(
        context,
        scaffoldMessengerKey,
        setStateNow,
      );
    } else {
      Future.delayed(const Duration(seconds: 2)).then(
        (_) async {
          setState(
            () {
              setSnackbarScafold(scaffoldMessengerKey, context, "No internet connection");
            },
          );
        },
      );
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
}