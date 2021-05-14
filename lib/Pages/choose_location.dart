import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime ins = locations[index];
    await ins.getTime();

    // Navigate to home
    Navigator.pop(context, {
      'location': ins.location,
      'flag': ins.flag,
      'time': ins.time,
      'isDaytime': ins.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose location',
          style: TextStyle(color: Colors.grey[200]),
        ),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),

      // body: TextButton(
      //   onPressed: () {
      //     setState(() {
      //       counter++;
      //     });
      //   } ,
      //   child: Text('Counter is $counter'),
      //   style: TextButton.styleFrom(
      //     primary: Colors.grey[200],
      //     backgroundColor: Colors.grey[800],
      //   ),
      // ),

      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
