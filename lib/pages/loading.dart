import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'location';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Indonesia', flag: 'indonesia.png', url: 'Asia/Jakarta');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[400],
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 30.0,
        ),
      )
    );
  }
}
