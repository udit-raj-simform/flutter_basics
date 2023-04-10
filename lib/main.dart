import 'package:flutter/material.dart';
import 'package:flutter_basics/pages/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Basics",
      onGenerateTitle: function(),
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      // debugShowMaterialGrid: true,
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const Home(),

      // initialRoute: "/appbar",
      // routes: {
      //   '/': (context) => const Home(),
      //   '/appbar': (context) => const AppBarPage(),
      // },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("hi", "IN"),
        Locale("en", "IN"),
        Locale("es", "PE"),
        Locale("en", "US"),
        Locale("fr", "FR"),
      ],
    );
  }

  function() {
    return (context) => "Flutter Basics Generated";
  }
}
