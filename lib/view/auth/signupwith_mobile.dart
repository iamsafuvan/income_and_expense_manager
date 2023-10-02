import 'package:expense_tracker/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SignUpWithMobile extends StatelessWidget {
  SignUpWithMobile({super.key});

  

  final TextEditingController mobileNumberController =
      TextEditingController(text: '+91');

  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthServiceProvider>(
      builder: (context, value, child) {
        void sendPhoneNumber() {
          String phoneNumber = mobileNumberController.text.trim();
          if (phoneNumber.isNotEmpty) {
            value.boolLoading();
            AuthServiceProvider().signInWithPhone(context, phoneNumber);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Enter your phone Number'),
              ),
            );
          }
          value.boolLoading();
        }

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
              'SignUp with Mobile',
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
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Enter your Mobile Number and \nWe will send you OTP to Verify.',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 200,
                        child: TextField(
                          onChanged: (value1) {
                            value1.length == 13
                                ? value.boolNumberShow(true)
                                : value.boolNumberShow(false);
                          },
                          controller: mobileNumberController,
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                borderSide: BorderSide(width: 0.5)),
                            hintText: 'Mobile No.',
                            hintStyle: GoogleFonts.inter(
                              fontSize: 22,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      value.isNumberShow
                          ? TextButton(
                              onPressed: sendPhoneNumber,
                              child: value.isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Send OTP',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        // color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            )
                          : const SizedBox()
                    ],
                  ),
                  const SizedBox(
                    height: 35,
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
