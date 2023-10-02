import 'package:dotted_border/dotted_border.dart';
import 'package:expense_tracker/view_model/income_and_expense_functionality.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ExpensePage extends StatelessWidget {
  
   ExpensePage({super.key});

  TextEditingController expenseAmountController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TimeOfDay currentTime = TimeOfDay.now();

  final addRecentTransaction = {};

  bool isEnabled = false;

  String categoryValue = '';

  List<String> categoryItems = [
    'Shopping',
    'Food',
    'Subscription',
    'Transportation',
  ];

  String walletValue = "";

  List<String> walletItems = [
    'Wallet',
    "UPI",
    "Paypal",
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

    return Consumer<IncomeAndExpenseProvider>(
      builder: (context, value, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xfffd3c4a),
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/images/arrow.png',
                color: Colors.white,
              ),
            ),
            title: Text("Expense"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color(0xfffd3c4a),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
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
                          controller: expenseAmountController,
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
                              DropdownButtonFormField(
                                hint: Text(
                                  'Category',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                elevation: 3,
                                iconSize: 0,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                // value: categoryValue,
                                onChanged: (newValue) {
                                 
                                    categoryValue = newValue.toString();
                                 
                                },
                                items: categoryItems
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Image.asset(
                                      'assets/images/arrowdown.png',
                                      color: const Color(0xff91919f),
                                    ),
                                  ),
                                  filled: true,
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
                              TextFormField(
                                controller: descriptionController,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: Colors.black,
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
                              DropdownButtonFormField(
                                hint: Text(
                                  'Payment',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                                elevation: 3,
                                iconSize: 0,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                // value: walletValue,
                                onChanged: (newValue) {
                                
                                    walletValue = newValue.toString();
                                
                                },
                                items: walletItems
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(13.0),
                                    child: Image.asset(
                                      'assets/images/arrowdown.png',
                                      color: const Color(0xff91919f),
                                    ),
                                  ),
                                  filled: true,
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
                              ListTile(
                                title: Text(
                                  "Repeat",
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text('Repeat Transaction'),
                                trailing: Switch(
                                  inactiveTrackColor: Color(0xffeee5ff),
                                  activeColor: Color(0xff7f3dff),
                                  value: isEnabled,
                                  onChanged: (value) {
                                
                                      isEnabled = value;
                                
                                  },
                                ),
                              ),
                              const SizedBox(
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
                                    onPressed: () {
                                      if (expenseAmountController
                                              .text.isEmpty ||
                                          descriptionController.text.isEmpty ||
                                          categoryValue.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            // width: 380,
                                            behavior: SnackBarBehavior.floating,
                                            elevation: 5,
                                            clipBehavior: Clip.antiAlias,
                                            padding: EdgeInsets.all(15),
                                            content: Text(
                                                'please add all fields...'),

                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        );
                                      } else {
                                        addRecentTransaction['category'] =
                                            categoryValue;
                                        addRecentTransaction['payment'] =
                                            walletValue;
                                        addRecentTransaction['amount'] =
                                            int.parse(
                                                expenseAmountController.text);
                                        addRecentTransaction['description'] =
                                            descriptionController.text;
                                        addRecentTransaction['status'] =
                                            'expense';
                                       
                                        addRecentTransaction['time'] =
                                          DateFormat.jm()
                                              .format(DateTime.now());

                                        value.setExpense(addRecentTransaction);

                                        Navigator.pop(context);
                                      }
                                    },
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
      },
    );
  }
}
