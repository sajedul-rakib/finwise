import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:finwise/core/widgets/loader.dart';
import 'package:finwise/features/login/presentation/view/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/form_input.dart';
import '../../../signup/presentation/view/signup_screen.dart';
import '../riverpod/login_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  bool _isPasswordVisible = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the login state (Loading, Error, or Data)
    final loginState = ref.watch(loginControllerProvider);

    // Listen for errors to show a SnackBar
    ref.listen<AsyncValue<void>>(loginControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Colors.redAccent,
            ),
          );
        },
      );
    });

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SafeArea(
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cyprusGreen,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              clipBehavior: Clip.hardEdge,
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Form(
                key: _key,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 120),
                      FormInput(
                        controller: _emailController,
                        hintText: "example@gmail.com",
                        labelText: "Username or email",
                        validator: (value) {
                          return value!.isEmpty ? "Enter a valid email" : null;
                        },
                      ),
                      const SizedBox(height: 10),
                      FormInput(
                        controller: _passwordController,
                        labelText: 'Password',
                        hintText: "● ● ● ● ● ● ● ●",
                        validator: (value) {
                          return value!.isEmpty
                              ? "Enter a valid password"
                              : null;
                        },
                        obscureText: _isPasswordVisible,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          child: Icon(
                            _isPasswordVisible ? Icons.lock : Icons.lock_open,
                            color: AppColors.textGreenColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      loginState.isLoading
                          ? Loader()
                          : ElevatedButton(
                              onPressed: () {
                                final email = _emailController.text.trim();
                                final password = _passwordController.text
                                    .trim();

                                if (email.isNotEmpty &&
                                    password.isNotEmpty &&
                                    _key.currentState!.validate()) {
                                  ref
                                      .read(loginControllerProvider.notifier)
                                      .login(email, password);
                                  _key.currentState?.reset();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Please enter email and password",
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                  color: AppColors.textGreenColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                            color: AppColors.textGreenColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightGreen,
                          textStyle: TextStyle(color: AppColors.cyprusGreen),
                        ),

                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.cyprusGreen,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          maximumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            text: 'Use',
                            style: TextStyle(
                              color: AppColors.textGreenColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: ' Fingerprint',
                                style: TextStyle(
                                  color: AppColors.oceanBlue,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: ' to access',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textGreenColor,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'or sign up with',
                        style: TextStyle(
                          color: AppColors.textGreenColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 20,
                        children: [
                          ImageViewer(
                            imagePath: 'assets/images/icons/Facebook.png',
                            width: 35,
                            height: 35,
                          ),
                          ImageViewer(
                            imagePath: 'assets/images/icons/Google.png',
                            width: 35,
                            height: 35,
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          maximumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Don’t have an account? ',
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.leagueSpartan().fontFamily,
                              color: AppColors.textGreenColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  fontFamily:
                                      GoogleFonts.leagueSpartan().fontFamily,
                                  color: AppColors.vividBlue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
