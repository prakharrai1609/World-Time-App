import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = "Loading";

  void setupWorldTime() async {
    WorldTime ins =
        WorldTime(location: 'Jaipur', flag: 'jaipur.png', url: 'Asia/Kolkata');
    await ins.getTime();
    if (ins.time == "Couldn't fetch data from server") {
      ins.isDaytime = true;
    }

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': ins.location,
      'flag': ins.flag,
      'time': ins.time,
      'isDaytime': ins.isDaytime,
    });

    // print(ins.time);
    // setState(() {
    //   time = ins.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

/*How to get api*/

// void getTime() async {
//   // var url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
//   // var response = await get(url);
//   // print(response.body);
//
//   var url = Uri.parse('https://worldtimeapi.org/api/timezone/Asia/Kolkata');
//   var response = await get(url);
//   Map data = jsonDecode(response.body);
//   // print(data);
//   String datetime = data['datetime'];
//   String offset1 = data['utc_offset'].substring(1,3);
//   String offset2 = data['utc_offset'].substring(4);
//
//   DateTime now = DateTime.parse(datetime);
//   now = now.add(Duration(hours: int.parse(offset1) , minutes: int.parse(offset2)));
//   print(now);
//   // print(datetime);
//   // print(offset2);
//
// }
