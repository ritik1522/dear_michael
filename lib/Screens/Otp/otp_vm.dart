import 'dart:async';

import 'package:flutter/material.dart';

import '../../Utils/color.dart';

class OtpVM {

  int otpCodeLength = 6;
  bool isLoadingButton = false;
  bool enableButton = false;
  String otpCode = "";
  String email = "";
  String otpString = "";
  final intRegex = RegExp(r'\d+', multiLine: true);
  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 60);
  TextEditingController otp = TextEditingController();


  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: AppColor.buttonColor, width: 1),
      borderRadius: BorderRadius.circular(20.0),
    );
  }

}