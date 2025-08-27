import 'package:flutter/material.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 35, 73, 243),
        ),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
