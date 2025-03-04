import 'package:aqui_cliente/models/popup_model.dart';
import 'package:aqui_cliente/utils/api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopUpNotifier with ChangeNotifier {
  bool _show = true;
  bool get show => _show;

  String baseUrl = ApiUtils().baseUrl;
  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  String _successMessage = "";
  String get successMessage => _successMessage;

  bool _requestSucces = false;
  bool get requestSucces => _requestSucces;

  List<PopModel> _imagens;
  List<PopModel> get imagens => _imagens;

  PopUpNotifier() {
    getData();
  }

  Future getData() async {
    setLoading(true);
    Map<String, dynamic> data;
    List<dynamic> list;
    http.Response response = await http.get('$baseUrl/pop_up/buscar_pop_up');
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      _requestSucces = true;
      list = data["mensagem"] as List;
      _imagens = list.map((value) => PopModel.fromJson(value)).toList();
      setLoading(false);
    } else {
      _requestSucces = false;
      _errorMessage = data["mensagem"];
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void hidePopUp() {
    _show = false;
    notifyListeners();
  }
}
