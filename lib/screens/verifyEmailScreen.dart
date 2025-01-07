import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:trendy_fashion/provider/VerifyEmailProvider.dart';
import 'package:trendy_fashion/screens/homeScreen.dart';

import '../helper/Color.dart';
import '../widget/ButtonDesing.dart';
import '../widget/networkAvailablity.dart';
import '../widget/setSnackbarScafold.dart';

class verfyEmailScreen extends StatefulWidget {
  final String email;

  const verfyEmailScreen({required this.email});

  @override
  State<verfyEmailScreen> createState() => _verfyEmailScreenState();
}

bool _isLoading = false;

class _verfyEmailScreenState extends State<verfyEmailScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  FocusNode? code1Focus,
      code2Focus,
      code3Focus,
      code4Focus,
      code5Focus,
      code6Focus = FocusNode();
  late Verifyemailprovider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<Verifyemailprovider>(context, listen: false);
  }

  setStateNow() {
    setState(() {
      _isLoading = false;
      if (provider.isProfileVerified) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => homescreen(),
        ));
      } else {}
    });
  }

  setStateResend() {
    setState(() {
      _isLoading = false;
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
                        children: [
                          Image.asset(
                            'assets/images/logo.png', // Replace with your logo URL
                            height: 50,
                          ),
                          SizedBox(height: 40),
                          Container(
                            child: Text(
                              'Verify Code',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: primaryBrown,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Please enter the code we have sent to email',
                            style: TextStyle(
                              fontSize: 13,
                              color: black,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            widget.email,
                            style: TextStyle(
                              fontSize: 13,
                              color: primaryBrown,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 0.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: primaryBrown,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1),
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: primaryBrown),
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
                                    textInputAction: TextInputAction.next,
                                    focusNode: code1Focus,
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(code2Focus);
                                    },
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    onSaved: (String? value) {
                                      context
                                          .read<Verifyemailprovider>()
                                          .code1 = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: primaryBrown,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1),
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: primaryBrown),
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
                                    textInputAction: TextInputAction.next,
                                    focusNode: code2Focus,
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(code3Focus);
                                    },
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    onSaved: (String? value) {
                                      context
                                          .read<Verifyemailprovider>()
                                          .code2 = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: primaryBrown,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1),
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: primaryBrown),
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
                                    textInputAction: TextInputAction.next,
                                    focusNode: code3Focus,
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(code4Focus);
                                    },
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    onSaved: (String? value) {
                                      context
                                          .read<Verifyemailprovider>()
                                          .code3 = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: primaryBrown,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1),
                                    ],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: primaryBrown),
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
                                    textInputAction: TextInputAction.next,
                                    focusNode: code4Focus,
                                    onFieldSubmitted: (V) {
                                      FocusScope.of(context)
                                          .requestFocus(code5Focus);
                                    },
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    onSaved: (String? value) {
                                      context
                                          .read<Verifyemailprovider>()
                                          .code4 = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: primaryBrown,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1),
                                    ],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: primaryBrown),
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
                                    textInputAction: TextInputAction.next,
                                    focusNode: code5Focus,
                                    onFieldSubmitted: (v) {
                                      FocusScope.of(context)
                                          .requestFocus(code6Focus);
                                    },
                                    onSaved: (String? value) {
                                      context
                                          .read<Verifyemailprovider>()
                                          .code5 = value;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    cursorColor: primaryBrown,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(1),
                                    ],
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                    ),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: primaryBrown),
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
                                    textInputAction: TextInputAction.next,
                                    focusNode: code6Focus,
                                    onFieldSubmitted: (v) {
                                      code6Focus!.unfocus();
                                    },
                                    onSaved: (String? value) {
                                      context
                                          .read<Verifyemailprovider>()
                                          .code6 = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Text(
                            'Didn\'t receive the OTP?',
                            style: TextStyle(
                              fontSize: 13,
                              color: black,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.ResendCode(context, widget.email,
                                  scaffoldMessengerKey, setStateResend);
                            },
                            child: Align(
                              alignment: Alignment.center,
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
                                  'Resend Code',
                                  style: TextStyle(
                                    fontFamily: 'Rubik',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: primaryBrown,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          AppBtn(
                            title: 'Verify',
                            onBtnSelected: () async {
                              checkNetwork();
                            },
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

  Future<void> checkNetwork() async {
    final form = _formkey.currentState!;
    form.save();
    isNetworkAvail = await isNetworkAvailable();
    if (isNetworkAvail) {
      provider.VerifyEmail(
          context, widget.email, scaffoldMessengerKey, setStateNow);
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
