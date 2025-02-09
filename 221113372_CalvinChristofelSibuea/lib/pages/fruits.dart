import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/main.dart';
import 'package:inggris_untuk_anak/models/soal_model.dart';
import 'package:provider/provider.dart';

class Fruits extends StatelessWidget {
  const Fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Fruits",
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
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
          ),
          backgroundColor: Colors.yellow[100],
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            child: Consumer<SoalModel>(
            builder: (context, soalModel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    soalModel.fruit[soalModel.count % soalModel.fruit.length]["nama"],
                    style: const TextStyle(fontSize: 60, fontFamily: 'Helvetica'),
                  ),
                  Image.asset(soalModel.fruit[soalModel.count % soalModel.fruit.length]["gambar"],
                    width: 250,
                  ),
                  Text(
                    soalModel.fruit[soalModel.count % soalModel.fruit.length]["arti"],
                    style: const TextStyle(fontSize: 40, fontFamily: 'Helvetica'),
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
                          children: [Icon(Icons.arrow_right), Text("Lanjut")],
                        )
                      ),
                    ],
                  ),
                ]
              );
            })
          )
        ),
    );
  }
}
