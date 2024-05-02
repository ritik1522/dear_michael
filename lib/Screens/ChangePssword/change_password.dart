import 'package:dear_michael/Utils/buttons.dart';
import 'package:flutter/material.dart';

import '../../Utils/Routes/routes_name.dart';
import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: AppColor.whiteColor,)),
        backgroundColor: AppColor.appBarBackground,
        elevation: 0.0,
      ),
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
              const SizedBox(
                height: 50,
              ),

              ///--------------------------------Old password--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Old password", 15, AppColor.whiteColor, TextAlign.start),
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
                    hintText: 'Enter old password',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ///--------------------------------New password--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("New password", 15, AppColor.whiteColor, TextAlign.start),
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
                    hintText: 'Enter new password',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///--------------------------------Confirm new password--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Confirm new password", 15, AppColor.whiteColor, TextAlign.start),
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
                    hintText: 'Enter confirm new password',
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
                    text: "Change Password",
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
