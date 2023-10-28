// import 'package:fitness_app/widgets/color_remover.dart';
// import 'package:flutter/material.dart';
//
// class OpenChat extends StatelessWidget {
//   const OpenChat({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextFormField(
//           decoration: InputDecoration(
//             suffixIcon: IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.send,
//                   color: Color(0xff1ce5c1),
//                 )),
//             enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(50.0)),
//             focusedBorder: OutlineInputBorder(
//                 borderSide: BorderSide.none,
//                 borderRadius: BorderRadius.circular(50.0)),
//             fillColor: const Color(0xff26252b),
//             filled: true,
//             hintText: "Write your message",
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: ColorRemover(
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.40,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/Amenda Johnson.jpg"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                           colors: [
//                             Color(0xff1c1b20),
//                             Colors.transparent,
//                           ],
//                         ),
//                       ),
//                       height: MediaQuery.of(context).size.height * 0.40,
//                       width: MediaQuery.of(context).size.width,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 0),
//                         child: Column(
//                           children: [
//                             const SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 InkWell(
//                                     onTap: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Icon(
//                                       Icons.arrow_back_ios,
//                                       size: 24,
//                                     )),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       'Amenda Johnson',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       'Fitness Trainer',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                             Align(
//                               alignment: Alignment.topRight,
//                               child: Container(
//                                 height: 65.0,
//                                 constraints: const BoxConstraints(
//                                     minWidth: 150.0, maxWidth: 250.0),
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xff1ce5c1),
//                                     borderRadius: BorderRadius.circular(12.0)),
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 12.0,
//                                   horizontal: 16.0,
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     const Text(
//                                       "Hey Amenda",
//                                       textAlign: TextAlign.end,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     Text(
//                                       "11:40 am",
//                                       textAlign: TextAlign.end,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey[200],
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Spacer(),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Container(
//                                 height: 80.0,
//                                 constraints: const BoxConstraints(
//                                     minWidth: 150.0, maxWidth: 250.0),
//                                 decoration: BoxDecoration(
//                                     color: const Color(0xff26252b),
//                                     borderRadius: BorderRadius.circular(12.0)),
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 12.0,
//                                   horizontal: 16.0,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     const Text(
//                                       "Hello Samantha,\nHow may I help you?",
//                                       // textAlign: TextAlign.end,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     Text(
//                                       "11:40 am",
//                                       textAlign: TextAlign.end,
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey[200],
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const Spacer(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     height: 80.0,
//                     constraints:
//                         const BoxConstraints(minWidth: 150.0, maxWidth: 250.0),
//                     decoration: BoxDecoration(
//                         color: const Color(0xff1ce5c1),
//                         borderRadius: BorderRadius.circular(12.0)),
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 16.0,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text(
//                           "Do I have to repeat\nsame exercise?",
//                           textAlign: TextAlign.end,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           "11:40 am",
//                           textAlign: TextAlign.end,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[200],
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Container(
//                     height: 80.0,
//                     constraints:
//                         const BoxConstraints(minWidth: 150.0, maxWidth: 250.0),
//                     decoration: BoxDecoration(
//                         color: const Color(0xff26252b),
//                         borderRadius: BorderRadius.circular(12.0)),
//                     padding: const EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 16.0,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text(
//                           "Yes, You can repeat same exercise\ntoday",
//                           // textAlign: TextAlign.end,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         Text(
//                           "11:40 am",
//                           textAlign: TextAlign.end,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey[200],
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // FlatChatMessage(
//                 //   message: "Hello World!, This is the first message.",
//                 //   messageType: MessageType.sent,
//                 //   showTime: true,
//                 //   time: "2 mins ago",
//                 // ),
//                 // FlatChatMessage(
//                 //   message: "Typing another message from the input box.",
//                 //   messageType: MessageType.sent,
//                 //   showTime: true,
//                 //   time: "2 mins ago",
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
