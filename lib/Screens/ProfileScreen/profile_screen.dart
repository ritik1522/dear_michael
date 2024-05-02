import 'package:dear_michael/Dialog/followers_dialog.dart';
import 'package:dear_michael/Dialog/following_dialog.dart';
import 'package:dear_michael/Screens/ProfileScreen/profile_vm.dart';
import 'package:dear_michael/Utils/Routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {




  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var profileProvider = Provider.of<ProfileVm>(context,listen: true);

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 10),
          child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("assets/images/logo.png")),
        ),
        backgroundColor: AppColor.appBarBackground,
        elevation: 0.0,
        actions:  [
          GestureDetector(
            onTap: () async {
              var value = await showTopModalSheet<String>(context, Drawer());
            },
            child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(Icons.menu,color: AppColor.whiteColor,)),
          )
        ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoldText("Profile", 18, AppColor.whiteColor, TextAlign.start),
                  Row(
                    children: [
                      MediumText("Home / ", 15, AppColor.whiteColor, TextAlign.start),
                      MediumText("Profile", 15, AppColor.buttonColor, TextAlign.start)
                    ],
                  )
                ],
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  Image.asset("assets/images/user_image.png",height: 100,width: 100,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText("jhondeo@yopmail.com", 12, AppColor.textColor, TextAlign.start),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RoutesName.editProfileScreen);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColor.buttonColor
                          ),
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: MediumText("Edit Profile", 14, AppColor.whiteColor, TextAlign.center),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30,),
              MediumText("Bio", 18, AppColor.whiteColor, TextAlign.start),
              const SizedBox(height: 10,),
              CommonText("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.", 13, AppColor.textColor, TextAlign.start),
              const SizedBox(height: 25,),
              MediumText("Favorite jordan memory", 18, AppColor.whiteColor, TextAlign.start),
              const SizedBox(height: 10,),
              CommonText("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", 13, AppColor.textColor, TextAlign.start),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context)=> const FollowersDialog());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BoldText("12k", 18, AppColor.whiteColor, TextAlign.center),
                          CommonText("Followers", 14, AppColor.whiteColor, TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: (context)=> const FollowingDialog());
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BoldText("12k", 18, AppColor.whiteColor, TextAlign.center),
                          CommonText("Following", 14, AppColor.whiteColor, TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BoldText("12k", 18, AppColor.whiteColor, TextAlign.center),
                        CommonText("Posts", 14, AppColor.whiteColor, TextAlign.center)
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40,),
              Stack(
                children: [
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColor.textColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          profileProvider.clickTab(0);
                        },
                        child: Container(
                          height: 1,
                          width: 80,
                          color: (profileProvider.click == 0)?AppColor.buttonColor:AppColor.textColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          profileProvider.clickTab(1);
                        },
                        child: Container(
                          height: 1,
                          width: 80,
                          color: (profileProvider.click == 1)?AppColor.buttonColor:AppColor.textColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      profileProvider.clickTab(0);
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/posts_icon.png",height: 20,color: (profileProvider.click == 0)?AppColor.buttonColor:AppColor.textColor,),
                          const SizedBox(width: 7,),
                          MediumText("Post", 16, (profileProvider.click == 0)?AppColor.buttonColor:AppColor.textColor, TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      profileProvider.clickTab(1);
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/saved_posts.png",height: 20,color:(profileProvider.click == 1)?AppColor.buttonColor:AppColor.textColor),
                          const SizedBox(width: 7,),
                          MediumText("Saved", 16, (profileProvider.click == 1)?AppColor.buttonColor:AppColor.textColor, TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2 ,
                children: List.generate(50,(index){
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/dummy_img.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget Drawer() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColor.dialogBackColor,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 60,
            margin: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Image.asset("assets/images/logo.png",height: 22,)),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.menu,color: AppColor.whiteColor,)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          ///--------------------------------Home---------------------------------
          Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("Home", 17, AppColor.whiteColor, TextAlign.start)),

          ///--------------------------------Post---------------------------------
          Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("Post", 17, AppColor.whiteColor, TextAlign.start)),

          ///--------------------------------Explore---------------------------------
          Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("Explore", 17, AppColor.whiteColor, TextAlign.start)),

          ///--------------------------------DMP---------------------------------
          Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("DMP", 17, AppColor.whiteColor, TextAlign.start)),

          ///--------------------------------Notifications---------------------------------
          Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("Notifications", 17, AppColor.whiteColor, TextAlign.start)),

          ///--------------------------------Profile---------------------------------
          PopupMenuButton(
            padding: const EdgeInsets.only(left: 50),
            color: AppColor.black,
            onSelected: (value) {
              if(value == "/profile"){
                Navigator.pop(context);
              }
            },
            itemBuilder: (BuildContext bc) {
              return  [
                PopupMenuItem(
                  value: '/profile',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/profile.png",height: 20,),
                          const SizedBox(width: 10,),
                          Text("Profile",style: TextStyle(color: AppColor.whiteColor),),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(height: 0.5,width: width,color: AppColor.whiteColor,)
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: '/setting',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/settings.png",height: 20,),
                          const SizedBox(width: 10,),
                          Text("Settings",style: TextStyle(color: AppColor.whiteColor)),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Container(height: 0.5,width: width,color: AppColor.whiteColor,)
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: '/logout',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/logout.png",height: 20,),
                          const SizedBox(width: 10,),
                          Text("Log out",style: TextStyle(color: AppColor.whiteColor)),
                        ],
                      ),
                    ],
                  ),
                )
              ];
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.asset("assets/images/user_image.png",height: 40,width: 40,),
                  const SizedBox(width: 10,),
                  Row(
                    children: [
                      MediumText("Jhon Deo", 16, AppColor.whiteColor, TextAlign.start),
                      const SizedBox(width: 10,),
                      Icon(Icons.arrow_drop_down,color: AppColor.hintColor,)
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 120,),
        ],
      ),
    );
  }
}

