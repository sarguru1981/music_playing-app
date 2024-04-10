import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/util/dimen.dart';

import 'package:music_app/widgets/header_container.dart';

import 'package:music_app/widgets/custom_button_widget.dart';

import 'package:music_app/util/color.dart';

import 'bloc/authentication_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = isDarkMode(context) ? Colors.white : Colors.black;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  HeaderContainer("Login"),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: Dimensions.dimen20, vertical: Dimensions.dimen30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _textInput(
                          controller: emailController,
                          hint: "Email",
                          icon: Icons.email,
                          isPassword: false,
                        ),
                        const SizedBox(height: Dimensions.dimen20),
                        _textInput(
                          controller: passwordController,
                          hint: "Password",
                          icon: Icons.vpn_key,
                          isPassword: true,
                        ),
                        const SizedBox(height: Dimensions.dimen50),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listener: (context, state) {
                            if (state is AuthenticationSuccessState) {
                              Navigator.pushReplacementNamed(context, '/home');
                            } else if (state is AuthenticationFailureState) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    content: Text('Something went wrong'),
                                  );
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            return SizedBox(
                              height: Dimensions.dimen50,
                              width: double.infinity,
                              child: CustomButtonWidget(
                                onClick: () {
                                  BlocProvider.of<AuthenticationBloc>(context).add(
                                    SignInUser(
                                      emailController.text.trim(),
                                      passwordController.text.trim(),
                                    ),
                                  );
                                },
                                btnText: state is! AuthenticationLoadingState ? 'LOGIN' : 'LOGGING IN...',
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/authentication');
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.dimen30),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Don't have an account ? ",
                    style: TextStyle(color: textColor,),
                  ),
                  TextSpan(
                    text: "Register",
                    style: TextStyle(color: orangeColors),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textInput({controller, hint, icon, required bool isPassword}) {
    Color textFieldColor = isDarkMode(context) ? Colors.black : Colors.white;
    return Container(
      margin: const EdgeInsets.only(top: Dimensions.dimen10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.dimen20)),
        color: textFieldColor,
      ),
      padding: const EdgeInsets.only(left: Dimensions.dimen10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
        obscureText: isPassword,
      ),
    );
  }
}