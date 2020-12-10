import 'dart:convert';
import 'package:art/models/artModel.dart';
import 'package:http/http.dart' as http;

class artRepo {
  Future<artModel> fetchArt(String title) async {
    String apiKey = 'k6hfZ5k3';
    String ApiUrl =
        'https://www.rijksmuseum.nl/api/en/collection?key=$apiKey&title=$title';
    final result = await http.get(ApiUrl);

    if (result.statusCode != 200) throw Exception();

    final data = json.decode(result.body);
    return artModel.fromJson(data);
  }

  Future<List<ArtObjects>> preProcess(String title) async {
    var artModel = await fetchArt(title);
    var artObjects = List<ArtObjects>();
    artModel.artObjects.forEach((element) {
      if (element.hasImage) {
        artObjects.add(element);
      }
    });
    return artObjects;
  }
}
