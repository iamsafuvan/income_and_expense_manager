import 'package:expense_tracker/view_model/income_and_expense_functionality.dart';
import 'package:expense_tracker/services/auth_service.dart';
import 'package:expense_tracker/view/widgets/fab_circular.dart';
import 'package:expense_tracker/view/widgets/list_tile.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/category_container.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  int addAmount = 0;

  int totalBalance = 0;

  int index = 0;

  String defaultValue = 'January';

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  void _logOut(BuildContext context) async {
    AuthServiceProvider().signOut(context);
    // Navigator.pop(context);
  }

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
              height: 370,
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: months.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Center(
                      child: Text(
                        months[index],
                        style: GoogleFonts.poppins(fontSize: 20),
                      ),
                    ),
                    onTap: () {
                      defaultValue = months[index];

                      Navigator.pop(context);
                    },
                  );
                }),
              ),
            );
          });
    }

    return Consumer<IncomeAndExpenseProvider>(
      builder: (context, value, child) {
        value.getBalance();
        value.getIncome();
        value.getExpense();
        value.getTransactionData();

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xfffff6e5),
            centerTitle: true,
            leading: const Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 112, 49, 222),
                radius: 15,
                child: CircleAvatar(
                  radius: 18,
                  foregroundImage: AssetImage('assets/images/profile.jpg'),
                ),
              ),
            ),
            title: OutlinedButton.icon(
              onPressed: showBottomSheet,
              icon: const Icon(CupertinoIcons.chevron_down),
              label: Text(
                defaultValue,
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              style: const ButtonStyle(
                iconSize: MaterialStatePropertyAll(18),
                side: MaterialStatePropertyAll(BorderSide.none),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () => _logOut(context),
                  icon: const Icon(
                    CupertinoIcons.bell_fill,
                    color: Color(0xff7f3dff),
                    size: 28,
                  ))
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FabCircularMenu(),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: index,
            onTap: (value) {
              index = value;
            },
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: const TextStyle(
              color: Colors.grey,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/home.png',
                  color: index == 0 ? Colors.deepPurple : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Transaction.png',
                  color: index == 1 ? Colors.deepPurple : Colors.grey,
                ),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/piechart.png',
                  color: index == 2 ? Colors.deepPurple : Colors.grey,
                ),
                label: 'Budget',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/user.png',
                  color: index == 3 ? Colors.deepPurple : Colors.grey,
                ),
                label: 'Profile',
              ),
            ],
          ),
          body: value.expense == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: const BoxDecoration(
                          color: Color(0xfffff6e5),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Account Balance",
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              '₹${value.balance}',
                              style: GoogleFonts.inter(
                                fontSize: 47,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  CategoryContainer(
                                    categoryName: "Income",
                                    categoryAmount: value.income!,
                                    image: 'assets/images/income.png',
                                    color: const Color(0xff00a86b),
                                    iconColor: const Color(0xff00a86b),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CategoryContainer(
                                    categoryName: "Expenses",
                                    categoryAmount: value.expense!,
                                    image: 'assets/images/expenses.png',
                                    color: const Color(0xfffd3c4a),
                                    iconColor: const Color(0xfffd3c4a),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Spend Frequency',
                          style: GoogleFonts.inter(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 169,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            LineChart(
                              LineChartData(
                                minX: 1,
                                maxX: 7.1,
                                minY: 0,
                                maxY: 7,
                                borderData: FlBorderData(show: false),
                                titlesData: const FlTitlesData(show: false),
                                gridData: const FlGridData(show: false),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: const [
                                      FlSpot(0.2, 0.3),
                                      FlSpot(0, 1),
                                      FlSpot(1.8, 2.7),
                                      FlSpot(2.5, 1),
                                      FlSpot(3.5, 4.5),
                                      FlSpot(4.8, 2),
                                      FlSpot(6, 6.8),
                                      FlSpot(6.9, 2),
                                      FlSpot(8, 1.8),
                                    ],
                                    isCurved: true,
                                    barWidth: 6,
                                    color: const Color(0xff7f3dff),
                                    dotData: const FlDotData(
                                      show: false,
                                    ),
                                    belowBarData: BarAreaData(
                                      show: true,
                                      gradient: const LinearGradient(
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topCenter,
                                        colors: [
                                          Color(0xffe8dbfc),
                                          Color(0xffe8dbfc),
                                          Colors.white,
                                        ],
                                      ),
                                    ),
                                    aboveBarData: BarAreaData(show: false),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      DefaultTabController(
                        animationDuration: const Duration(milliseconds: 150),
                        length: 4,
                        child: TabBar(
                          labelColor: const Color(0xFFFCAC12),
                          padding: const EdgeInsets.all(15),
                          unselectedLabelColor: Colors.grey,
                          indicatorPadding: const EdgeInsets.all(6),
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xFFFCEED4),
                          ),
                          tabs: const [
                            Tab(
                              text: 'Today',
                            ),
                            Tab(
                              text: 'Week',
                            ),
                            Tab(
                              text: 'Month',
                            ),
                            Tab(
                              text: 'Year',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transaction",
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            OutlinedButton(
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0),
                                backgroundColor: const MaterialStatePropertyAll(
                                  Color(0xffe8dbfc),
                                ),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'See All',
                                style: GoogleFonts.inter(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                      value.transactionData == null
                          ? const Center(
                              child: Text('No Data'),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: value.transactionData!.length,
                              itemBuilder: ((context, index) {
                                return TransactionList(
                                  data: value.transactionData![index],
                                );
                              }),
                            ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
