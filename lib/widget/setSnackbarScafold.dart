import 'package:flutter/material.dart';

import '../helper/Color.dart';

void setSnackbarScafold(
    GlobalKey<ScaffoldMessengerState> scaffoldKey,
    BuildContext context,
    String msg
    ) {
  scaffoldKey.currentState!.showSnackBar(
    SnackBar(
      content: Text(
        msg,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: black,
        ),
      ),
      duration: const Duration(
        milliseconds: 3000,
      ),
      backgroundColor: lightWhite,
      elevation: 1.0,
    ),
  );
}
