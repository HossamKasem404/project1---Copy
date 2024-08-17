import 'dart:convert';

import 'package:project1univ/main.dart';
import 'package:project1univ/models/balancemodel.dart';
import 'package:http/http.dart' as http;

class GetBalanceservice {
  

  Future<List<BalanceData>?> getbalance() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$url/getmyaccount"),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        
        print(responseData["message"]);
        List<BalanceData> balances =[];
        print( responseData["data"][0]["balance"]);
        for(var balance in responseData["data"]){
          
          balances.add(BalanceData.fromJson(balance));

        }
       
        
        return balances ;
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      rethrow;
    }
  }
}