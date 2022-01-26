import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'view/splash.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
// to set up turn on/off theme data
static _MyAppState of(BuildContext context)=>
 context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
ThemeMode _themeMode= ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    //set screen up and down
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return  MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
  // code for theme data function 
  void changeTheme(ThemeMode themeMode){
    setState(() {
      _themeMode=themeMode;
    });
  }
}