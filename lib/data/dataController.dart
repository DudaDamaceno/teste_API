import 'dart:convert';

import 'package:tela1/data/api.dart';

import '../model/moneyModel.dart';

class DataController{
  final api= API();

  Future<moneyModel?> getMoney() async{
    try{
final response = await api.get("https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL");
    if(response?.statusCode ==200){
      return moneyModel.fromJson(json.decode(json.encode(response?.data))); //montam o modelo conforme o moneyModel
      } 
    } catch (e){
      rethrow;
    }
  }
}