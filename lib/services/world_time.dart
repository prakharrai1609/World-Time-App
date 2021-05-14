import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    // var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
    // var response = await get(url);
    // print(response.body);

    try {
      var url1 = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      var response = await get(url1);
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));
      // print(now);
      // print(datetime);
      // print(offset2);

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "Couldn't fetch data from server";
    }
  }
}
