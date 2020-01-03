import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rush/page/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor _white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RushB',
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(
              title: "sdd",
            ),
        "/splash": (context) => SplashPage()
      },
      theme: ThemeData(
        primarySwatch: _white,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _width = size.width;
    final _height = size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            width: _width,
            height: _height / 8,
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[Text(":sdsdsdd")],
            ),
          )
        ],
      ),
    );
  }
}
