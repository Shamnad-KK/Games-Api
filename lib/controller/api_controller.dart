import 'package:flutter/material.dart';
import 'package:games_api/model/game_model.dart';
import 'package:games_api/services/api_services.dart';

class ApiController extends ChangeNotifier {
  ApiController() {
    getStudentList();
  }
  bool isLoading = false;
  List<GameModel>? gameList;

  void getStudentList() async {
    isLoading = true;
    notifyListeners();
    gameList = await ApiServices().getGamesList();
    isLoading = false;
    notifyListeners();
  }
}
