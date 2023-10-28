import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/widgets/color_remover.dart';

class PrivacyPolicyScreen extends StatefulWidget {

  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  PrivacyPolicyScreenState createState() => PrivacyPolicyScreenState();
}

class PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "https://gamescapesinc.com/privacy";
  double progress = 0;
  final urlController = TextEditingController();


  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: kColorPrimary,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title:  const Text('Privacy Policy'),
          backgroundColor: kColorBG,
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
              // TextField(
              //   // decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
              //   controller: urlController,
              //   readOnly: true,
              //   keyboardType: TextInputType.url,
              //   onSubmitted: (value) {
              //     var url = Uri.parse(value);
              //     if (url.scheme.isEmpty) {
              //       url = Uri.parse("https://www.google.com/search?q=" + value);
              //     }
              //     webViewController?.loadUrl(urlRequest: URLRequest(url: url));
              //   },
              // ),
              Expanded(
                child: Stack(
                  children: [
                    InAppWebView(
                      key: webViewKey,
                      initialUrlRequest: URLRequest(
                          url: Uri.parse("https://gamescapesinc.com/privacy")
                      ),
                      initialOptions: options,
                      pullToRefreshController: pullToRefreshController,
                      onWebViewCreated: (controller) {
                        webViewController = controller;
                      },
                      onLoadStart: (controller, url) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                          print('onLoadStart');
                          print(url);
                        });
                      },
                      androidOnPermissionRequest:
                          (controller, origin, resources) async {
                        return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT);
                      },
                      shouldOverrideUrlLoading:
                          (controller, navigationAction) async {
                        var uri = navigationAction.request.url!;

                        // if (![
                        //   "http",
                        //   "https",
                        //   "file",
                        //   "chrome",
                        //   "data",
                        //   "javascript",
                        //   "about"
                        // ].contains(uri.scheme)) {
                        //   if (await canLaunch(url)) {
                        //     // Launch the App
                        //     await launch(
                        //       url,
                        //     );
                        //     // and cancel the request
                        //     return NavigationActionPolicy.CANCEL;
                        //   }
                        // }

                        return NavigationActionPolicy.ALLOW;
                      },
                      onLoadStop: (controller, url) async {
                        pullToRefreshController.endRefreshing();
                        print('>>>>>>>>>>onLoadStop');
                        //print(urlController.text);
                        var uri = Uri.parse(this.url);

                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onLoadError: (controller, url, code, message) {
                        pullToRefreshController.endRefreshing();
                        print('onLoadError');
                        print(message);
                      },
                      onProgressChanged: (controller, progress) {
                        if (progress == 100) {
                          pullToRefreshController.endRefreshing();
                        }
                        setState(() {
                          this.progress = progress / 100;
                          urlController.text = url;
                        });
                      },
                      onUpdateVisitedHistory:
                          (controller, url, androidIsReload) {
                        setState(() {
                          this.url = url.toString();
                          urlController.text = this.url;
                        });
                      },
                      onConsoleMessage: (controller, consoleMessage) {
                        print(consoleMessage);
                      },
                    ),
                    progress < 1.0
                        ? LinearProgressIndicator(value: progress)
                        : Container(),
                  ],
                ),
              ),
              // ButtonBar(
              //   alignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     ElevatedButton(
              //       child: Icon(Icons.arrow_back),
              //       onPressed: () {
              //         webViewController?.goBack();
              //       },
              //     ),
              //     ElevatedButton(
              //       child: Icon(Icons.arrow_forward),
              //       onPressed: () {
              //         webViewController?.goForward();
              //       },
              //     ),
              //     ElevatedButton(
              //       child: Icon(Icons.refresh),
              //       onPressed: () {
              //         webViewController?.reload();
              //       },
              //     ),
              //   ],
              // ),
            ])));


  }
}

// import 'package:fitness_app/constants/colors.dart';
// import 'package:fitness_app/widgets/color_remover.dart';
// import 'package:flutter/material.dart';
//
// class TermAndCondition extends StatelessWidget {
//   const TermAndCondition({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kColorBG,
//       appBar: AppBar(
//         backgroundColor: kColorBG,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_sharp),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         title: const Text("Privacy Policy"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ColorRemover(
//           child: ListView(
//             physics:const BouncingScrollPhysics(),
//             children: const [
//               SizedBox(
//                 height: 18.0,
//               ),
//               Text(
//                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                 style: TextStyle(
//                   fontSize: 18.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 18.0,
//               ),
//               Text(
//                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                 style: TextStyle(
//                   fontSize: 18.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
// //
// // import 'src/menu.dart';
// // import 'src/navigation_controls.dart';
// // import 'src/web_view_stack.dart';
// //
// // void main() {
// //   runApp(
// //     MaterialApp(
// //       theme: ThemeData(useMaterial3: true),
// //       home: const WebViewApp(),
// //     ),
// //   );
// // }
// //
// // class WebViewApp extends StatefulWidget {
// //   const WebViewApp({super.key});
// //
// //   @override
// //   State<WebViewApp> createState() => _WebViewAppState();
// // }
// //
// // class _WebViewAppState extends State<WebViewApp> {
// //   late final WebViewController controller;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     controller = WebViewController()
// //       ..loadRequest(
// //         Uri.parse('https://flutter.dev'),
// //       );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Flutter WebView'),
// //         actions: [
// //           NavigationControls(controller: controller),
// //           Menu(controller: controller),
// //         ],
// //       ),
// //       body: WebViewStack(controller: controller),
// //     );
// //   }
// // }