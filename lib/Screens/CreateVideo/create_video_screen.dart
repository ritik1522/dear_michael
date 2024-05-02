import 'package:dear_michael/Dialog/upload_post_dialog.dart';
import 'package:flutter/material.dart';

import '../../Utils/Routes/routes_name.dart';
import '../../Utils/buttons.dart';
import '../../Utils/color.dart';
import '../../Utils/common_widget.dart';

class CreateVideoScreen extends StatefulWidget {
  const CreateVideoScreen({Key? key}) : super(key: key);

  @override
  State<CreateVideoScreen> createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),

            Image.asset("assets/icons/video_icon.png",height: 100,),
            const SizedBox(height: 20,),
            MediumText("Drag video here", 20, AppColor.textColor, TextAlign.center),
            const SizedBox(
              height: 40,
            ),
            ///--------------------------------Button--------------------------

            SizedBox(
              width: width,
              height: 50,
              child: RoundedButton(
                  text: "Create A Video",
                  color: AppColor.whiteColor,
                  buttonColor: AppColor.buttonColor,
                  radios: 30,
                  onTap: () {
                    showDialog(context: context, builder: (context)=> const UploadPostDialog());
                  }),
            ),

            const SizedBox(height: 20,),

            MediumText("Video Max Limit: 0.60 sec", 13, AppColor.whiteColor, TextAlign.center),
            const SizedBox(height: 10,),
            MediumText("upload from PC", 14, AppColor.buttonColor, TextAlign.center),
          ],
        ),
      ),
    );

  }

}
