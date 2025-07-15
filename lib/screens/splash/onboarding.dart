// ignore_for_file: deprecated_member_use

import 'package:chatbox_app/utils/colors.dart';
import 'package:chatbox_app/widgets/primary_button.dart';
import 'package:chatbox_app/widgets/rounded_social_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff43116A), // Deep Purple
              Color.fromARGB(255, 9, 14, 25), // Purple,
            ],
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Center(child: SvgPicture.asset('assets/svgs/Logo_svg.svg')),
          SizedBox(height: 40.h),
          _buildTextWidget(),
          const SizedBox(height: 20),
          _buildSocialLoginButton(),
          const SizedBox(height: 20),
          Center(child: SvgPicture.asset('assets/svgs/OR.svg')),
          const SizedBox(height: 20),
          _buildSignButton(),
          SizedBox(height: 40.h),
          Spacer(),
          _buildLogin(context),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }

  Widget _buildSignButton() =>
      PrimaryButton(onPressed: () {}, label: 'Sign up with email');

  Widget _buildLogin(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/login',
            ); // Adjust the route as needed
          },
          child: Text(
            'Log in',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextWidget() {
    return Text.rich(
      TextSpan(
        text: "Connect \nfriends\n",
        style: const TextStyle(fontSize: 60, color: Colors.white),
        children: [
          TextSpan(
            text: "easily & \nquickly\n",
            style: const TextStyle(
              fontSize: 72,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                'Our chat app is the perfect way to stay \nconnected with friends and family.',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.whiteColor.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(
          backgroundColor: AppColors.whiteColor,
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
          icon: SvgPicture.asset('assets/svgs/Apple.svg'),
        ),
      ],
    );
  }
}
