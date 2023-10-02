import 'package:expense_tracker/view/auth/login_page.dart';
import 'package:expense_tracker/view/auth/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class StartingPage extends StatelessWidget {
  StartingPage({super.key});
  final List<String> images = [
    'assets/images/starting1.png',
    'assets/images/starting2.png',
    'assets/images/starting3.png',
  ];
  final List<String> imageTitles = [
    'Gain Total Control\n of your money',
    'Know where your money goes',
    'Planning ahead',
  ];
  final List<String> subTitles = [
    'Become your own money manager\n and make every cent count',
    'Track your transaction easily, with categories and financial report ',
    'Setup your budget for each category so you in control',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 600,
                child: CarouselSlider.builder(
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  slideIndicator: CircularSlideIndicator(
                    indicatorRadius: 5,
                    currentIndicatorColor: const Color(0xFF7F3DFF),
                  ),
                  slideBuilder: (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              images[index],
                              width: 350,
                              height: 350,
                            ),
                          ),
                          Text(
                            imageTitles[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            subTitles[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Color(0xFF91919F),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 343,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFF7F3DFF),
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFCFCFC),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 343,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Color(0xFFEEE5FF),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF7F3DFF),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
