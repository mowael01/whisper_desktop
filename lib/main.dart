import 'package:flutter/material.dart';
import 'package:whisper_desktop/pages/home_page.dart';
import 'package:whisper_desktop/pages/login_page.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final routeProvider = Provider((_) => 0);

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whisper Desktop',
      locale: Locale('ar', 'SA'),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
      },

      theme: ThemeData(colorScheme: ColorScheme.light(), useMaterial3: true),
      home: LoginPage(),
    );
  }
}
