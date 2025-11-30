import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nowaste_app/core/configs/app_vectors.dart';
import 'package:nowaste_app/core/extensions/navx.dart';
import 'package:nowaste_app/core/widgets/big_app_icon.dart';
import 'package:nowaste_app/features/auth/cubit/auth_cubit.dart';
import 'package:nowaste_app/features/auth/pages/signup_page.dart';
import 'package:nowaste_app/features/auth/widgets/custom_textfield.dart';
import 'package:nowaste_app/features/auth/widgets/glow_background.dart';
import 'package:nowaste_app/features/auth/widgets/or_divider.dart';
import 'package:nowaste_app/features/home/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  final bool isPasswordVisible = false;
  bool rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
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
          } else if (state is AuthLoggedIn) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome to NoWaste!')),
            );
            context.goAndClear(HomePage.routeName);
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
                      // SIGN IN
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

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
                      SizedBox(height: 20),

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
                      SizedBox(height: 10),

                      // REMEMBER ME && FORGOT PASSWORD
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        crossAxisAlignment:
                            CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap:
                                  () => setState(
                                    () => rememberMe = !rememberMe,
                                  ), // клик по строке
                              borderRadius: BorderRadius.circular(6),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        rememberMe = value ?? false;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 3),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      color: Colors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: Colors.white.withValues(
                                    alpha: 0.9,
                                  ),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // LOGIN BUTTON
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: loginUser,
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
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // OrDivider
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                        ),
                        child: OrDivider(),
                      ),

                      // ICONS
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
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

                      // Not A Member
                      Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not A Member? ',
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
                                  SignUpPage.routeName,
                                );
                              },
                              child: Text(
                                'Register Now',
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
