import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeAndExpenseProvider with ChangeNotifier {
  List<String>? transactionData;
  int? balance;
  int? income;
  int? expense;

  getBalance() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? balance = pref.getInt('balance');
    if (balance == null) {
      pref.setInt('balance', 0);
      balance = 0;
    }
    this.balance = balance;
    notifyListeners();
  }

  getIncome() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? income = pref.getInt('income');
    if (income == null) {
      pref.setInt('income', 0);
      income = 0;
    }
    this.income = income;
    notifyListeners();
  }

  getExpense() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? expense = pref.getInt('expense');
    if (expense == null) {
      pref.setInt('expense', 0);
    }

    this.expense = expense;
    notifyListeners();
  }

  getTransactionData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? transactionData = pref.getStringList('transactionData');
    if (transactionData == null) {
      pref.setStringList('transactionData', []);
    }
    this.transactionData = pref.getStringList('transactionData');

    notifyListeners();
  }

  setIncome(addRecentTransaction) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? totalBalance = pref.getInt('balance');
    int? totalIncome = pref.getInt('income');
    List<String>? transactionData;
    pref.setInt(
      'balance',
      (totalBalance! + addRecentTransaction['amount']).toInt(),
    );
    pref.setInt(
      'income',
      (totalIncome! + addRecentTransaction['amount']).toInt(),
    );
    transactionData = pref.getStringList('transactionData');
    transactionData!.insert(0, jsonEncode(addRecentTransaction).toString());
    pref.setStringList('transactionData', transactionData);
    
    notifyListeners();
  }

  setExpense(addRecentTransactionExpense) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? totalBalance = pref.getInt('balance');
    int? totalExpense = pref.getInt('expense');
    List<String>? transactionData;

    pref.setInt('balance',
        (totalBalance! - addRecentTransactionExpense['amount']).toInt());
    pref.setInt('expense',
        (totalExpense! + addRecentTransactionExpense['amount']).toInt());

    transactionData = pref.getStringList('transactionData');
    transactionData!.insert(0, jsonEncode(addRecentTransactionExpense));
    pref.setStringList('transactionData', transactionData);

    notifyListeners();
  }
}
