import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_machine_test/Styles/styled_fonts.dart';
import 'package:smt_machine_test/Widgets/custom_button.dart';
import 'package:smt_machine_test/Widgets/custom_gradient_background.dart';
import 'package:smt_machine_test/Widgets/custom_input_field.dart';

import '../Constants/assets.dart';
import '../Controllers/login_controllers.dart';
import '../Utils/show_toaster_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginControllers _loginControllers;
  bool _agreeToTC = false;

  @override
  void initState() {
    super.initState();
    _loginControllers = Get.put(LoginControllers());
  }

  @override
  void dispose() {
    _loginControllers.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradientBackground(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                // Logo Section
                Center(
                  child: Image.asset(
                    Assets.logo,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 30),
                // Login Card
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const StyledHeadingText(
                        text: "Sign in to your Account",
                        fontSize: 32,
                        maxLines: 2,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF650ea0),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Enter Your Details",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF650ea0),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomInputField(
                        label: "Email",
                        hint: "Enter your email",
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: _loginControllers.emailController,
                        onChanged: (val) {},
                        onSubmitted: (val) {},
                        isRequired: true,
                      ),
                      const SizedBox(height: 20),
                      CustomInputField(
                        label: "Password",
                        hint: "Enter your password",
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        controller: _loginControllers.passwordController,
                        onChanged: (val) {},
                        onSubmitted: (val) {},
                        isPassword: true,
                        isRequired: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 0.9,
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                value: _agreeToTC,
                                onChanged: (val) {
                                  setState(() {
                                    _agreeToTC = val ?? false;
                                  });
                                },
                                activeColor: const Color(0xFF650ea0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "By continuing I Agree to the ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                                children: [
                                  TextSpan(
                                    text: "T&C Privacy Policy",
                                    style: TextStyle(
                                      color: Color(0xFF650ea0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: " and "),
                                  TextSpan(
                                    text: "Advisor Agreement",
                                    style: TextStyle(
                                      color: Color(0xFF650ea0),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: CustomButton(
                          buttonText: "Sign In",
                          buttonColor: const Color(0xFF650ea0),
                          borderRadius: 30,
                          onTap: () {
                            if (_agreeToTC) {
                              _loginControllers.login(context: context);
                            } else {
                              showToasterMessage(
                                context: context,
                                message:
                                    "Please agree to the terms and conditions",
                                type: ToasterMessageType.error,
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
