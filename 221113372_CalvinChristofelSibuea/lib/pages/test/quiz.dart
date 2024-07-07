import 'package:flutter/material.dart';
import 'package:inggris_untuk_anak/data/quiz_data.dart';
import 'package:inggris_untuk_anak/help/quiz_result.dart';
import 'package:inggris_untuk_anak/data/color.dart';
import 'package:inggris_untuk_anak/main.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  // ignore: non_constant_identifier_names
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica'
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Main(selectedIndex: 1)),
              );
            },
          ),
        ),
        backgroundColor: AppColor.pripmaryColor,
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: PageView.builder(
              controller: _controller!,
              onPageChanged: (page) {
                if (page == questions.length - 1) {
                  setState(() {
                    btnText = "See Results";
                  });
                }
                setState(() {
                  answered = false;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Question ${index + 1}/10",
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 80.0,
                      child: Text(
                        "${questions[index].question}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                    for (int i = 0; i < questions[index].answers!.length; i++)
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        margin: const EdgeInsets.only(
                            bottom: 20.0, left: 12.0, right: 12.0),
                        child: RawMaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          fillColor: btnPressed
                              ? questions[index].answers!.values.toList()[i]
                                  ? Colors.green
                                  : Colors.red
                              : AppColor.secondaryColor,
                          onPressed: !answered
                              ? () {
                                  if (questions[index]
                                      .answers!
                                      .values
                                      .toList()[i]) {
                                    score++;
                                    // ignore: avoid_print
                                    print("yes");
                                  } else {
                                    // ignore: avoid_print
                                    print("no");
                                  }
                                  setState(() {
                                    btnPressed = true;
                                    answered = true;
                                  });
                                }
                              : null,
                          child: Text(questions[index].answers!.keys.toList()[i],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              )),
                        ),
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_controller!.page?.toInt() == questions.length - 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ResultScreen(score)));
                        } else {
                          _controller!.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeInExpo);
      
                          setState(() {
                            btnPressed = false;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        shape: const StadiumBorder(),
                        // fillColor: Colors.blue,
                        padding: const EdgeInsets.all(18.0),
                        elevation: 0.0,
                      ),
                      child: Text(
                        btnText,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                );
              },
              itemCount: questions.length,
            )),
      ),
    );
  }
}
