import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/help/square_tile.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.isi});
  String isi = 'lib/images/background.jpg';

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
      "rute": "/buah"
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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.isi), // Ganti dengan lokasi gambar latar belakang Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                ...rute.map(
                  (e) => SquareTile(
                      imagePath: "${e["img"]}",
                      text1: "${e["nama"]}",
                      text2: "${e["arti"]}",
                      onTap: () {
                        Navigator.pushNamed(context, e["rute"]);
                      }),
                )
              ]
            ),
        ),
      ),
      // ),
    );
  }
}
