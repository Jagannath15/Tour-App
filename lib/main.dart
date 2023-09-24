import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/Screens/Auth_page.dart';
import 'package:tourist_app/Screens/Home.dart';
import 'package:tourist_app/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? login;

  // This widget is the root of your application.
  @override

 

  void initState() {
    // TODO: implement initState
    super.initState();
     login=false;
     getstate();
  }

   void getstate() async{
    SharedPreferences _prefs=await SharedPreferences.getInstance();

    setState(() {
       login=_prefs.getBool("loggedin");
    });
   
  }
  @override
   
    

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'India Tourist App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: bluecolor),
        useMaterial3: true,
      ),
     home: Auth_Page(),
     // home: login==false?Auth_Page():HomePage(),
    );
  }
}

