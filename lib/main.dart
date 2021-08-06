import 'package:firebase/firebase.dart';
import 'package:myapp/data_provider/image_provider.dart';
import 'package:myapp/main.dart';
import 'package:myapp/ui/home.dart';
import 'package:myapp/ui/home_copy.dart';
import 'package:myapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializeApp(
  //     apiKey: "AIzaSyCzDqkkyfhImslRRIZSJ9ZbebzDFhlOius",
  //     authDomain: "wedding-portfolio-default-rtdb.firebaseapp.com",
  //     databaseURL: "https://wedding-portfolio-default-rtdb.firebaseio.com",
  //     projectId: "wedding-portfolio",
  //     storageBucket: "wedding-portfolio.appspot.com",
  //     messagingSenderId: "64563111048",
  //     appId: "1:64563111048:web:86c4bb1c8f12d089a62b3d");
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ImgProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with Utils {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeStaggerPage(),
    );
  }
}
