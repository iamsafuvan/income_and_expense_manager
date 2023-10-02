
import 'package:expense_tracker/view/home/expense_page.dart';
import 'package:expense_tracker/view/home/income_page.dart';
import 'package:expense_tracker/view/home/transfer_page.dart';
import 'package:fab_circular_menu_plus/fab_circular_menu_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FabCircularMenu extends StatelessWidget {
  const FabCircularMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FabCircularMenuPlus(
        fabColor: Colors.deepPurple,
        ringDiameter: 220,
        ringWidth: 10,
        ringColor: Colors.transparent,
        fabOpenIcon: const Icon(
          Icons.add,
          size: 45,
          color: Colors.white,
        ),
        fabCloseIcon: const Icon(
          Icons.close,
          size: 45,
          color: Colors.white,
        ),
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => IncomePage(),
                ),
              );
            },
            child: const Image(
              image: AssetImage('assets/images/circularincome.jpg'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const TransferPage(),
                  ));
            },
            child: const Image(
              image: AssetImage('assets/images/circulartransfer.jpg'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: ((context) => ExpensePage()),
                ),
              );
            },
            child: const Image(
              image: AssetImage('assets/images/circularexpense.jpg'),
            ),
          ),
        ]);
  }
}
