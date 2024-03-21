import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime()async{
    WorldTime newInstance = WorldTime(location:"Johannesburg",url: "Africa/Johannesburg",flag: 'germany.png');
    await newInstance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': newInstance.location,
      'flag': newInstance.flag,
      'time': newInstance.time,
      'isDaytime': newInstance.isDaytime
    });


  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
            child:Text("Loading")
            // SpinKitFadingCube(
            //   color: Colors.white,
            //   size: 50.0,
            // )
        )
    );
  }
  }
