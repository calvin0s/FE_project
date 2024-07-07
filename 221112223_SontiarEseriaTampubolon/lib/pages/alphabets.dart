import 'package:flutter/material.dart';
import 'package:english_for_kids/main.dart';
import 'package:provider/provider.dart';
import 'package:english_for_kids/models/soal_model.dart';

class Alphabets extends StatelessWidget {
  const Alphabets({super.key, required this.email, required this.username});
  final String email;
  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Alphabets",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Helvetica'),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.read<SoalModel>().reset();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            username: username,
                            email: email,
                          )),
                );
              },
            ),
          ),
          backgroundColor: Colors.yellow[100],
          body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Consumer<SoalModel>(builder: (context, soalModel, child) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        soalModel.alphabet[soalModel.count %
                            soalModel.alphabet.length]["nama"],
                        style: const TextStyle(
                            fontSize: 60, fontFamily: 'Helvetica'),
                      ),
                      Image.asset(
                        soalModel.alphabet[soalModel.count %
                            soalModel.alphabet.length]["gambar"],
                        width: 250,
                      ),
                      Text(
                        soalModel.alphabet[soalModel.count %
                            soalModel.alphabet.length]["lafal"],
                        style: const TextStyle(
                            fontSize: 40, fontFamily: 'Helvetica'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                context.read<SoalModel>().back();
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_left),
                                  Text("Kembali"),
                                ],
                              )),
                          ElevatedButton(
                              onPressed: () {
                                context.read<SoalModel>().next();
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_right),
                                  Text("Lanjut")
                                ],
                              )),
                        ],
                      ),
                    ]);
              }))),
    );
  }
}
