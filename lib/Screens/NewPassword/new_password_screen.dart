import 'package:dear_michael/Utils/buttons.dart';
import 'package:flutter/material.dart';

import '../../Utils/Routes/routes_name.dart';
import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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

              ///--------------------------------Password--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Password", 15, AppColor.whiteColor, TextAlign.start),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 13
                ),

                cursorColor: AppColor.whiteColor,
                decoration:  InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: AppColor.hintColor)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: AppColor.hintColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: AppColor.hintColor)
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    hintText: 'Enter password',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ///--------------------------------Confirm Password--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Confirm password", 15, AppColor.whiteColor, TextAlign.start),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(
                    color: AppColor.whiteColor,
                    fontSize: 13
                ),

                cursorColor: AppColor.whiteColor,
                decoration:  InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: AppColor.hintColor)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: AppColor.hintColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(color: AppColor.hintColor)
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    hintText: 'Enter confirm password',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
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
                      Navigator.pushNamed(context, RoutesName.addProfile);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
