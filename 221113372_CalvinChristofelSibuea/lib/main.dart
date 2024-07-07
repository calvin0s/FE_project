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
      theme: ThemeData(useMaterial3: false),
      initialRoute: '/',
      routes: {
        "/home": (_) => Main(
              selectedIndex: 0,
            ),
        "/hewan": (_) => const Animals(),
        "/alfabet": (_) => const Alphabets(),
        "/buah": (_) => const Fruits(),
        "/angka": (_) => const Numbers(),
        "/tebak": (_) => GuessPage(),
        "/susun": (_) => const ArrangeWord(),
        "/kuis": (_) => const QuizzScreen(),
      },
      home: Main(
        selectedIndex: 0,
      ),
    );
  }
}

// ignore: must_be_immutable
class Main extends StatefulWidget {
  Main({super.key, required this.selectedIndex});
  int selectedIndex;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String isi = 'lib/images/background.jpg';
  bool ubah = false;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      MyHomePage(isi: isi),
      Test(isi: isi),
    ];
  }

  List<String> teks = ["Home/Beranda", "Test"];

  List pilihan = ["Theme 1", "Theme 2"];

  // ignore: non_constant_identifier_names
  void Tapped(e) {
    setState(() {
      if (e == pilihan[0]) {
        isi = 'lib/images/background.jpg';
      } else if (e == pilihan[1]) {
        isi = 'lib/images/background2.jpg';
      } else if (e == pilihan[3]) {
        ubah = true;
      }
      pages[0] = MyHomePage(isi: isi);
      pages[1] = Test(isi: isi);
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          teks[widget.selectedIndex],
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica'),
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    ...pilihan.map((e) {
                      if (e.isEmpty) {
                        return const PopupMenuDivider();
                      }
                      return PopupMenuItem(
                          onTap: () => Tapped(e),
                          child: ListTile(
                            leading: const Icon(Icons.photo_size_select_actual),
                            title: Text(e),
                          ));
                    })
                  ])
        ],
      ),
      body: pages[widget.selectedIndex],
      bottomNavigationBar: BottomNavBar(
          selectedIndex: widget.selectedIndex, onItemTapped: _onItemTapped),
    );
  }
}
