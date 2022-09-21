// import 'package:flutter/material.dart';

// enum MessageType { sent, received }

// class FlatChatMessage extends StatelessWidget {
//   final String? message;
//   final MessageType? messageType;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final String? time;
//   final bool? showTime;
//   final double? maxWidth;
//   final double? minWidth;

//   FlatChatMessage(
//       {this.message,
//       this.messageType,
//       this.backgroundColor,
//       this.textColor,
//       this.time,
//       this.showTime,
//       this.minWidth,
//       this.maxWidth});

//   CrossAxisAlignment messageAlignment() {
//     if (messageType == null || messageType == MessageType.received) {
//       return CrossAxisAlignment.start;
//     } else {
//       return CrossAxisAlignment.end;
//     }
//   }

//   double topLeftRadius() {
//     if (messageType == null || messageType == MessageType.received) {
//       return 0.0;
//     } else {
//       return 12.0;
//     }
//   }

//   double topRightRadius() {
//     if (messageType == null || messageType == MessageType.received) {
//       return 12.0;
//     } else {
//       return 0.0;
//     }
//   }

//   Color messageBgColor(BuildContext context) {
//     if (messageType == null || messageType == MessageType.received) {
//       return Theme.of(context).primaryColor;
//     } else {
//       return Theme.of(context).primaryColorDark.withOpacity(0.1);
//     }
//   }

//   Color messageTextColor(BuildContext context) {
//     if (messageType == null || messageType == MessageType.received) {
//       return Colors.white;
//     } else {
//       return Theme.of(context).primaryColorDark;
//     }
//   }

//   Text messageTime() {
//     if (showTime != null && showTime == true) {
//       return Text(
//         time ?? "Time",
//         style: const TextStyle(
//           fontSize: 12.0,
//           color: Color(0xFF666666),
//         ),
//       );
//     } else {
//       return const Text(
//         "",
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         vertical: 12.0,
//         horizontal: 24.0,
//       ),
//       child: Column(
//         crossAxisAlignment: messageAlignment(),
//         children: [
//           // Padding(
//           //   padding: const EdgeInsets.symmetric(
//           //     vertical: 4.0,
//           //     horizontal: 12.0,
//           //   ),
//           //   child: messageTime(),
//           // ),
//         ],
//       ),
//     );
//   }
// }
