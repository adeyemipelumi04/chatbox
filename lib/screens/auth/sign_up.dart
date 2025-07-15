import 'package:chatbox_app/screens/auth/log_in.dart';
import 'package:chatbox_app/utils/colors.dart';
import 'package:chatbox_app/widgets/primary_button.dart';
import 'package:chatbox_app/widgets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final form = GlobalKey<FormState>();
  var enteredEmail = '';
  var enteredPassword = '';
  var enteredName = '';
  var enteredConfirmPassword = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void submit() async {
    final isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      try {
        final userCredential = await firebase.createUserWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );
        print(userCredential);
      } on FirebaseAuthException catch (error) {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Authentication Failed: ${error.message}')),
        );
      }
    }
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
                SizedBox(height: 20),
                _buildHaveAnAccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeIcon() {
    return const Icon(
      Icons.thumb_up_alt_outlined,
      size: 60,
      color: AppColors.primaryColor,
    );
  }

  Widget _buildLoginButton() => PrimaryButton(
    onPressed: () {
      submit();
    },
    label: 'Sign Up',
  );

  Widget _buildWelcomeText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Hello, Welcome to ChatBox\n',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(
            text:
                'Chat with friends and family today\nby joining our chat app.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.primaryColor2,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Form(
      key: form,
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomTextFormField(
            label: "Name",
            controller: nameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            suffixIcon: const Icon(
              Icons.person_outline,
              color: AppColors.primaryColor2,
            ),
            onSaved: (value) {
              enteredName = value!;
              return null;
            },
          ),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: 'Email Address',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null ||
                  value.trim().isEmpty ||
                  !value.contains('@')) {
                return 'Please enter a vaild email address';
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
                return 'Please enter your password';
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
          const SizedBox(height: 40),
          CustomTextFormField(
            label: "Confirm Password",
            controller: confirmPasswordController,
            obscureText: true,
            validator: (value) {
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
            suffixIcon: const Icon(
              Icons.lock_outline,
              color: AppColors.primaryColor2,
            ),
            onSaved: (value) {
              enteredConfirmPassword = value!;
              return null;
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildHaveAnAccount(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Already have an account? ',
        style: TextStyle(color: AppColors.primaryColor2, fontSize: 16),
      ),
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: const Text(
          'Log In',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor2,
          ),
        ),
      ),
    ],
  );
}
