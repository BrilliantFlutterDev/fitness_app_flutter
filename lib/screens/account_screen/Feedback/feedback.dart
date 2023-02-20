// import 'dart:html';
import 'dart:io';

import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/account_screen/Feedback/device_info.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';
import 'dart:developer' as developer;
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class UserFeedback extends StatefulWidget {
  const UserFeedback({Key? key}) : super(key: key);

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {

  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'gamescapes234@gmail.com',
  );

  final _subjectController = TextEditingController(text: 'Fitness App Feedback');

  final _bodyController = TextEditingController(
    text:  'Write your feedback here...........',
  );

  Future<void> send() async {
    final Email email = Email(

      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }

  // Future<void> initPlatformState() async {
  //   var deviceData = <String, dynamic>{};
  //
  //   try {
  //     if (kIsWeb) {
  //       deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
  //     } else {
  //       if (Platform.isAndroid) {
  //         deviceData =
  //             _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
  //       } else if (Platform.isIOS) {
  //         deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
  //       } else if (Platform.isLinux) {
  //         deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
  //       } else if (Platform.isMacOS) {
  //         deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
  //       } else if (Platform.isWindows) {
  //         deviceData =
  //             _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
  //       }
  //     }
  //   } on PlatformException {
  //     deviceData = <String, dynamic>{
  //       'Error:': 'Failed to get platform version.'
  //     };
  //   }
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _deviceData = deviceData;
  //   });
  // }

  // Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  //   return <String, dynamic>{
  //     'version.securityPatch': build.version.securityPatch,
  //     'version.sdkInt': build.version.sdkInt,
  //     'version.release': build.version.release,
  //     'version.previewSdkInt': build.version.previewSdkInt,
  //     'version.incremental': build.version.incremental,
  //     'version.codename': build.version.codename,
  //     'version.baseOS': build.version.baseOS,
  //     'board': build.board,
  //     'bootloader': build.bootloader,
  //     'brand': build.brand,
  //     'device': build.device,
  //     'display': build.display,
  //     'fingerprint': build.fingerprint,
  //     'hardware': build.hardware,
  //     'host': build.host,
  //     'id': build.id,
  //     'manufacturer': build.manufacturer,
  //     'model': build.model,
  //     'product': build.product,
  //     'supported32BitAbis': build.supported32BitAbis,
  //     'supported64BitAbis': build.supported64BitAbis,
  //     'supportedAbis': build.supportedAbis,
  //     'tags': build.tags,
  //     'type': build.type,
  //     'isPhysicalDevice': build.isPhysicalDevice,
  //     'systemFeatures': build.systemFeatures,
  //     'displaySizeInches':
  //     ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
  //     'displayWidthPixels': build.displayMetrics.widthPx,
  //     'displayWidthInches': build.displayMetrics.widthInches,
  //     'displayHeightPixels': build.displayMetrics.heightPx,
  //     'displayHeightInches': build.displayMetrics.heightInches,
  //     'displayXDpi': build.displayMetrics.xDpi,
  //     'displayYDpi': build.displayMetrics.yDpi,
  //   };
  // }

  // Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  //   return <String, dynamic>{
  //     'name': data.name,
  //     'systemName': data.systemName,
  //     'systemVersion': data.systemVersion,
  //     'model': data.model,
  //     'localizedModel': data.localizedModel,
  //     'identifierForVendor': data.identifierForVendor,
  //     'isPhysicalDevice': data.isPhysicalDevice,
  //     'utsname.sysname:': data.utsname.sysname,
  //     'utsname.nodename:': data.utsname.nodename,
  //     'utsname.release:': data.utsname.release,
  //     'utsname.version:': data.utsname.version,
  //     'utsname.machine:': data.utsname.machine,
  //   };
  // }

  // Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
  //   return <String, dynamic>{
  //     'name': data.name,
  //     'version': data.version,
  //     'id': data.id,
  //     'idLike': data.idLike,
  //     'versionCodename': data.versionCodename,
  //     'versionId': data.versionId,
  //     'prettyName': data.prettyName,
  //     'buildId': data.buildId,
  //     'variant': data.variant,
  //     'variantId': data.variantId,
  //     'machineId': data.machineId,
  //   };
  // }

  // Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
  //   return <String, dynamic>{
  //     'browserName': describeEnum(data.browserName),
  //     'appCodeName': data.appCodeName,
  //     'appName': data.appName,
  //     'appVersion': data.appVersion,
  //     'deviceMemory': data.deviceMemory,
  //     'language': data.language,
  //     'languages': data.languages,
  //     'platform': data.platform,
  //     'product': data.product,
  //     'productSub': data.productSub,
  //     'userAgent': data.userAgent,
  //     'vendor': data.vendor,
  //     'vendorSub': data.vendorSub,
  //     'hardwareConcurrency': data.hardwareConcurrency,
  //     'maxTouchPoints': data.maxTouchPoints,
  //   };
  // }

  // Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
  //   return <String, dynamic>{
  //     'computerName': data.computerName,
  //     'hostName': data.hostName,
  //     'arch': data.arch,
  //     'model': data.model,
  //     'kernelVersion': data.kernelVersion,
  //     'osRelease': data.osRelease,
  //     'activeCPUs': data.activeCPUs,
  //     'memorySize': data.memorySize,
  //     'cpuFrequency': data.cpuFrequency,
  //     'systemGUID': data.systemGUID,
  //   };
  // }

  // Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
  //   return <String, dynamic>{
  //     'numberOfCores': data.numberOfCores,
  //     'computerName': data.computerName,
  //     'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
  //     'userName': data.userName,
  //     'majorVersion': data.majorVersion,
  //     'minorVersion': data.minorVersion,
  //     'buildNumber': data.buildNumber,
  //     'platformId': data.platformId,
  //     'csdVersion': data.csdVersion,
  //     'servicePackMajor': data.servicePackMajor,
  //     'servicePackMinor': data.servicePackMinor,
  //     'suitMask': data.suitMask,
  //     'productType': data.productType,
  //     'reserved': data.reserved,
  //     'buildLab': data.buildLab,
  //     'buildLabEx': data.buildLabEx,
  //     'digitalProductId': data.digitalProductId,
  //     'displayVersion': data.displayVersion,
  //     'editionId': data.editionId,
  //     'installDate': data.installDate,
  //     'productId': data.productId,
  //     'productName': data.productName,
  //     'registeredOwner': data.registeredOwner,
  //     'releaseId': data.releaseId,
  //     'deviceId': data.deviceId,
  //   };
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBG,
      appBar: AppBar(
        backgroundColor: kColorBG,
        title: Text('Fitness Feedback'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.attach_file),
            onPressed: _openImagePicker,
          ),
          IconButton(
            onPressed: send,
            icon: Icon(Icons.send),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: kColorPrimary,
                    controller: _recipientController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      ),
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: 'Recipient',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kColorPrimary),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    cursorColor: kColorPrimary,
                    controller: _subjectController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: 'Subject',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kColorPrimary),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   child: Expanded(
                //     child: ListView(
                //       children: _deviceData.keys.map(
                //             (String property) {
                //           return Row(
                //             children: <Widget>[
                //               Container(
                //                 padding: const EdgeInsets.all(10.0),
                //                 child: Text(
                //                   property,
                //                   style: const TextStyle(
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //               ),
                //               Expanded(
                //                   child: Container(
                //                     padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                //                     child: Text(
                //                       '${_deviceData[property]}',
                //                       maxLines: 10,
                //                       overflow: TextOverflow.ellipsis,
                //                     ),
                //                   )),
                //             ],
                //           );
                //         },
                //       ).toList(),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      cursorColor: kColorPrimary,
                      controller: _bodyController,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey),
                        labelText: 'Body',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kColorPrimary),
                        ),
                      ),
                    ),
                  ),
                ),

                // CheckboxListTile(
                //   contentPadding:
                //   EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                //   title: Text('HTML'),
                //   onChanged: (bool? value) {
                //     if (value != null) {
                //       setState(() {
                //         isHTML = value;
                //       });
                //     }
                //   },
                //   value: isHTML,
                // ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      for (var i = 0; i < attachments.length; i++)
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                attachments[i],
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: () => {_removeAttachment(i)},
                            )
                          ],
                        ),
                      // TextButton(
                      //   child: Text('Attach file in app documents directory'),
                      //   onPressed: () => _attachFileFromAppDocumentsDirectoy(),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _openImagePicker() async {
    final picker = ImagePicker();
    PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
    if (pick != null) {
      setState(() {
        attachments.add(pick.path);
      });
    }
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }

  Future<void> _attachFileFromAppDocumentsDirectoy() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      final filePath = appDocumentDir.path + '/file.txt';
      final file = File(filePath);
      await file.writeAsString('Text file in app directory');

      setState(() {
        attachments.add(filePath);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create file in applicion directory'),
        ),
      );
    }
  }
}









