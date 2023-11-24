import 'package:fitness_app/Utils/app_colors.dart';
import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/Utils/modal_progress_hud.dart';
import 'package:fitness_app/screens/AuthenticationScreens/forget_password.dart';
import 'package:fitness_app/screens/AuthenticationScreens/loginBloc/login_bloc.dart';
import 'package:fitness_app/screens/AuthenticationScreens/sign_up_screen.dart';
import 'package:fitness_app/screens/plan_screen/plan_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool visible = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  late LoginBloc _loginBloc;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    // usernameController.text = 'banglatest2@yopmail.com';
    // passwordController.text = '123456';

    // usernameController.text = 'taymoorakbar@outlook.com';
    // passwordController.text = '11111111';

    // usernameController.text = '039a@gmail.com';
    // passwordController.text = '1234567890';

    // usernameController.text = 'cafarac102@balaket.com';
    // passwordController.text = '11111111';

    // usernameController.text = 'admin@gmail.com';
    // passwordController.text = '11111111';

    // usernameController.text = 'djz63810@cuoly.com';
    // passwordController.text = '11111111';

    // usernameController.text = 'beakghvrb@supere.com';
    // passwordController.text = '11111111';

    // usernameController.text = 'bazar@gmail.com';
    // passwordController.text = '11111111';

    // usernameController.text = 'uzair@gmail.com';
    // passwordController.text = '11111111';
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoadingState) {
        } else if (state is ErrorState) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey.shade400,
              textColor: Colors.white,
              fontSize: 12.0);
        } else if (state is InternetErrorState) {
          Fluttertoast.showToast(
              msg: state.error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey.shade400,
              textColor: Colors.white,
              fontSize: 12.0);
        } else if (state is LoginSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const SelectPlanScreen()));
        } else if (state is RefreshState) {}
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ColorRemover(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/5.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: screenSize.height * 0.04,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              // AppGlobal.userID = -1;
                                              // AppGlobal.token = '';
                                              if (AppGlobal
                                                      .dataStoreFromConstantToLDB ==
                                                  'true') {
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const CusBottomBar()),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              } else {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            const SelectPlanScreen()));
                                              }
                                            },
                                            child: const Text('Skip',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: kColorWhite))),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: screenSize.height * 0.10,
                                    // ),
                                    Image.asset(
                                      'assets/images/splash_icon.png',
                                      width: screenSize.width * 0.7,
                                      fit: BoxFit.contain,
                                    ),
                                    //
                                    // Container(
                                    //     alignment: Alignment.center,
                                    //     padding: const EdgeInsets.all(10),
                                    //     child: const Text(
                                    //       'Sign in',
                                    //       style: TextStyle(fontSize: 26),
                                    //     )),
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        child: const Text(
                                          'Sign in to your Fitness account',
                                          style: TextStyle(
                                              color: kColorWhite, fontSize: 18),
                                        )),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: screenSize.height * 0.09,
                                      child: TextField(
                                        controller: usernameController,
                                        decoration: InputDecoration(
                                          floatingLabelStyle: const TextStyle(
                                              color: kColorBlueText),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: const BorderSide(
                                              color: kColorBlueText,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              borderSide: const BorderSide(
                                                color: kColorPrimary,
                                              )),
                                          labelText: 'Email address',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 0),
                                      height: screenSize.height * 0.08,
                                      child: TextField(
                                        obscureText: _isObscure,
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              icon: _isObscure
                                                  ? const Icon(
                                                      Icons.ac_unit_rounded)
                                                  : const Icon(
                                                      Icons.ac_unit_rounded),
                                              onPressed: () {
                                                _isObscure = !_isObscure;
                                                _loginBloc.add(RefreshEvent());
                                              }),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: const BorderSide(
                                              color: kColorBlueText,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              borderSide: const BorderSide(
                                                color: kColorPrimary,
                                              )),
                                          labelText: 'Password',
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Theme(
                                                data: ThemeData(
                                                    unselectedWidgetColor:
                                                        Colors.grey),
                                                child: Checkbox(
                                                  value: rememberMe,
                                                  onChanged: (state) {
                                                    rememberMe = state!;
                                                    if (state == true) {
                                                      // AppGlobal.rememberMe = 'true';
                                                      _loginBloc
                                                          .add(RefreshEvent());
                                                    } else {
                                                      //AppGlobal.rememberMe = 'false';
                                                      _loginBloc
                                                          .add(RefreshEvent());
                                                    }
                                                  },
                                                  activeColor: kColorBlueText,
                                                  checkColor: Colors.white,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                )),
                                            const Text('Keep me signed in',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: kColorBlueText)),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          child: InkWell(
                                            child: const Text(
                                              'Forgot password ?',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ForgetPasswordScreen()));
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.03,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => HomePage()),
                                        // );
                                        if (validate()) {
                                          _loginBloc.add(LoginUser(
                                              username: usernameController.text
                                                  .trim(),
                                              password: passwordController.text
                                                  .trim()));
                                        }
                                      },
                                      child: Container(
                                          height: screenSize.height * 0.065,
                                          width: screenSize.width * 0.90,
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: kColorBlueText,
                                          ),
                                          child: const Center(
                                              child: Text(
                                            'Sign in',
                                            style: TextStyle(
                                                color: kColorWhite,
                                                fontSize: 20),
                                          ))),
                                    ),

                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                    //   children: [
                                    //     Container(
                                    //       height: 1,
                                    //       width: screenSize.width * 0.40,
                                    //       color: kColorFieldsBorders,
                                    //     ),
                                    //     const Text(
                                    //       '  OR  ',
                                    //       style: TextStyle(color: kColorFieldsBorders),
                                    //     ),
                                    //     Container(
                                    //       height: 1,
                                    //       width: screenSize.width * 0.40,
                                    //       color: kColorFieldsBorders,
                                    //     )
                                    //   ],
                                    // ),
                                    // const SizedBox(
                                    //   height: 20,
                                    // ),
                                    // InkWell(
                                    //   onTap: () {},
                                    //   child: Container(
                                    //       height: screenSize.height * 0.065,
                                    //       width: screenSize.width * 0.90,
                                    //       padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    //       decoration: BoxDecoration(
                                    //         border: Border.all(color: kColorFieldsBorders),
                                    //         borderRadius: BorderRadius.circular(6),
                                    //         color: kColorWhite,
                                    //       ),
                                    //       child: Row(
                                    //         mainAxisAlignment: MainAxisAlignment.center,
                                    //         children: [
                                    //           Image.asset(
                                    //             'assets/images/GoogleIcon.png',
                                    //             height: 25,
                                    //             width: 25,
                                    //           ),
                                    //           const Text(
                                    //             '  Sign in with Google',
                                    //             style: TextStyle(
                                    //                 color: Colors.black, fontSize: 20),
                                    //           ),
                                    //         ],
                                    //       )),
                                    // ),
                                    SizedBox(
                                      height: screenSize.height * 0.05,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const Text(
                                          'Does not have account?',
                                          style: TextStyle(
                                              color: kColorWhite,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        SignupScreen()));
                                          },
                                          child: const Text(
                                            ' Sign Up',
                                            style: TextStyle(
                                                color: kColorBlueText,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  bool validate() {
    if (usernameController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: 'Email field is empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    } else if ((!usernameController.text.contains('@') ||
        !usernameController.text.contains('.com'))) {
      Fluttertoast.showToast(
          msg: 'Email format is not valid',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    } else if (passwordController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: 'Password field is empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    }
    return true;
  }
}
