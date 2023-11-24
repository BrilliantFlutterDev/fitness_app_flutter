import 'package:fitness_app/Utils/app_colors.dart';
import 'package:fitness_app/Utils/modal_progress_hud.dart';
import 'package:fitness_app/screens/AuthenticationScreens/loginBloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'loginscreen.dart';

class NewPasswordScreen extends StatefulWidget {
  final String email;
  const NewPasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPasswordScreen> {
  FlutterSecureStorage storage = FlutterSecureStorage();

  bool _isObscure = true;
  bool _isObscureConfirmPassword = true;
  bool visible = false;
  final _key = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late LoginBloc _loginBloc;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  bool validate() {
    if (passwordController.text.trim().isEmpty) {
      Fluttertoast.showToast(
          msg: 'Password field is empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 12.0);
      return false;
    } else if (passwordController.text != confirmPasswordController.text) {
      Fluttertoast.showToast(
          msg: 'Both passwords are not same',
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

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoadingState) {
        } else if (state is ErrorState) {
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
          Fluttertoast.showToast(
              msg: 'Password reset Successfully',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.grey.shade400,
              textColor: Colors.white,
              fontSize: 12.0);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: screenSize.height * 0.08,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back)),
                          const Text(
                            '  Back',
                            style: TextStyle(color: Colors.black, fontSize: 21),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height * 0.06,
                      ),
                      Image.asset(
                        'assets/images/NewPasswordLogo.png',
                        height: screenSize.height * 0.2,
                        width: screenSize.height * 0.2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Create new password',
                            style: TextStyle(fontSize: 26),
                          )),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Your new password must be different from the previous used passwords.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kColorDarkGreyText, fontSize: 18),
                          )),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: screenSize.height * 0.08,
                        child: TextField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: _isObscure
                                    ? const Icon(Icons.ac_unit_rounded)
                                    : const Icon(Icons.ac_unit_rounded),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: kColorFieldsBorders,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: kColorPrimary,
                                )),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: screenSize.height * 0.08,
                        child: TextField(
                          obscureText: _isObscureConfirmPassword,
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: _isObscureConfirmPassword
                                    ? const Icon(Icons.ac_unit_rounded)
                                    : const Icon(Icons.ac_unit_rounded),
                                onPressed: () {
                                  setState(() {
                                    _isObscureConfirmPassword =
                                        !_isObscureConfirmPassword;
                                  });
                                }),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(
                                color: kColorFieldsBorders,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: kColorPrimary,
                                )),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (validate()) {}
                        },
                        child: Container(
                            height: screenSize.height * 0.065,
                            width: screenSize.width * 0.90,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: kColorPrimary,
                            ),
                            child: const Center(
                                child: Text(
                              'Save Password',
                              style:
                                  TextStyle(color: kColorWhite, fontSize: 20),
                            ))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
