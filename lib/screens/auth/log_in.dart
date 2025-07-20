// ignore_for_file: avoid_print

import 'package:chatbox_app/utils/colors.dart';
import 'package:chatbox_app/widgets/primary_button.dart';
import 'package:chatbox_app/widgets/rounded_social_login_button.dart';
import 'package:chatbox_app/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final form = GlobalKey<FormState>();
  var enteredEmail = '';
  var enteredPassword = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit() async {
    final isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
    }
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Authentication Failed')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor2,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          color: AppColors.primaryColor3,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildWelcomeIcon(),
                const SizedBox(height: 20),
                _buildWelcomeText(context),
                const SizedBox(height: 40),
                _buildTextField(),
                const SizedBox(height: 40),
                _buildLoginButton(),
                const SizedBox(height: 40),
                _buildSocialLoginButton(),
                SizedBox(height: 20),
                _buildForgotPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeIcon() {
    return const Icon(
      Icons.lock_outline,
      size: 60,
      color: AppColors.primaryColor,
    );
  }

  Widget _buildLoginButton() => PrimaryButton(
    onPressed: () {
      submit();
    },
    label: 'Log In',
  );

  Widget _buildForgotPassword() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor2,
        ),
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Text(
      'Welcome Back',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildTextField() {
    return Form(
      key: form,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Email Address',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
            suffixIcon: const Icon(
              Icons.email_outlined,
              color: AppColors.primaryColor2,
            ),
            onSaved: (value) {
              enteredEmail = value!;
              return null;
            },
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: "Password",
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.trim().length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
            suffixIcon: const Icon(
              Icons.lock_outline,
              color: AppColors.primaryColor2,
            ),
            onSaved: (value) {
              enteredPassword = value!;
              return null;
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildSocialLoginButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SocialButton(
        backgroundColor: AppColors.primaryColor2,
        onPressed: () {},
        icon: SvgPicture.asset('assets/svgs/Facebook.svg'),
      ),
      SizedBox(width: 20),
      SocialButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svgs/Google.svg'),
      ),
      SizedBox(width: 20),
      SocialButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svgs/apple_svg.svg'),
      ),
    ],
  );
}
