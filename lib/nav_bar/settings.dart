import 'package:admob/main.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
class Settings extends StatefulWidget {

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text(
              'Settings',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               ElevatedButton.icon(
                 onPressed: (){
                   MyApp.of(context).changeTheme(ThemeMode.light);
                 },
                  icon: Icon(Icons.highlight,),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                    onPrimary: Colors.blue[300],
                  ),
                  label: Text('Set LighTheme')),
               ElevatedButton.icon(
                 onPressed: (){
                   MyApp.of(context).changeTheme(ThemeMode.dark);
                 },
                  icon: Icon(Icons.lightbulb,),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.black45,
                  ),
                  label: Text('Set DarkTheme')),
             ],
           )
          ],
        ),
      ),
    );
  }
}