import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Term And Condition"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ColorRemover(
          child: ListView(
            physics:const BouncingScrollPhysics(),
            children: const [
              SizedBox(
                height: 18.0,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'src/menu.dart';
// import 'src/navigation_controls.dart';
// import 'src/web_view_stack.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const WebViewApp(),
//     ),
//   );
// }
//
// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key});
//
//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }
//
// class _WebViewAppState extends State<WebViewApp> {
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = WebViewController()
//       ..loadRequest(
//         Uri.parse('https://flutter.dev'),
//       );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView'),
//         actions: [
//           NavigationControls(controller: controller),
//           Menu(controller: controller),
//         ],
//       ),
//       body: WebViewStack(controller: controller),
//     );
//   }
// }