import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_website/model/eventModel.dart';

class Repository {
  static Future<List<Event>> fetchEvents(String organizationName) async {
    final response = await http.get(
      Uri.parse(
          "https://backend.events.matzsolutions.com/api/user/getOwnerEvents/$organizationName"),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((eventJson) => Event.fromJson(eventJson)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
