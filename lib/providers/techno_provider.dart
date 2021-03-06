import 'package:flutter/cupertino.dart';
import 'package:OpaMind/models/techno.dart';
import 'package:OpaMind/models/techno_response.dart';
import 'package:http/http.dart' as http;

class TechnoProvider extends ChangeNotifier {
  String _baseUrl = "opamind-api.herokuapp.com";

  List<Techno> listaTechnos = [];

  TechnoProvider() {
    print('Ingresando a TechnoProvider');
    this.getOnTechnoList();
  }

  getOnTechnoList() async {
    var url = Uri.http(_baseUrl, '/api/technos', {});
    final response = await http.get(url);
    print(response.body);
    final technoResponse = TechnoResponse.fromJson(response.body);
    listaTechnos = technoResponse.technos;
    notifyListeners();
  }
}
