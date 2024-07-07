import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/help/box.dart';
import 'package:inggris_untuk_anak/main.dart';

class ArrangeWord extends StatefulWidget {
  const ArrangeWord({super.key});

  @override
  State<ArrangeWord> createState() => _ArrangeWordState();
}

class _ArrangeWordState extends State<ArrangeWord> {

  List<Map<String, dynamic>> kalimat = [
    {"soal": "Saya sedang menonton televisi di pagi hari",
    "jawaban": ["I", "am", "watching", "TV", "in", "the", "morning"],
    "pilihan": ["morning", "watching", "he", "the", "bread", "a", "TV", "am", "I", "in"]},
    {"soal": "Mereka sedang memakan pizza",
    "jawaban": ["They", "are", "eating", "a", "pizza"],
    "pilihan": ["They", "eating", "am", "pizza", "a", "fish", "are"]},
  ];
  List<String> jawab = [];
  List<String> sementara = [];

  int skor = 0;

  bool showSecondButton1 = false;
  bool showSecondButton2 = false;
  bool showContent = true;

  int indeks = 0;
  int? selectedChip = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Arrange The Word",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ),
          backgroundColor: Colors.yellow[100],
          body: Container(
            margin: const EdgeInsets.all(18),
            child: Stack(
              children: [
                if(showContent)
                  Positioned(top: 10.0, left: 0, right: 0,
                    child: Text(kalimat[indeks]["soal"],
                      style: const TextStyle(fontSize: 20)
                    )
                  ),
                if(showContent)
                  Positioned(top: 78.0, left: 0, right: 0,
                    child: Row(
                      children: [
                        ...jawab.map((e) => Boxes(teks: e))
                      ],
                    )
                  ),
                if(showContent)
                  Positioned(top: 128.0, left: 0, right: 0,
                    child: Row(
                      children: [
                        ...sementara.map((e) => Boxes(teks: e))
                      ],
                    )
                  ),
                if(showContent)
                  Positioned(top: 110.0, left: 0, right: 0,
                    child: Container(height: 1, color: Colors.black,)
                  ),
                if(showContent)
                  Positioned(top: 160.0, left: 0, right: 0,
                    child: Container(height: 1, color: Colors.black,)
                  ),
                if(showContent)
                  Positioned(top: 200.0, left: 0, right: 0,
                    child: Wrap(
                      spacing: 6.0,
                      children: [
                        ...kalimat[indeks]["pilihan"].map((e) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: FilterChip(
                              label: Text(e,
                                style: const TextStyle(fontSize: 20)),
                              selected: jawab.contains(e),
                              onSelected: (selected) {
                                setState(() {
                                  if (selected) {
                                    jawab.add(e);
                                  } else {
                                    jawab.remove(e);
                                  }
                                });
                              }),
                          );
                        }),
                      ],
                    )
                  ),
                if(showContent)
                  Positioned(top: 360.0, left: 50, right: 50,
                    child: Container(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sementara = kalimat[indeks]["jawaban"];
                            if(jawab.length == sementara.length){
                              showSecondButton1 = true;
                              skor += 1;
                            } else {
                              showSecondButton2 = true;
                            }
                        });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Mengatur warna latar belakang menjadi putih
                          // Anda juga dapat menyesuaikan properti lainnya di sini
                        ),
                        child: const Text('Periksa',
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    )
                  ),
                if(!showContent)
                  Positioned(top: 200.0, left: 80, right: 0,
                    child: Text("Score Anda : ${skor}",
                    style: const TextStyle(fontSize: 30))
                  ),
                if(!showContent)
                  Positioned(top: 260.0, left: 80, right: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: const Text("lanjut"))
                  ),
                if(showSecondButton1 && showContent)
                  Positioned(top: 360.0, left: 50, right: 50,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if(indeks < kalimat.length-1){
                            indeks++;
                            showSecondButton1 = false;
                            jawab.clear();
                            sementara.clear();
                          } else {
                            showContent = false;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Mengatur warna latar belakang menjadi putih
                        // Anda juga dapat menyesuaikan properti lainnya di sini
                      ),
                      child: const Text('Lanjut',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  )
                ),
                if(showSecondButton2 && showContent)
                  Positioned(top: 360.0, left: 50, right: 50,
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if(indeks < kalimat.length-1){
                            indeks++;
                            showSecondButton2 = false;
                            jawab.clear();
                            sementara.clear();
                          } else {
                            showContent = false;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Mengatur warna latar belakang menjadi putih
                        // Anda juga dapat menyesuaikan properti lainnya di sini
                      ),
                      child: const Text('Lanjut',
                        style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                  )
                ),
              ]
          ),
        ),
      ),
    );
  }
}
