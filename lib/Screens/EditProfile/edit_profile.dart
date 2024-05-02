import 'package:flutter/material.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../Utils/Routes/routes_name.dart';
import '../../Utils/buttons.dart';
import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.appBarBackground,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText("Profile", 18, AppColor.whiteColor, TextAlign.start),
                  Row(
                    children: [
                      MediumText("Home / Profile ", 15, AppColor.whiteColor, TextAlign.start),
                      MediumText("/ Edit Profile", 15, AppColor.buttonColor, TextAlign.start)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30,),
              Image.asset("assets/images/user_image.png",height: 100,width: 100,),
              const SizedBox(
                height: 50,
              ),

              ///--------------------------------Full name--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Full name", 15, AppColor.whiteColor, TextAlign.start),
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
                    hintText: 'Enter Full name',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ///--------------------------------Email--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Email", 15, AppColor.whiteColor, TextAlign.start),
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
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///--------------------------------Date of birth--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Date of birth", 15, AppColor.whiteColor, TextAlign.start),
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
                    hintText: 'Enter Date of birth',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ///--------------------------------Gender--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Gender", 15, AppColor.whiteColor, TextAlign.start),
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
                    suffixIcon: Icon(Icons.arrow_drop_down),
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
                    hintText: 'Enter Gender',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///--------------------------------Bio--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Bio", 15, AppColor.whiteColor, TextAlign.start),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 5,
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
                    hintText: 'Enter Bio',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),


              ///--------------------------------Favorite jordan memory--------------------------
              SizedBox(
                  width: width,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MediumText("Favorite jordan memory", 15, AppColor.whiteColor, TextAlign.start),
                  )),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 5,
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
                    hintText: 'Enter 0 to 160 character',
                    hintStyle: TextStyle(
                        color: AppColor.hintColor,
                        fontSize: 13
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///--------------------------------Button--------------------------

              SizedBox(
                width: width,
                height: 50,
                child: RoundedButton(
                    text: "Update Profile",
                    color: AppColor.whiteColor,
                    buttonColor: AppColor.buttonColor,
                    radios: 30,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.mainScreen);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
