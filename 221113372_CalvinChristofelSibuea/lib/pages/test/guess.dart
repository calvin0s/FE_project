import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/data/animal.dart';
import 'package:inggris_untuk_anak/data/fruit.dart';
import 'package:inggris_untuk_anak/data/number.dart';
import 'package:inggris_untuk_anak/main.dart';
import 'package:inggris_untuk_anak/models/question.dart';

// ignore: must_be_immutable
class GuessPage extends StatefulWidget {
  GuessPage({
    super.key,
  });
  late List<Question> questions = [];
  @override
  State<GuessPage> createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  TextEditingController controllerAnswer = TextEditingController();
  String currentImage = '';
  String currentAnswer = '';
  String action = 'Next';
  List<String> userAnswer = [];
  int i = 0;
  int i2 = 0;
  int score = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      List all = animalsData + fruitsData + numbersData;
      widget.questions = all
          .map((e) => Question(answer: e["nama"], image: e["gambar"]))
          .toList();

      // Acak pertanyaan
      widget.questions.shuffle();

      // Pastikan `widget.questions` memiliki pertanyaan
      if (widget.questions.isNotEmpty) {
        // Inisialisasi pertanyaan saat ini
        currentImage = widget.questions[i].image;
        currentAnswer = widget.questions[i].answer.toLowerCase();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Guess!'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Within the `FirstRoute` widget
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Main(selectedIndex: 1)),
              );
            },
          ),
        ),
        backgroundColor: Colors.yellow[100],
        body: Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          // padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (i2 / 5),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              Container(
                // Kontainer untuk membatasi dan menyesuaikan ukuran gambar
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(currentImage),
                    fit: BoxFit
                        .contain, // Sesuaikan gambar agar sesuai kontainer
                  ),
                ),
                width: MediaQuery.of(context).size.width -
                    200, // Atur lebar kontainer
                height: MediaQuery.of(context).size.height - 300,
              ),
              const Text(
                "Guess the name!",
                style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: MediaQuery.of(context).size.width - 150,
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(5.0),
                    border: InputBorder.none,
                  ),
                  controller: controllerAnswer,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                    const Size(150.0, 50.0),
                  ),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                ),
                onPressed: () {
                  setState(() {
                    if (controllerAnswer.text.isNotEmpty &&
                        (controllerAnswer.text.toLowerCase() ==
                            currentAnswer)) {
                      score++;
                      userAnswer.add(controllerAnswer.text);
                      if(i < 4) {i++;}
                      i2++;
                      currentImage = widget.questions[i].image;
                      currentAnswer = widget.questions[i].answer.toLowerCase();
                      controllerAnswer.text = '';
                    } else if (controllerAnswer.text.isNotEmpty) {
                      if(i < 4) {i++;}
                      i2++;
                      currentImage = widget.questions[i].image;
                      currentAnswer = widget.questions[i].answer.toLowerCase();
                      controllerAnswer.text = '';
                    }
                  });
                  if (i2 == 5) {
                    Widget okButton = TextButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/home", (_) => false);
                      },
                    );

                    AlertDialog alert = AlertDialog(
                      title: Text("Your score $score/5"),
                      content: const Text("Press OK button to quit"),
                      actions: [
                        okButton,
                      ],
                    );

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
