import 'package:commerce_mobile/compontents/inputfields.dart';
import 'package:commerce_mobile/compontents/passwordfields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Ensures content doesn't overlap with system UI
        child: SingleChildScrollView(
          // Prevents overflow when keyboard is open
          child: Container(
            color: Colors.white,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text(
                  'Log in',
                  style: GoogleFonts.inter(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6C3AAC),
                    letterSpacing: -3,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputFields(
                          label: 'Email',
                          hintText: 'Email',
                          controllerTextField: emailTextField),
                      const SizedBox(height: 35),
                      Text(
                        'Password',
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF766789),
                        ),
                      ),
                      const SizedBox(height: 3),
                      PasswordFields(
                          passlabel: 'Password',
                          hintText: 'Password',
                          controllerTextField: passwordTextField),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Text(
                              'Forgot Password?',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: const Color(0xFFA259FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle login logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFA259FF),
                      minimumSize: const Size.fromHeight(60),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                Center(
                  child: Text(
                    'Or sign in with',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 140, 140, 140),
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Google sign-in logic here
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.purple,
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(60),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 228, 228, 228),
                              width: 1.5),
                        ),
                      ),
                      icon: Image.asset(
                        'assets/images/google_logo_colored.png',
                        height: 45,
                        width: 45,
                      ),
                      label: Text(
                        'Continue with Google',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 99, 99, 99),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
