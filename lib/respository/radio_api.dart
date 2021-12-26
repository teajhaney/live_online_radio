import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../Models/models.dart';
import 'package:http/http.dart' as http;

class RadioRespository extends ChangeNotifier {
  Future<List<RadioModel>> trendingRadioApi() async {
    var uri = Uri.parse(
        "http://de1.api.radio-browser.info/json/stations/lastclick/1000");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);

    return List<RadioModel>.from(
        responseData.map((data) => RadioModel.fromJson(data)));
  }
// '
// '
// '
// '
// '
// '
// '

  Future<List<RadioModel>> dancingRadioApi() async {
    var uri = Uri.parse(
        "http://de1.api.radio-browser.info/json/stations/bytag/dance");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);

    return List<RadioModel>.from(
        responseData.map((data) => RadioModel.fromJson(data)));
  }

// '
// '
// '
// '
// '
// '
// '
  Future<List<RadioModel>> hipHopRadioApi() async {
    var uri = Uri.parse(
        "http://de1.api.radio-browser.info/json/stations/bytag/hiphop");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);

    return List<RadioModel>.from(
        responseData.map((data) => RadioModel.fromJson(data)));
  }

  // '
// '
// '
// '
// '
// '
// '
  Future<List<RadioModel>> jazzRadioApi() async {
    var uri =
        Uri.parse("http://de1.api.radio-browser.info/json/stations/bytag/jazz");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);

    return List<RadioModel>.from(
        responseData.map((data) => RadioModel.fromJson(data)));
  }

  // '
// '
// '
// '
// '
// '
// '
  Future<List<RadioModel>> rockRadioApi() async {
    var uri =
        Uri.parse("http://de1.api.radio-browser.info/json/stations/bytag/rock");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);

    return List<RadioModel>.from(
        responseData.map((data) => RadioModel.fromJson(data)));
  }

  // '
// '
// '
// '
// '
// '
// '
  Future<List<RadioModel>> rapRadioApi() async {
    var uri =
        Uri.parse("http://de1.api.radio-browser.info/json/stations/bytag/rap");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);

    return List<RadioModel>.from(
        responseData.map((data) => RadioModel.fromJson(data)));
  }

  Future<List<RadioModel>> sportRadioApi() async {
    var uri = Uri.parse(
        "http://de1.api.radio-browser.info/json/stations/bytag/sport");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);

    return List<RadioModel>.from(
        responseData.map((data) => RadioModel.fromJson(data)));
  }
}