// class _UserFeedbackState extends State<UserFeedback> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               child: Text("Open Mail App"),
//               onPressed: () async {
//                 // Android: Will open mail app or show native picker.
//                 // iOS: Will open mail app if single mail app found.
//                 var result = await OpenMailApp.openMailApp(
//                   nativePickerTitle: 'Select email app to open',
//                 );
//
//                 // If no mail apps found, show error
//                 if (!result.didOpen && !result.canOpen) {
//                   showNoMailAppsDialog(context);
//
//                   // iOS: if multiple mail apps found, show dialog to select.
//                   // There is no native intent/default app system in iOS so
//                   // you have to do it yourself.
//                 } else if (!result.didOpen && result.canOpen) {
//                   showDialog(
//                     context: context,
//                     builder: (_) {
//                       return MailAppPickerDialog(
//                         mailApps: result.options,
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//             ElevatedButton(
//               child: Text('Open mail app, with email already composed'),
//               onPressed: () async {
//                 EmailContent email = EmailContent(
//                   to: [
//                     'user@domain.com',
//                   ],
//                   subject: 'Hello!',
//                   body: 'How are you doing?',
//                   cc: ['user2@domain.com', 'user3@domain.com'],
//                   bcc: ['boss@domain.com'],
//                 );
//
//                 OpenMailAppResult result =
//                 await OpenMailApp.composeNewEmailInMailApp(
//                     nativePickerTitle: 'Select email app to compose',
//                     emailContent: email);
//                 if (!result.didOpen && !result.canOpen) {
//                   showNoMailAppsDialog(context);
//                 } else if (!result.didOpen && result.canOpen) {
//                   showDialog(
//                     context: context,
//                     builder: (_) => MailAppPickerDialog(
//                       mailApps: result.options,
//                       emailContent: email,
//                     ),
//                   );
//                 }
//               },
//             ),
//             ElevatedButton(
//               child: Text("Get Mail Apps"),
//               onPressed: () async {
//                 var apps = await OpenMailApp.getMailApps();
//
//                 if (apps.isEmpty) {
//                   showNoMailAppsDialog(context);
//                 } else {
//                   showDialog(
//                     context: context,
//                     builder: (context) {
//                       return MailAppPickerDialog(
//                         mailApps: apps,
//                         emailContent: EmailContent(
//                           to: [
//                             'user@domain.com',
//                           ],
//                           subject: 'Hello!',
//                           body: 'How are you doing?',
//                           cc: ['user2@domain.com', 'user3@domain.com'],
//                           bcc: ['boss@domain.com'],
//                         ),
//                       );
//                     },
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showNoMailAppsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Open Mail App"),
//           content: Text("No mail apps installed"),
//           actions: <Widget>[
//             TextButton(
//               child: Text("OK"),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             )
//           ],
//         );
//       },
//     );
//   }
// }




// import 'package:open_share_pro/open.dart';
//
// class UserFeedback extends StatefulWidget {
//   const UserFeedback({Key? key}) : super(key: key);
//
//   @override
//   State<UserFeedback> createState() => _UserFeedbackState();
// }
//
// class _UserFeedbackState extends State<UserFeedback> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   Open.browser(url: "https://techdirr.com");
//                 },
//                 child: const Text("Open Browser")),
//             const SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () {
//                   Open.phone(phoneNumber: "+919426636120");
//                 },
//                 child: const Text("Open Phone Dial")),
//             const SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () {
//                   Open.mail(
//                       toAddress: "dev@techdirr.com",
//                       subject: "techdirr",
//                       body: "techdirr dev");
//                 },
//                 child: const Text("Send Mail")),
//             const SizedBox(height: 20),
//             ElevatedButton(
//                 onPressed: () {
//                   Open.whatsApp(
//                       whatsAppNumber: "919426636120", text: "techdirr");
//                 },
//                 child: const Text("Send WhatsApp")),
//             const SizedBox(height: 20)
//           ],
//         ),
//       );
//   }
// }