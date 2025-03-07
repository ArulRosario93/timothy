import 'dart:convert';

import 'package:http/http.dart' as http;

class ServerMethods {

  Future? getRandomVersesFromBibleApi()  async{
      var res = await http.get(
        Uri.parse("https://bible-api.com/?random=1"),
      );

      if (res.statusCode == 200) {
        print("Success");
        return jsonDecode(res.body);
      } else {
        print("Error");
        return null;
      }
  }

  Future? getRandomVersesFromApiEsv({required String book, required String chapter, required String verses}) async {
    var res = await http.get(
      Uri.parse("https://api.esv.org/v3/passage/text/?q=$book+$chapter:3-12",),
      headers: {
        "Authorization": "Token a21ed52ac3ad00f715b678cbf89e0b80a7cae237",
        "Content-Type": "Application/json",
      },
    );

    if (res.statusCode == 200) {
      print("Success");
      return jsonDecode(res.body);
    } else {
      print("Error");
      return null;
    }
  }
}