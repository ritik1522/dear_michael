import 'package:dear_michael/Screens/AddProfileDetail/add_profile_detail.dart';
import 'package:dear_michael/Screens/CreateVideo/create_video_screen.dart';
import 'package:dear_michael/Screens/DMP/dmp_screen.dart';
import 'package:dear_michael/Screens/EditProfile/edit_profile.dart';
import 'package:dear_michael/Screens/Explore/explore.dart';
import 'package:dear_michael/Screens/Intro/intro_screen.dart';
import 'package:dear_michael/Screens/Login/login_screen.dart';
import 'package:dear_michael/Screens/MainScreen/main_screen.dart';
import 'package:dear_michael/Screens/NewPassword/new_password_screen.dart';
import 'package:dear_michael/Screens/Notification/notification_screen.dart';
import 'package:dear_michael/Screens/Otp/otp_screen.dart';
import 'package:dear_michael/Screens/ProfileScreen/profile_screen.dart';
import 'package:dear_michael/Screens/Settings/setting_screen.dart';
import 'package:dear_michael/Screens/Splash/splash_screen.dart';
import 'package:dear_michael/Utils/Routes/routes_name.dart';
import 'package:dear_michael/Utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Screens/ChangePssword/change_password.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.otpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OtpScreen());
      case RoutesName.introScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const IntroScreen());
      case RoutesName.newPasswords:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NewPasswordScreen());
      case RoutesName.addProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddProfileDetail());
      case RoutesName.mainScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MainScreen());
       case RoutesName.profileScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfileScreen());
      case RoutesName.editProfileScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const EditProfile());
      case RoutesName.notificationScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NotificationScreen());
      case RoutesName.settingScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingScreen());
       case RoutesName.changePassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChangePassword());
      case RoutesName.createVideo:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CreateVideoScreen());
      case RoutesName.explore:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ExploreScreen());
      case RoutesName.dmpScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DmpScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: MediumText("No route", 15, Colors.black, TextAlign.center),
            ),
          );
        });
    }
  }
}
