import 'dart:async';

import 'package:dear_michael/Dialog/email_confirm_dialog.dart';
import 'package:dear_michael/Screens/Otp/otp_vm.dart';
import 'package:dear_michael/Utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

import '../../Utils/Routes/routes_name.dart';
import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  var vm = OtpVM();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    vm.countdownTimer!.cancel();
  }


  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this.vm.otpCode = otpCode;
      if (otpCode.length == vm.otpCodeLength && isAutofill) {
        vm.enableButton = false;
        vm.isLoadingButton = true;
      } else if (otpCode.length == vm.otpCodeLength && !isAutofill) {
        vm.enableButton = true;
        vm.isLoadingButton = false;
      } else {
        vm.enableButton = false;
      }
    });
  }

  void startTimer() {
    vm.countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
    setState(() {

    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = vm.myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        vm.countdownTimer!.cancel();
      } else {
        vm.myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    String strDigits(int n) => n.toString().padLeft(2, '0');
    String seconds = strDigits(vm.myDuration.inSeconds.remainder(60));

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back,color: AppColor.whiteColor,)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_img.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height/5,),
              Image.asset(
                "assets/images/logo.png",
                height: 75,
              ),
              const SizedBox(
                height: 50,
              ),

              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Enter Verification Code", 15, AppColor.whiteColor, TextAlign.start),
                  )),
              const SizedBox(
                height: 20,
              ),
              ///--------------------------------Otp Field--------------------------

              TextFieldPin(
                  textController: vm.otp,
                  autoFocus: true,
                  codeLength: vm.otpCodeLength,
                  alignment: MainAxisAlignment.center,
                  defaultBoxSize: 40.0,
                  margin: 5,
                  selectedBoxSize: 40.0,
                  textStyle: TextStyle(fontSize: 16,color: AppColor.whiteColor),
                  defaultDecoration: vm.pinPutDecoration.copyWith(
                      border: Border.all(color: AppColor.hintColor, width: 1)),
                  selectedDecoration: vm.pinPutDecoration,
                  onChange: (code) {
                    _onOtpCallBack(code, false);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText("Didn't receive code ? ", 12,
                      AppColor.whiteColor, TextAlign.end),
                  BoldTextNormal(
                      (seconds == "00") ? " Resend" : " ${seconds}s",
                      12,
                      AppColor.buttonColor,
                      TextAlign.start)
                ],
              ),
              const SizedBox(
                height: 50,
              ),

              ///--------------------------------Button--------------------------

              SizedBox(
                width: width,
                height: 50,
                child: RoundedButton(
                    text: "Continue",
                    color: AppColor.whiteColor,
                    buttonColor: AppColor.buttonColor,
                    radios: 30,
                    onTap: () {
                     showDialog(context: context, builder: (context)=> const EmailConfirmDialog());
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
