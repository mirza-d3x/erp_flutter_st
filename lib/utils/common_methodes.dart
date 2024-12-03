// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:erp_mobile/utils/console_log.dart';
// import 'package:erp_mobile/utils/ios_model_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';

// void showConfirmationDialog({
//   required BuildContext context,
//   required String title,
//   required String content,
//   required VoidCallback onConfirmed,
//   VoidCallback? onCancelled,
// }) {
//   showDialog<bool?>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('No'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               if (onCancelled != null) {
//                 onCancelled();
//               }
//             },
//           ),
//           TextButton(
//             child: const Text('Yes'),
//             onPressed: () {
//               Navigator.of(context).pop();
//               onConfirmed();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// String convertDateFormat(
//     {required String inputDate,
//     String? dateInputFormate = 'ddMMMyyyy',
//     String? outPutFormate = 'yyyy-MM-d-H-m-s-SS'}) {
//   try {
//     DateTime dateTime = DateFormat(dateInputFormate).parseStrict(inputDate);
//     String formattedDate = DateFormat(outPutFormate).format(dateTime);

//     return formattedDate;
//   } catch (error, stack) {
//     consoleLog("Error while performing 'convertDateFormat'",
//         error: error, stackTrace: stack);
//     return inputDate;
//   }
// }

// DateTime get standardTime {
//   DateTime istTime =
//       DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
//   return DateTime(istTime.year, istTime.month, istTime.day, istTime.hour,
//       istTime.minute, istTime.second);
// }

// Future<String> getDeviceInfo() async {
//   try {
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
//       String release = androidInfo.version.release;
//       String manufacturer = androidInfo.manufacturer;
//       String modelNumber = androidInfo.model;
//       String model = androidInfo.product;
//       String id = androidInfo.id;
//       List<NetworkInterface> deviceIp =
//           await NetworkInterface.list(type: InternetAddressType.IPv4);
//       if (deviceIp.isEmpty) {
//         throw const SocketException("No Internet Connection");
//       }
//       List<InternetAddress> addresses = deviceIp[0].addresses;
//       String deviceInfo =
//           "$manufacturer - $modelNumber ($model)/ANDROID $release/$id//V-5.7.4/${addresses[0].address.toString()}";
//       return deviceInfo;
//     }

//     if (Platform.isIOS) {
//       var iosInfo = await DeviceInfoPlugin().iosInfo;
//       String version = iosInfo.systemVersion;
//       String modelNumber = iosInfo.utsname.machine;
//       String model = iosModelDetails[modelNumber] ?? "";
//       String imei = iosInfo.identifierForVendor ?? "";

//       List<NetworkInterface> deviceIp =
//           await NetworkInterface.list(type: InternetAddressType.IPv4);
//       if (deviceIp.isEmpty) {
//         throw const SocketException("No Internet Connection");
//       }
//       List<InternetAddress> addresses = deviceIp[0].addresses;
//       String deviceInfo =
//           "Apple - $modelNumber ($model)/IOS $version/$imei//V-5.7.4/${addresses[0].address.toString()}";
//       return deviceInfo;
//     }
//     throw PlatformException(
//         code: "-100", message: "No method found for the current platfrom");
//   } catch (error, stack) {
//     consoleLog("Exception occurred while getting device info",
//         error: error, stackTrace: stack);
//     rethrow;
//   }
// }

// List<String> removeDuplicatesAndSort(List<String> list) {
//   final seen = <String>{};
//   final uniqueList = <String>[];

//   for (final item in list) {
//     if (seen.add(item)) {
//       uniqueList.add(item);
//     }
//   }
//   uniqueList.sort((a, b) => a.compareTo(b));

//   return uniqueList;
// }
