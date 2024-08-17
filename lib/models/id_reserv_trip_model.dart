class Idreservetrip{
  int id ;
  Idreservetrip({required this.id});
  factory Idreservetrip.fromJson(jsonData){
    return Idreservetrip(id: jsonData["id"]);
  }
}