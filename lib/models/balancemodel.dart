class BalanceModel {
  final String message;
  final int status;
  final List<BalanceData> data;
  BalanceModel(
      {required this.data, required this.message, required this.status});
  factory BalanceModel.fromJson(jsonData) {
    List datalist = jsonData["data"];
    List<BalanceData> data =
        datalist.map((e) => BalanceData.fromJson(e)).toList();
    return BalanceModel(
        data: data, message: jsonData["message"], status: jsonData["status"]);
  }
}

class BalanceData {
  final int id;
  final String firstname;
  final String lastname;
  final String balancee;
  final String last_transaction_dat;
  final String email;
  final String phone;
  BalanceData({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.balancee,
    required this.last_transaction_dat,
    required this.email,
    required this.phone,
  });
  factory BalanceData.fromJson(jsonData) {
    return BalanceData(
        id: jsonData["id"],
        firstname: jsonData["FirstName"],
        lastname: jsonData["LastName"],
        balancee: jsonData["balance"],
        last_transaction_dat: jsonData["last_transaction_date"],
        email: jsonData["email"],
        phone: jsonData["phone"]);
  }
}
