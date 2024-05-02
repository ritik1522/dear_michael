import 'package:flutter/material.dart';

import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.appBarBackground,
      appBar: AppBar(
        title: BoldText("Notifications", 17, AppColor.whiteColor, TextAlign.start),
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: AppColor.whiteColor,)),
        backgroundColor: AppColor.appBarBackground,
        elevation: 0.0,
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Image.asset("assets/images/user_image.png",height: 50,width: 50,),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width*0.7,
                    child: RichText(
                      text: TextSpan(
                        text: 'Jhon Deo ',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.whiteColor
                        ),
                        children: [
                          TextSpan(
                            text: 'Gladys Dare commnets on your post',
                            style: TextStyle(
                             fontSize: 14,
                              color: AppColor.textColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonText("1m ago", 12, AppColor.whiteColor, TextAlign.start)
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
