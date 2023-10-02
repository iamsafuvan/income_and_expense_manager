import 'package:expense_tracker/models/email_verification.dart';
import 'package:expense_tracker/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EmailVerification extends StatelessWidget {
  EmailVerification({
    super.key,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  final String name;
  final String email;
  final String password;
  final String id;

  String emailOtp = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(
      builder: (context, value, child) {
        // void signUp() async {}

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('assets/images/arrow.png'),
            ),
            title: Text(
              'Verification',
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Enter your\nVerification Code",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Pinput(
                    onCompleted: (otp) {
                      emailOtp = otp;
                    },
                    defaultPinTheme: PinTheme(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: const Color(0xffE0E2E9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "We send verification code to your\nemail $email. You can\ncheck your inbox.",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'I didn’t received the code? Send again',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 343,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFF7F3DFF),
                    ),
                    child: InkWell(
                      onTap: () async {
                        var verify = await EmailOTP().verifyOtp(id, emailOtp);
                        if (verify == 'success') {
                          value.boolLoading();
                          await AuthServiceProvider()
                              .signUpWithEmailAndPassword(
                                  name, email, password, context);

                          value.boolLoading();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              elevation: 5,
                              clipBehavior: Clip.antiAlias,
                              padding: const EdgeInsets.all(15),
                              content: const Text('Invalid OTP'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        }
                      },
                      child: Center(
                        child: value.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Verify',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFCFCFC),
                                ),
                              ),
                      ),
                    ),
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
