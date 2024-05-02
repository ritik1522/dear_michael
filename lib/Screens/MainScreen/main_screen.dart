import 'package:dear_michael/Dialog/likss_dialog.dart';
import 'package:dear_michael/Dialog/share_dialog/share_dialog.dart';
import 'package:dear_michael/Utils/Routes/routes_name.dart';
import 'package:dear_michael/Utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

import '../../Utils/color.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
        child: ListView.builder(itemBuilder: (context,index){
          return Container(
            height: height*0.70,
            width: width,
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage("assets/images/reel_img.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/user_image.png",height: 40,width: 40,),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  MediumText("Jhon Deo", 16, AppColor.whiteColor, TextAlign.start),
                                  const SizedBox(width: 10,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.buttonColor
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                    child: MediumText("Follow", 12, AppColor.whiteColor, TextAlign.center),
                                  )
                                ],
                              ),
                              CommonText("Yesterday at 06:00 AM", 12, AppColor.whiteColor, TextAlign.start)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset("assets/icons/sound_icon.png",height: 20,width: 20,),
                          const SizedBox(width: 15,),
                          PopupMenuButton(
                            color: AppColor.popUpMenuColor,
                            onSelected: (value) {
                              // your logic
                            },
                            itemBuilder: (BuildContext bc) {
                              return  [
                                PopupMenuItem(
                                  value: '/share',
                                  child: Text("Share",style: TextStyle(color: AppColor.whiteColor),),
                                ),
                                PopupMenuItem(
                                  value: '/save',
                                  child: Text("Save Video",style: TextStyle(color: AppColor.whiteColor)),
                                ),
                                PopupMenuItem(
                                  value: '/report',
                                  child: Text("Report",style: TextStyle(color: AppColor.whiteColor)),
                                )
                              ];
                            },
                            child: Image.asset("assets/icons/three_dots.png",height: 20,width: 20,),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: width*0.70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MediumText("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", 15, AppColor.whiteColor, TextAlign.start),
                                const SizedBox(height: 5,),
                                CommonText("#Happy Birthday", 15, AppColor.whiteColor, TextAlign.start)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset("assets/icons/like.png",height: 20,width: 20,),
                          GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context)=> const LikesDialog());
                            },
                              child: MediumText("10k", 15, AppColor.whiteColor, TextAlign.center)),
                          const SizedBox(height: 15,),
                          Image.asset("assets/icons/comment.png",height: 20,width: 20,),
                          MediumText("10k", 15, AppColor.whiteColor, TextAlign.center),
                          const SizedBox(height: 15,),
                         GestureDetector(
                           onTap: (){
                             showDialog(context: context, builder: (context)=> const ShareDialog());
                           },
                           child: Column(
                             children: [
                               Image.asset("assets/icons/share.png",height: 20,width: 20,),
                               MediumText("10k", 15, AppColor.whiteColor, TextAlign.center),
                             ],
                           ),
                         ),
                          const SizedBox(height: 15,),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
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
            height: 40, child: MediumText("Home", 17, AppColor.buttonColor, TextAlign.start)),

          ///--------------------------------Post---------------------------------
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.createVideo);
            },
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("Post", 17, AppColor.whiteColor, TextAlign.start)),
          ),

          ///--------------------------------Explore---------------------------------
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.explore);
            },
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("Explore", 17, AppColor.whiteColor, TextAlign.start)),
          ),

          ///--------------------------------DMP---------------------------------
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.dmpScreen);
            },
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("DMP", 17, AppColor.whiteColor, TextAlign.start)),
          ),

          ///--------------------------------Notifications---------------------------------
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, RoutesName.notificationScreen);
            },
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 40, child: MediumText("Notifications", 17, AppColor.whiteColor, TextAlign.start)),
          ),

          ///--------------------------------Profile---------------------------------
          PopupMenuButton(
            padding: const EdgeInsets.only(left: 50),
            color: AppColor.black,
            onSelected: (value) {
              if(value == "/profile"){
                Navigator.pushNamed(context, RoutesName.profileScreen);
              }
              else if(value == "/setting"){
                Navigator.pushNamed(context, RoutesName.settingScreen);
              }
              // your logic
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
