import 'package:flutter/material.dart';
import 'package:projects/main.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.redAccent),
      initialRoute: '/',
      routes: {
        '/':(context)=>Container(),
        'second':(context)=>Container(),
        'third': (context)=> Container()
      },
    );
  }
}

class Routes{

}






