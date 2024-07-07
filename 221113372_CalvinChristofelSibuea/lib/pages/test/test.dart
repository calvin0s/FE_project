import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/help/square_tile.dart';

// ignore: must_be_immutable
class Test extends StatefulWidget {
  Test({super.key, required this.isi});
  String isi = 'lib/images/background.jpg';

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List<Map<String, dynamic>> rute = [
    {
      "nama": "Guess",
      "arti": "Tebak",
      "img": "lib/images/guess/LOL.png",
      "rute": "/tebak",
    },
    {
      "nama": "Arrange The Sentence",
      "arti": "Susun Kalimat",
      "img": "lib/images/puzzle3.jpg",
      "rute": "/susun",
    },
    {
      "nama": "Quiz",
      "arti": "Kuiz",
      "img": "lib/images/puzzle3.jpg",
      "rute": "/kuis",
    },
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
                (e) {
                return SquareTile(
                  imagePath: "${e["img"]}",
                  text1: "${e["nama"]}",
                  text2: "${e["arti"]}",
                  onTap: () {
                    Navigator.pushNamed(context, e["rute"]);
                  }
                );
                }
              )
            ]
          ),
        ),
      ),
    );
  }
}
