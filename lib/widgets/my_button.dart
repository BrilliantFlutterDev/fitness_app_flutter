import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  final String name;
  final Function()? whenpress;
  const MyButton({
    Key? key,
    required this.name,
    required this.whenpress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: double.infinity,
      child: MaterialButton(
        shape: const StadiumBorder(),
        textColor: Colors.white,
        color: const Color(0xff1ce5c1),
        onPressed: whenpress,
        child: Text(
          name,
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
    );
  }
}
