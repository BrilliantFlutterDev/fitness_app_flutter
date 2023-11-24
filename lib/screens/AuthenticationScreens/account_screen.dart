//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'loginBloc/login_bloc.dart';
//
// class AccountScreen extends StatefulWidget {
//   //static const String id = 'chatscreen';
//   //final GlobalKey<ScaffoldState> parentScaffoldKey;
//   final String previousPage;
//
//   const AccountScreen({
//     Key? key,
//     required this.previousPage,
//   }) : super(key: key);
//   @override
//   _AccountScreenState createState() => _AccountScreenState();
// }
//
// class _AccountScreenState extends State<AccountScreen> {
//   late LoginBloc _loginBloc;
//   FlutterSecureStorage storage = const FlutterSecureStorage();
//
//   @override
//   void initState() {
//     super.initState();
//     _loginBloc = BlocProvider.of<LoginBloc>(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return BlocConsumer<LoginBloc, LoginState>(
//         listener: (context, state) async {
//       if (state is LoadingState) {
//       } else if (state is ErrorState) {
//         Fluttertoast.showToast(
//             msg: state.error,
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.grey.shade400,
//             textColor: Colors.white,
//             fontSize: 12.0);
//       } else if (state is InternetErrorState) {
//         Fluttertoast.showToast(
//             msg: state.error,
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.grey.shade400,
//             textColor: Colors.white,
//             fontSize: 12.0);
//       } else if (state is GetDeliveryDriversDetailsState) {}
//     }, builder: (context, state) {
//       return Scaffold(
//           backgroundColor: kColorWhite,
//           // extendBody: true,
//           // resizeToAvoidBottomInset: false,
//           body: Stack(
//             children: [
//               ///This is the body
//               SingleChildScrollView(
//                 child: Container(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         // color: Colors.yellow,
//                         width: screenSize.width,
//                         height: screenSize.height * 0.11,
//                       ),
//                       Container(
//                         height: screenSize.height * 0.35,
//                         width: screenSize.width,
//                         child: Stack(
//                           alignment: AlignmentDirectional.center,
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   height: screenSize.height * 0.15,
//                                   width: screenSize.width,
//                                   color: kColorWidgetBackgroundColor,
//                                 ),
//                                 Container(
//                                   height: screenSize.height * 0.15,
//                                   width: screenSize.width,
//                                   color: Colors.white,
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               children: [
//                                 SizedBox(
//                                   height: screenSize.height * 0.08,
//                                 ),
//                                 CircleAvatar(
//                                   radius: 50.0,
//                                   child: CachedNetworkImage(
//                                     imageUrl: AppGlobal.photosBaseURL +
//                                         AppGlobal.profilePic
//                                             .replaceAll('\\', '/'),
//                                     imageBuilder: (context, imageProvider) =>
//                                         Container(
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         image: DecorationImage(
//                                           image: imageProvider,
//                                           fit: BoxFit.fill,
//                                         ),
//                                       ),
//                                     ),
//                                     progressIndicatorBuilder:
//                                         (context, url, downloadProgress) =>
//                                             Center(
//                                       child: CircularProgressIndicator(
//                                           color: kColorWhite,
//                                           value: downloadProgress.progress),
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(
//                                       MyFlutterApp.account_fill,
//                                       size: 35,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 10,
//                                 ),
//                                 Text(
//                                   AppGlobal.userName,
//                                   style: const TextStyle(
//                                       color: kColorPrimary, fontSize: 20),
//                                 ),
//                                 Text(
//                                   AppGlobal.emailAddress,
//                                   style: const TextStyle(
//                                     fontSize: 12,
//                                     color: kColorFieldsBorders,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: screenSize.height * 0.05,
//                       ),
//                       (AppGlobal.token != '' && AppGlobal.userID != -1)
//                           ? Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               child: Column(
//                                 children: [
//                                   const Align(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       'Personal Information',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       const Text(
//                                         'Date of Birth',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: kColorFieldsBorders),
//                                       ),
//                                       Text(
//                                         AppGlobal.birthDay != 'Null'
//                                             ? AppGlobal.birthDay
//                                             : '',
//                                         style: const TextStyle(
//                                             fontSize: 16,
//                                             color: kColorDarkGreyText),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       const Text(
//                                         'Gender',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: kColorFieldsBorders),
//                                       ),
//                                       Text(
//                                         AppGlobal.gender != 'Null'
//                                             ? AppGlobal.gender
//                                             : '',
//                                         style: const TextStyle(
//                                             fontSize: 16,
//                                             color: kColorDarkGreyText),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       const Text(
//                                         'Phone Number',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: kColorFieldsBorders),
//                                       ),
//                                       Text(
//                                         AppGlobal.phoneNumber == 'null'
//                                             ? 'Not added yet'
//                                             : AppGlobal.phoneNumber,
//                                         style: const TextStyle(
//                                             fontSize: 16,
//                                             color: kColorDarkGreyText),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       const Text(
//                                         'Status',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             color: kColorFieldsBorders),
//                                       ),
//                                       Text(
//                                         AppGlobal.active == 'Y'
//                                             ? 'Active'
//                                             : 'Not Active',
//                                         style: const TextStyle(
//                                             fontSize: 16,
//                                             color: kColorDarkGreyText),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   InkWell(
//                                     onTap: () {
//                                       // Navigator.push(
//                                       //   context,
//                                       //   MaterialPageRoute(
//                                       //       builder: (context) => DemoPage()),
//                                       // );
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const BusinessRegistrationScreen2(
//                                                   processNumber: '',
//                                                 )),
//                                       );
//                                     },
//                                     child: Container(
//                                         height: screenSize.height * 0.055,
//                                         width: screenSize.width * 0.75,
//                                         padding: const EdgeInsets.fromLTRB(
//                                             10, 0, 10, 0),
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(6),
//                                           color: kColorPrimary,
//                                         ),
//                                         child: const Center(
//                                             child: Text(
//                                           'Register Business Account',
//                                           style: TextStyle(
//                                               color: kColorWhite, fontSize: 17),
//                                         ))),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   AppGlobal.deliveryDriverID == -1
//                                       ? InkWell(
//                                           onTap: () {
//                                             // Navigator.push(
//                                             //   context,
//                                             //   MaterialPageRoute(
//                                             //       builder: (context) => DemoPage()),
//                                             // );
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       const DeliveryRegistrationScreen1()),
//                                             );
//                                           },
//                                           child: Container(
//                                               height: screenSize.height * 0.055,
//                                               width: screenSize.width * 0.75,
//                                               padding:
//                                                   const EdgeInsets.fromLTRB(
//                                                       10, 0, 10, 0),
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(6),
//                                                 color: kColorOrangeText,
//                                               ),
//                                               child: const Center(
//                                                   child: Text(
//                                                 'Register Delivery Account',
//                                                 style: TextStyle(
//                                                     color: kColorWhite,
//                                                     fontSize: 17),
//                                               ))),
//                                         )
//                                       : InkWell(
//                                           onTap: () {
//                                             // Navigator.push(
//                                             //   context,
//                                             //   MaterialPageRoute(
//                                             //       builder: (context) => DemoPage()),
//                                             // );
//                                             Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       const DeliveryRegistrationScreen1()),
//                                             );
//                                           },
//                                           child: Container(
//                                               height: screenSize.height * 0.055,
//                                               width: screenSize.width * 0.75,
//                                               padding:
//                                                   const EdgeInsets.fromLTRB(
//                                                       10, 0, 10, 0),
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(6),
//                                                 color: kColorBlueText,
//                                               ),
//                                               child: const Center(
//                                                   child: Text(
//                                                 'Update Delivery Account',
//                                                 style: TextStyle(
//                                                     color: kColorWhite,
//                                                     fontSize: 17),
//                                               ))),
//                                         ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   AppGlobal.deliveryDriverID != -1
//                                       ? InkWell(
//                                           onTap: () async {
//                                             // Navigator.push(
//                                             //   context,
//                                             //   MaterialPageRoute(
//                                             //       builder: (context) => DemoPage()),
//                                             // );
//                                             if (AppGlobal
//                                                     .switchToDriverAccount ==
//                                                 false) {
//                                               AppGlobal.switchToDriverAccount =
//                                                   true;
//                                               await storage.write(
//                                                   key: 'switchDriver',
//                                                   value: AppGlobal
//                                                       .switchToDriverAccount
//                                                       .toString());
//                                               _loginBloc.add(
//                                                   GetDeliveryDriversDetails());
//                                             } else {
//                                               AppGlobal.switchToDriverAccount =
//                                                   false;
//                                               await storage.write(
//                                                   key: 'switchDriver',
//                                                   value: AppGlobal
//                                                       .switchToDriverAccount
//                                                       .toString());
//                                             }
//                                             setState(() {});
//                                           },
//                                           child: Container(
//                                               height: screenSize.height * 0.055,
//                                               width: screenSize.width * 0.75,
//                                               padding:
//                                                   const EdgeInsets.fromLTRB(
//                                                       10, 0, 10, 0),
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(6),
//                                                 color: AppGlobal
//                                                             .switchToDriverAccount ==
//                                                         false
//                                                     ? kColorOrangeText
//                                                     : kColorPrimary,
//                                               ),
//                                               child: Center(
//                                                   child: Text(
//                                                 AppGlobal.switchToDriverAccount ==
//                                                         false
//                                                     ? 'Switch to Delivery Account'
//                                                     : 'Switch to User Account',
//                                                 style: const TextStyle(
//                                                     color: kColorWhite,
//                                                     fontSize: 17),
//                                               ))),
//                                         )
//                                       : const SizedBox(),
//                                 ],
//                               ),
//                             )
//                           : InkWell(
//                               onTap: () {
//                                 Navigator.pushAndRemoveUntil(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (BuildContext context) =>
//                                             const LoginScreen()),
//                                     (Route<dynamic> route) => false);
//                               },
//                               child: Container(
//                                   height: screenSize.height * 0.055,
//                                   width: screenSize.width * 0.75,
//                                   padding:
//                                       const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(6),
//                                     color: kColorPrimary,
//                                   ),
//                                   child: const Center(
//                                       child: Text(
//                                     'Login First',
//                                     style: TextStyle(
//                                         color: kColorWhite, fontSize: 17),
//                                   ))),
//                             ),
//                       SizedBox(
//                         height: screenSize.height * 0.1,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               ///This is appbar
//               Column(
//                 children: [
//                   Container(
//                     color: kColorWhite,
//                     width: screenSize.width,
//                     height: screenSize.height * 0.035,
//                   ),
//                   Container(
//                       color: kColorWhite,
//                       width: screenSize.width,
//                       height: screenSize.height * 0.09,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             widget.previousPage == 'homePage'
//                                 ? const Text(
//                                     'Profile',
//                                     style: TextStyle(
//                                         color: Colors.black, fontSize: 21),
//                                   )
//                                 : Row(
//                                     children: [
//                                       InkWell(
//                                           onTap: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: const Icon(
//                                             Icons.arrow_back,
//                                           )),
//                                       const Text(
//                                         '  Profile',
//                                         style: TextStyle(
//                                             color: Colors.black, fontSize: 21),
//                                       ),
//                                     ],
//                                   ),
//                             (AppGlobal.token != '' && AppGlobal.userID != -1)
//                                 ? InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 EditProfileScreen(
//                                                   previousPage: '',
//                                                 )),
//                                       );
//                                     },
//                                     child: Container(
//                                         width: 35,
//                                         height: 35,
//                                         decoration: const BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: kColorWidgetBackgroundColor,
//                                           // border: Border.all(
//                                           //     color: kColorDarkGreyText, width: 3),
//                                           // image: DecorationImage(
//                                           //   image: Image.asset("assets/icons/eyeicon.png",),
//                                           //   fit: BoxFit.cover,
//                                           // ),
//                                         ),
//                                         child: const Icon(
//                                           MyFlutterApp.icon_edit_outline,
//                                           color: kColorDarkGreyText,
//                                           size: 18,
//                                         )),
//                                   )
//                                 : const SizedBox()
//                           ],
//                         ),
//                       )),
//                 ],
//               ),
//             ],
//           ));
//     });
//   }
// }
