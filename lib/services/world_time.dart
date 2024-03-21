
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';



class WorldTime{

  late String location;
  late String? time;
  late String? flag;
  late String url;
  bool? isDaytime;

  WorldTime({required this.location, required this.url, this.isDaytime, this.time,this.flag});

  Future<void> getTime() async {

    try{
      // make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch (e) {
      print(e);
      time = 'could not get time';
    }

  }

}