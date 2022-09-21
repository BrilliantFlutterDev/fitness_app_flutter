import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: false,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: SafeArea(
        child: ColorRemover(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/5.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xff1c1b20),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // RichText(
                            //   text: TextSpan(
                            //     text: 'Sign in\t',
                            //     style: const TextStyle(
                            //       fontFamily: "Bebas",
                            //       fontSize: 20,
                            //     ),
                            //     children: <InlineSpan>[
                            //       WidgetSpan(
                            //           alignment: PlaceholderAlignment.baseline,
                            //           baseline: TextBaseline.alphabetic,
                            //           child: SizedBox(width: 33.w)),
                            //       const TextSpan(
                            //         text: 'ELEMENT',
                            //         style: TextStyle(color: kFirstColor),
                            //       )
                            //     ],
                            //   ),
                            // ),
                            const Spacer(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "It will take less then a minuates",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[300],
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 18.0,
                                  ),
                                  Text(
                                    "Let us know your registered emmail address & we will\nguide you to reset your password",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[300],
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    AppBar(
                      // leading: Icon(Icons.arrow_back_ios),
                      title: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                     
                              },
                              child: const Icon(Icons.arrow_back_ios)),
                          const Text('Forget Password'),
                        ],
                      ),
                      backgroundColor: Colors.transparent,
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your register email address",
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.5),
                          ),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      MyButton(name: "Submit", whenpress: () {}),
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
}
