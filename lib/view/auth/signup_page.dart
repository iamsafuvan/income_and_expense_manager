// import 'package:expense_tracker/pages/home_page.dart';

import 'package:expense_tracker/models/email_verification.dart';
import 'package:expense_tracker/view/auth/email_verification_page.dart';
import 'package:expense_tracker/view/auth/login_page.dart';
import 'package:expense_tracker/view/auth/signupwith_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController paaswordController = TextEditingController();

  // bool isObscure = false;
  void googleSignIn(BuildContext context) async {
    // String result = 'success';

    await AuthServiceProvider().signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset('assets/images/arrow.png')),
            title: Text(
              'Sign Up',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  TextFormField(
                    // key: _formKey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter the name';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Name',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF91919F),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // key: _formKey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter the email';
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF91919F),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // key: _formKey,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter the password';
                      }
                      return null;
                    },
                    obscureText: value.isObscure,
                    controller: paaswordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          value.boolObscure();
                        },
                        icon: value.isObscure
                            ?const Icon(CupertinoIcons.eye_slash)
                            :const Icon(CupertinoIcons.eye),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF91919F),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Checkbox(
                        side: const BorderSide(
                          color: Colors.deepPurple,
                        ),
                        checkColor: Colors.deepPurple,
                        value: value.isChecked,
                        onChanged: (newValue) {
                          value.boolChecked();
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: ' By signing up, you agree to the ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.29,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of\n Service and Privacy Policy',
                              style: TextStyle(
                                color: Color(0xFF7E3DFF),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                height: 1.29,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFF7F3DFF),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              paaswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                elevation: 5,
                                clipBehavior: Clip.antiAlias,
                                padding: const EdgeInsets.all(15),
                                content:
                                    const Text('please enter all fields...'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          } else {
                            // _signUp();
                            value.boolLoading();
                            var id =
                                await EmailOTP().sendOtp(emailController.text);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmailVerification(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: paaswordController.text,
                                  id: id.toString(),
                                ),
                              ),
                            );
                            value.boolLoading();
                          }
                        },
                        child: value.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Sign Up',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFCFCFC),
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Or with',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF90909F),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () => googleSignIn(context),
                    child: Container(
                      width: 343,
                      height: 56,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFFF1F1FA)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Image.asset('assets/images/google.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Sign Up with Google',
                            style: TextStyle(
                              color: Color(0xFF212224),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => SignUpWithMobile(),
                        ),
                      );
                    },
                    child: Container(
                      width: 343,
                      height: 56,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: const Color.fromARGB(255, 237, 235, 240),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Color(0xFFF1F1FA)),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: Image.asset('assets/images/mobileotp.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Sign Up with Mobile',
                            style: TextStyle(
                              color: Color(0xFF212224),
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF90909F),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF7F3DFF),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
