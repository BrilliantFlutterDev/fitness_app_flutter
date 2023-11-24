import 'package:fitness_app/Utils/app_colors.dart';
import 'package:fitness_app/Utils/modal_progress_hud.dart';
import 'package:fitness_app/screens/AuthenticationScreens/loginBloc/login_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<SignupScreen> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  bool _isObscure = true;
  bool _isObscureConfirmPassword = true;
  bool visible = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late LoginBloc _loginBloc;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    getDeviceIP();
  }

  Future<void> getDeviceIP() async {}

  bool validate() {
    if (fullNameController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: 'Full Name field is empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    } else if ((!emailController.text.contains('@') ||
        !emailController.text.contains('.com'))) {
      Fluttertoast.showToast(
          msg: 'Email format is not valid',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    } else if (passwordController.text.trim().length < 8) {
      Fluttertoast.showToast(
          msg: 'Password should contain at least 8 characters.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      Fluttertoast.showToast(
          msg: 'Both passwords are not same',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    } else if (rememberMe == false) {
      Fluttertoast.showToast(
          msg: 'Please accept our policies by checkbox to Signup',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    }
    return true;
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
        } else if (state is SignUpSuccess) {
          Navigator.pop(context);
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
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Skip',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: kColorWhite))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: screenSize.height * 0.05,
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          'Sign up',
                                          style: const TextStyle(fontSize: 26),
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        child: const Text(
                                          'Create your account',
                                          style: TextStyle(
                                              color: kColorBlueText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                    SizedBox(
                                      height: screenSize.height * 0.03,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: screenSize.height * 0.09,
                                      child: TextField(
                                        controller: fullNameController,
                                        keyboardType: TextInputType.name,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        decoration: InputDecoration(
                                          floatingLabelStyle: const TextStyle(
                                              color: kColorBlueText),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: const BorderSide(
                                              color: kColorFieldsBorders,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              borderSide: const BorderSide(
                                                color: kColorBlueText,
                                              )),
                                          labelText: 'Full Name',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: screenSize.height * 0.09,
                                      child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          floatingLabelStyle: const TextStyle(
                                              color: kColorBlueText),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: const BorderSide(
                                              color: kColorFieldsBorders,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              borderSide: const BorderSide(
                                                color: kColorBlueText,
                                              )),
                                          labelText: 'Email',
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
                                          floatingLabelStyle: const TextStyle(
                                              color: kColorBlueText),
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
                                              color: kColorFieldsBorders,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              borderSide: const BorderSide(
                                                color: kColorBlueText,
                                              )),
                                          labelText: 'Password',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 20, 10, 0),
                                      height: screenSize.height * 0.09,
                                      child: TextField(
                                        obscureText: _isObscureConfirmPassword,
                                        controller: confirmPasswordController,
                                        decoration: InputDecoration(
                                          floatingLabelStyle: const TextStyle(
                                              color: kColorBlueText),
                                          suffixIcon: IconButton(
                                              icon: _isObscureConfirmPassword
                                                  ? const Icon(
                                                      Icons.ac_unit_rounded)
                                                  : const Icon(
                                                      Icons.ac_unit_rounded),
                                              onPressed: () {
                                                _isObscureConfirmPassword =
                                                    !_isObscureConfirmPassword;
                                                _loginBloc.add(RefreshEvent());
                                              }),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                            borderSide: const BorderSide(
                                              color: kColorFieldsBorders,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              borderSide: const BorderSide(
                                                color: kColorBlueText,
                                              )),
                                          labelText: 'Confirm Password',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                        _loginBloc.add(
                                                            RefreshEvent());
                                                      } else {
                                                        //AppGlobal.rememberMe = 'false';
                                                        _loginBloc.add(
                                                            RefreshEvent());
                                                      }
                                                    },
                                                    activeColor: kColorBlueText,
                                                    checkColor: Colors.white,
                                                    materialTapTargetSize:
                                                        MaterialTapTargetSize
                                                            .padded,
                                                  )),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'By creating an account, I agree to ',
                                                    style: TextStyle(
                                                        color: kColorWhite,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: Row(
                                                      children: const [
                                                        Text(
                                                          'BanglaBazar\'s Terms of Use ',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .blueAccent,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          'and ',
                                                          style: TextStyle(
                                                              color:
                                                                  kColorWhite,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {},
                                                    child: const Text(
                                                      'Privacy Policy.',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (validate()) {
                                          _loginBloc.add(SignUpUser(
                                              username: fullNameController.text
                                                  .trim(),
                                              email:
                                                  emailController.text.trim(),
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
                                            'Sign up',
                                            style: TextStyle(
                                                color: kColorWhite,
                                                fontSize: 20),
                                          ))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        const Text(
                                          'Already have account?',
                                          style: TextStyle(
                                              color: kColorWhite,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            ' Sign in',
                                            style: TextStyle(
                                                color: kColorBlueText,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
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
}
