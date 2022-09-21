import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          children: [
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      size: 18,
                                    )),
                                const Text(
                                  'Register',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 25.h,
                                  width: 56.w,
                                  child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: Icon(
                                          Icons.person,
                                          size: 15.h,
                                        ),
                                        decoration: BoxDecoration(
                                            color: const Color(0xffebebeb),
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        margin: const EdgeInsets.all(25),
                                      ),
                                      Positioned(
                                        top: 1.5.h,
                                        right: 3.0.w,
                                        child: const CircleAvatar(
                                          maxRadius: 15,
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          backgroundColor: Color(0xff1ce5c1),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Full Name",
                        style: TextStyle(
                          color: Color(0xFF8c8c8e),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: "Samantha Smitha",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Email Address",
                        style: TextStyle(
                          color: Color(0xFF8c8c8e),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: "samanthasmitha@gmail.com",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Color(0xFF8c8c8e),
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: "+ 987 654 3210",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Create Password",
                        style: TextStyle(
                          color: Color(0xFF8c8c8e),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        controller: TextEditingController(text: "sabirbugti"),
                        decoration: const InputDecoration(
                          // hintText: "********",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF707070)),
                          ),
                          // hintStyle: TextStyle(
                          //   color: Colors.white,
                          // ),
                        ),
                      ),
                      SizedBox(height: 6.h),
                      MyButton(
                          name: "Register Now",
                          whenpress: () {
                            // Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (ctx) => const CusBottomBar()));
                          }),
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
