import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/help/square_tile.dart';
import 'package:inggris_untuk_anak/models/soal_model.dart';
import 'package:inggris_untuk_anak/pages/alphabets.dart';
import 'package:inggris_untuk_anak/pages/animals.dart';
import 'package:inggris_untuk_anak/pages/arrange_word.dart';
import 'package:inggris_untuk_anak/pages/guess.dart';
import 'package:inggris_untuk_anak/pages/numbers.dart';
import 'package:inggris_untuk_anak/pages/fruits.dart';
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
      routes: {
        "/homepage": (_) => MyHomePage(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<Map<String, dynamic>> rute = [
    {
      "nama": "Animals",
      "arti": "Hewan-hewan",
      "img": "lib/images/animals/animals.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Animals()));
        }
    },
    {
      "nama": "Alphabets",
      "arti": "Alfabet",
      "img": "lib/images/alphabets/alphabets.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Alphabets()));
        }
    },
    {
      "nama": "Fruits",
      "arti": "Buah-buahan",
      "img": "lib/images/fruits/fruits.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Fruits()));
        }
    },
    {
      "nama": "Numbers",
      "arti": "Angka-angka",
      "img": "lib/images/numbers/numbers.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Numbers()));
        }
    },
    {
      "nama": "Guess",
      "arti": "Tebak",
      "img": "lib/images/guess/LOL.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GuessPage()));
        }
    },
    {
      "nama": "Arrange the Word",
      "arti": "Susun Kalimat",
      "img": "lib/images/puzzle3.jpg",
      "rute": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ArrangeWord()));
        }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home/Beranda",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica'),
          )
        ),
        body: Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/images/background.jpg'), // Ganti dengan lokasi gambar latar belakang Anda
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                ...rute.map((e) => SquareTile(
                  imagePath: "${e["img"]}",
                  text1: "${e["nama"]}",
                  text2: "${e["arti"]}",
                    onTap: () {
                      e["rute"](context);
                    }
                  ),
                )
              ]
            ),
          ),
        )
      ),
    );
  }
}
