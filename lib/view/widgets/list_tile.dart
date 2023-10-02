import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final String data;
  TransactionList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final recentTransaction = jsonDecode(data);
    String category = recentTransaction['category'];
    String description = recentTransaction['description'];
    String amount = recentTransaction['amount'].toString();
    String status = recentTransaction['status'];
    String time = recentTransaction['time'];

    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Image.asset(
          'assets/images/$category.png',
          // width: 40,
          // height: 40,
        ),
      ),
      title: Text(
        category,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        description,
        style: GoogleFonts.inter(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF91919F),
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          status == 'income'
              ? Text(
                  '+ ₹$amount',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                )
              : Text(
                  '- ₹$amount',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
          Text(
            time,
            style: GoogleFonts.inter(
              color: Color(0xFF90909F),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
