import 'package:e_commerce_electronics/bloc/login/login_bloc.dart';
import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/data/datasources/auth_local_datasource.dart';
import 'package:e_commerce_electronics/data/models/login_request_model.dart';
import 'package:e_commerce_electronics/presentation/pages/auth/register_page.dart';
import 'package:e_commerce_electronics/presentation/pages/home/home_page.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:e_commerce_electronics/presentation/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  final _loginFormKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //add validation for data empty
  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: 250,
            height: 250,
            margin: const EdgeInsets.only(
              top: 100,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_login.png'),
              ),
            ),
          ),
          Text(
            'Login',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Hello, welcome back!',
            style: greyTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.3), // Warna bayangan
                  spreadRadius: 5, // Lebar bayangan
                  blurRadius: 6, // Tingkat blur bayangan
                  offset: const Offset(0, 4), // Offset bayangan (x, y)
                ),
              ],
            ),
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: EMAIL INPUT
                  CustomFormField(
                    title: 'Email Address',
                    obscureText: false,
                    controller: emailController,
                    prefixIcon: const Icon(
                      Icons.email,
                      color: blueColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //NOTE PASSWORD INPUT
                  CustomFormField(
                    title: 'Password',
                    obscureText: _obscureText,
                    controller: passwordController,
                    prefixIcon: const Icon(
                      Icons.key_rounded,
                      color: blueColor,
                    ),
                    sufixIcon: GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) async {
                      if (state is LoginLoaded) {
                        await AuthLocalDatasource().saveAuthData(state.model);
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ), (route) => false);
                      }
                      if (state is LoginFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: redColor,
                            content: Text('Login failed, check your data.'),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return CustomFilledButton(
                        title: 'Login',
                        onPressed: () {
                          if (_loginFormKey.currentState!.validate()) {
                            final model = LoginRequestModel(
                              identifier: emailController.text,
                              password: passwordController.text,
                            );
                            context
                                .read<LoginBloc>()
                                .add(DoLoginEvent(model: model));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: redColor,
                                content: Text('field cannot be empty.'),
                              ),
                            );
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextWidgetButton(
            width: 50,
            title: 'Forgot password?',
            onPressed: () {},
            textStyle: greyTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextWidgetButton(
            width: 50,
            title: 'Continue as a Guest',
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return const HomePage();
              }), (route) => false);
            },
            textStyle: greyTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const RegisterPage();
                  },
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Dont have an account? ',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: bold,
                  ),
                ),
                CustomTextWidgetButton(
                  width: 70,
                  title: 'Register',
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const RegisterPage();
                        },
                      ),
                    );
                  },
                  textStyle: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
