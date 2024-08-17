import 'package:flutter/material.dart';
import 'package:project1univ/models/balancemodel.dart';
import 'package:project1univ/service/getbalanceservice.dart';

class BalanceProvider with ChangeNotifier {
  List<BalanceData>? _balanceData;

  List<BalanceData>? get balanceData => _balanceData;

  Future<void> fetchBalanceData() async {
    _balanceData = await GetBalanceservice().getbalance();
    
    notifyListeners();
  }
}