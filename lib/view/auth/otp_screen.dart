import 'package:expense_tracker/services/auth_service.dart';
import 'package:expense_tracker/view/auth/signupwith_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatelessWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(
      builder: (context, value, child) {
        void verifyOTP(BuildContext context, String userOTP) async {
          AuthServiceProvider().verifyOTP(
            context: context,
            verificationId: verificationId,
            userOTP: userOTP,
          );
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              'Enter your OTP',
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  'Enter OTP',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
               const SizedBox(
                  height: 15,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (val) {
                    if (val.length == 6) {
                      value.boolLoading();
                      print('verifying OTP...');
                      verifyOTP(context, val.trim());
                    } else {
                      value.boolLoading();
                    }
                  },
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintText: '___  ___  ___  ___  ___  ___',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 22,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                value.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpWithMobile(),
                            ),
                          );
                        },
                        child: Text(
                          'Resend OTP',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            // color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
