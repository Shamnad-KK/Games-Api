import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:games_api/core/api_end_points.dart';
import 'package:games_api/core/main_urls.dart';
import 'package:games_api/model/game_model.dart';
import 'package:games_api/utils/app_utils.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<GameModel>?> getGamesList() async {
    List<GameModel>? gameList;
    try {
      final url = Uri.parse("${MainUrls.kBaseUrl}${ApiEndPoints.giveAways}");
      final json = await http.get(url);
      if (json.statusCode >= 200 && json.statusCode <= 299) {
        final List result = jsonDecode(json.body);
        gameList = result.map((e) => GameModel.fromJson(e)).toList();
        return gameList;
      }
    } catch (e) {
      AppUtils.showToast("Error occured", Colors.red);
    }
    return null;
  }
}
