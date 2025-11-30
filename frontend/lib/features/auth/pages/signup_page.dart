import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowaste_app/core/configs/app_vectors.dart';
import 'package:nowaste_app/core/configs/app_colors.dart';
import 'package:nowaste_app/core/extensions/navx.dart';
import 'package:nowaste_app/core/widgets/big_app_icon.dart';
import 'package:nowaste_app/features/auth/cubit/auth_cubit.dart';
import 'package:nowaste_app/features/auth/pages/login_page.dart';
import 'package:nowaste_app/features/auth/widgets/custom_textfield.dart';
import 'package:nowaste_app/features/auth/widgets/glow_background.dart';
import 'package:nowaste_app/features/auth/widgets/or_divider.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup-page';
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final bool isPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUpUser() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().signUp(
        name: _nameController.text.trim(),
        surname: _surnameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BigAppIcon(textColor: Colors.transparent),
        ),
        flexibleSpace: IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.40),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is AuthSignUp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Account created! Login NOW!")),
            );
            context.replaceWith(LoginPage.routeName);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return GlowBackground(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SIGN UP
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      // SizedBox(height: 10),

                      // SMALL TEXT
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          'Enter your personal data to create an account.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      // FULLNAME
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _nameController,
                              hintText: 'First Name',
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              controller: _surnameController,
                              hintText: 'Last Name',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // EMAIL
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.trim().contains('@')) {
                            return 'Email field is invalid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // PASSWORD
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        passwordField: true,
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.length < 8) {
                            return 'Password field is invalid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 4),

                      // SMALL TEXT
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Must be at least 8 characters.',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      // CREATE ACCOUNT
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: ElevatedButton(
                          onPressed: signUpUser,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                27,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightBackground,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // OrDivider
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: OrDivider(),
                      ),

                      // ICONS
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.googleIcon,
                                  width: 37,
                                ),
                              ),
                            ),
                            SizedBox(width: 60),
                            Center(
                              child: SvgPicture.asset(
                                AppVectors.appleIcon,
                                // color:
                                //     Theme.of(context).brightness ==
                                //             Brightness.dark
                                //         ? Colors.white
                                //         : Colors.black,
                                width: 37,
                                // color: Colors.white,
                                colorFilter: ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ALREADY HAVE AN ACCOUNT
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already Have An Account? ',
                              style: TextStyle(
                                // color:
                                //     Theme.of(context).brightness ==
                                //             Brightness.dark
                                //         ? Colors.white
                                //         : Colors.black,
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                context.replaceWith(
                                  LoginPage.routeName,
                                );
                              },
                              child: Text(
                                'Sign In ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
