import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/help/bottom_nav.dart';
import 'package:inggris_untuk_anak/models/soal_model.dart';
import 'package:inggris_untuk_anak/pages/material/alphabets.dart';
import 'package:inggris_untuk_anak/pages/material/animals.dart';
import 'package:inggris_untuk_anak/pages/test/arrange_word.dart';
import 'package:inggris_untuk_anak/pages/test/guess.dart';
import 'package:inggris_untuk_anak/pages/material/material.dart';
import 'package:inggris_untuk_anak/pages/material/numbers.dart';
import 'package:inggris_untuk_anak/pages/material/fruits.dart';
import 'package:inggris_untuk_anak/pages/test/quiz.dart';
import 'package:inggris_untuk_anak/pages/test/test.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SoalModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/home": (_) => Main(selectedIndex: 0,),
        "/hewan": (_) => const Animals(),
        "/alfabet": (_) => const Alphabets(),
        "/buah": (_) => const Fruits(),
        "/angka": (_) => const Numbers(),  
        "/tebak": (_) => GuessPage(),
        "/susun": (_) => const ArrangeWord(),
        "/kuis": (_) => const QuizzScreen(),
      },
      home: Main(selectedIndex: 0,),
    );
  }
}

class Main extends StatefulWidget {
  Main({super.key, required this.selectedIndex});
  int selectedIndex;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Widget> pages = <Widget>[
    const MyHomePage(),
    Test()
  ];
  
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[widget.selectedIndex],
      bottomNavigationBar: BottomNavBar(selectedIndex: widget.selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}