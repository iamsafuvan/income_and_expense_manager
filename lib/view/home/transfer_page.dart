import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  bool isEnabled = false;
  String categoryValue = 'Shopping';
  List<String> categoryItems = [
    'Shopping',
    'bills',
    'Food',
    'Subscription',
    'Transportation',
  ];
//////////////
  String walletValue = "Wallet";
  List<String> walletItems = [
    'Wallet',
    "UPI",
    "Debit Card",
    "Credit Card",
    "Cash",
  ];

  @override
  Widget build(BuildContext context) {
    showBottomSheet() {
      return showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return SizedBox(
              height: 171,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 107,
                    height: 91,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xffeee5ff),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/camera.png',
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Camera',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.deepPurple,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 107,
                    height: 91,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffeee5ff),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/gallery.png',
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Gallery',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.deepPurple,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          });
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF0077FF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Image.asset(
            'assets/images/arrow.png',
            color: Colors.white,
          ),
        ),
        title: Text("Transfer"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: Color(0xFF0077FF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Opacity(
                      opacity: 0.64,
                      child: Text(
                        'How much?',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: const Color(0xFFFBFBFB),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.currency_rupee,
                          color: Colors.white,
                          size: 60,
                        ),
                        border: InputBorder.none,
                        hintText: '0',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 64,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 24),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "From",
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 20,
                                          color: Colors.grey,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 0.2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 0.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "To",
                                        hintStyle: GoogleFonts.inter(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 0.2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                            width: 0.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: Image.asset(
                                        'assets/images/transaction1.png'),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                            decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: GoogleFonts.inter(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 0.2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          DottedBorder(
                            dashPattern: [4, 5],
                            color: Colors.grey,
                            borderType: BorderType.RRect,
                            // borderPadding: EdgeInsets.all(5),
                            strokeWidth: 0.4,
                            radius: const Radius.circular(15),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: TextButton.icon(
                                  onPressed: showBottomSheet,
                                  icon: Image.asset(
                                    'assets/images/attachment.png',
                                    color: Colors.grey,
                                  ),
                                  label: Text(
                                    'Add attachment',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(0xFF7F3DFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Continue',
                                  style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
