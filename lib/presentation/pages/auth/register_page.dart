import 'package:e_commerce_electronics/common/theme.dart';
import 'package:e_commerce_electronics/presentation/widgets/buttons.dart';
import 'package:e_commerce_electronics/presentation/widgets/form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController(text: '');
  final usernameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool _obscureText = true;

  final _registerFormKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //add validation for data empty
  bool validate() {
    if (nameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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
                image: AssetImage('assets/images/img_register.png'),
              ),
            ),
          ),
          Text(
            'Register',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Create your account!',
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
              key: _registerFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //NOTE: NAME INPUT
                  CustomFormField(
                    title: 'Full Name',
                    obscureText: false,
                    controller: nameController,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: blueColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  //NOTE: USERNAME INPUT
                  CustomFormField(
                    title: 'Username',
                    obscureText: false,
                    controller: usernameController,
                    prefixIcon: const Icon(
                      Icons.person_2,
                      color: blueColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
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
                  CustomFilledButton(
                    title: 'Register',
                    onPressed: () {
                      if (validate()) {
                        //   context
                        //       .read<AuthBloc>()
                        //       .add(AuthCheckEmail(emailController.text));
                        // } else {
                        //   showCustomSnackbar(
                        //       context, 'Semua field harus diisi.');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                CustomTextWidgetButton(
                  width: 50,
                  title: 'Login',
                  onPressed: () {},
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
