import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'color.dart';
import 'package:timezone/timezone.dart' as tz;

/*const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
    r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
    r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
    r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
    r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
    r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
    r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';*/

String pattern = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    r"{0,253}[a-zA-Z0-9])?)*\.com$";

var urlPattern =
    r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

const platform = MethodChannel('com.auria/custom');

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      // message
      backgroundColor: AppColor.greenColor,
      toastLength: Toast.LENGTH_SHORT,
      // length
      gravity: ToastGravity.BOTTOM,
      // location
      timeInSecForIosWeb: 3 // duration
      );
}

void showError(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      // message
      backgroundColor: AppColor.redColor,
      toastLength: Toast.LENGTH_SHORT,
      // length
      gravity: ToastGravity.BOTTOM,
      // location
      timeInSecForIosWeb: 3 // duration
      );
}

void showLoader(BuildContext context) {
  showDialog(
    barrierColor: AppColor.dialogBackgroundColor,
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SimpleDialog(
          backgroundColor: Colors.transparent,
          //here set the color to transparent
          elevation: 0,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  color: AppColor.greenColor,
                ),
                const SizedBox(height: 10),
                const Text("", textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      );
    },
  );
}

void hideLoader(BuildContext context) {
  Navigator.pop(context);
}

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

String dateFormat(String eventDate) {
  var createTime = "";
  String formattedDate2 =
      DateFormat('MMM dd, yyyy').format(DateTime.parse(eventDate));
  print(formattedDate2);
  createTime = formattedDate2.toString();
  return createTime;
}

String dateFormatBetting(String eventDate) {
  var createTime = "";
  DateTime date = DateTime.parse(eventDate);
  var newDate = DateTime(date.year, date.month, date.day + 6);
  String formattedDate2 = DateFormat('MMM dd').format(newDate);
  print(formattedDate2);
  createTime = formattedDate2.toString();
  return createTime;
}

String dateFormatBetting2(String eventDate) {
  var createTime = "";

  final utcTime =
      DateTime.parse(eventDate).add(const Duration(hours: 10, minutes: 30));
  var date = utcTime.toLocal();
  String formattedDate2 = DateFormat('MMM dd').format(date);
  print(formattedDate2);
  createTime = formattedDate2.toString();
  return createTime;
}

String dateTimeFormat(String eventDate) {
  var createTime = "";

  var time = eventDate.replaceAll("T", "-");
  time = time.replaceAll(":", "-");
  var parts = time.split('-');
  DateTime staticEstDateTime = DateTime(
      int.parse(parts[0].toString()),
      int.parse(parts[1].toString()),
      int.parse(parts[2].toString()),
      int.parse(parts[3].toString()),
      int.parse(parts[4].toString()),
      int.parse(parts[5].toString()));

  // Convert the static EST DateTime to UTC
  DateTime staticUtcDateTime = convertEstToUtc(staticEstDateTime);

  // Display the results
  print('Static EST DateTime: ${staticEstDateTime}');
  print('Converted UTC DateTime: ${staticUtcDateTime}');

  var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(formatUtcDateTime(staticUtcDateTime))
      .toLocal();
  String formattedDate = DateFormat("hh:mm a MMM dd").format(dateValue);

  print("UTRFUYGUYg $formattedDate");

  return formattedDate;
}

String formatUtcDateTime(DateTime utcDateTime) {
  // Create a DateFormat with the specified format
  final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

  // Format the DateTime
  String formattedDateTime = formatter.format(utcDateTime);

  return formattedDateTime;
}

DateTime convertEstToUtc(DateTime estDateTime) {

  // Set the time zone for Eastern Standard Time
  final estTimeZone = tz.getLocation('America/New_York');

  // Convert the EST time to UTC
  tz.TZDateTime estTzDateTime = tz.TZDateTime(
      estTimeZone,
      estDateTime.year,
      estDateTime.month,
      estDateTime.day,
      estDateTime.hour,
      estDateTime.minute,
      estDateTime.second
  );

  tz.TZDateTime utcTzDateTime = estTzDateTime.toUtc();

  return utcTzDateTime;
}

bool dateTimeFormatCheck(String eventDate) {

  var time = eventDate.replaceAll("T", "-");
  time = time.replaceAll(":", "-");
  var parts = time.split('-');
  DateTime staticEstDateTime = DateTime(
      int.parse(parts[0].toString()),
      int.parse(parts[1].toString()),
      int.parse(parts[2].toString()),
      int.parse(parts[3].toString()),
      int.parse(parts[4].toString()),
      int.parse(parts[5].toString()));

  // Convert the static EST DateTime to UTC
  DateTime staticUtcDateTime = convertEstToUtc(staticEstDateTime);

  // Display the results
  print('Static EST DateTime: ${staticEstDateTime}');
  print('Converted UTC DateTime: ${staticUtcDateTime}');

  var dateValue = new DateFormat("yyyy-MM-ddTHH:mm:ssZ")
      .parseUTC(formatUtcDateTime(staticUtcDateTime))
      .toLocal();

  // final utcTime = DateTime.parse(eventDate).add(const Duration(hours: 5));
  // var dateLocal = utcTime.toLocal();
  print('UTC Time: ${dateValue.isBefore(DateTime.now())}');
  return dateValue.isBefore(DateTime.now());
}

String getOrdinal(int number) {
  if (number % 10 == 1 && number % 100 != 11) {
    return '$number${number == 11 ? "TH" : "ST"}';
  } else if (number % 10 == 2 && number % 100 != 12) {
    return '$number${number == 12 ? "TH" : "ND"}';
  } else if (number % 10 == 3 && number % 100 != 13) {
    return '$number${number == 13 ? "TH" : "RD"}';
  } else {
    return '$number' + 'TH';
  }
}
