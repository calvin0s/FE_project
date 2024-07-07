import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/help/square_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> rute = [
    {
      "nama": "Animals",
      "arti": "Hewan-hewan",
      "img": "lib/images/animals/animals.png",
      "rute": "/hewan"
    },
    {
      "nama": "Alphabets",
      "arti": "Alfabet",
      "img": "lib/images/alphabets/alphabets.png",
      "rute": "/alfabet"
    },
    {
      "nama": "Fruits",
      "arti": "Buah-buahan",
      "img": "lib/images/fruits/fruits.png",
      "rute": "buah"
    },
    {
      "nama": "Numbers",
      "arti": "Angka-angka",
      "img": "lib/images/numbers/numbers.png",
      "rute": "/angka"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                      Navigator.pushNamed(context, e["rute"]);
                    }
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}