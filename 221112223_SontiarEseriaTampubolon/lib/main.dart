import 'package:english_for_kids/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:english_for_kids/loginpage/login.dart';
import 'package:english_for_kids/models/soal_model.dart';
import 'package:english_for_kids/quiz.dart';
import 'help/square_tile.dart';
import 'pages/animals.dart';
import 'pages/fruits.dart';
import 'pages/alphabets.dart';
import 'pages/numbers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SoalModel(),
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: const Login()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.email, required this.username});
  final String email;
  final String username;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _fontSize = 20.0;
  Color _textColor = Colors.black;
  late String tempemail;
  late String tempusername;

  @override
  void initState() {
    super.initState();
    tempemail = widget.email;
    tempusername = widget.username;
  }

  late final List<Map<String, dynamic>> rute = [
    {
      "nama": "Animals",
      "arti": "Hewan-hewan",
      "img": "lib/images/animals/animals.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Animals(
                      email: tempemail,
                      username: tempusername,
                    )));
      }
    },
    {
      "nama": "Fruits",
      "arti": "Buah-buahan",
      "img": "lib/images/fruits/fruits.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Fruits(
                      email: tempemail,
                      username: tempusername,
                    )));
      }
    },
    {
      "nama": "Alphabet",
      "arti": "Abjad",
      "img": "lib/images/alphabets/alphabets.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Alphabets(
                      email: tempemail,
                      username: tempusername,
                    )));
      }
    },
    {
      "nama": "Numbers",
      "arti": "Angka-angka",
      "img": "lib/images/numbers/numbers.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Numbers(
                      email: tempemail,
                      username: tempusername,
                    )));
      }
    },
    {
      "nama": "Quiz",
      "arti": "Kuis",
      "img": "lib/images/guess/LOL.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuizzScreen(
                      email: tempemail,
                      username: tempusername,
                    )));
      }
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          actions: [
            Tooltip(
              message: 'Click untuk ke halaman profil',
              child: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profilepage(
                                email: widget.email,
                                username: widget.username,
                              )));
                },
                icon: const Icon(Icons.person),
              ),
            ),
          ],
          title: const Text(
            "Home/Beranda",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica',
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Atur Font Size',
                        style:
                            TextStyle(fontSize: _fontSize, color: _textColor)),
                    Tooltip(
                      message: 'Geser untuk mengatur ukuran tulisan',
                      child: Slider(
                        value: _fontSize,
                        min: 10,
                        max: 40,
                        divisions: 6,
                        label: _fontSize.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            _fontSize = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: rute.length,
                  itemBuilder: (context, index) {
                    final e = rute[index];
                    return SquareTile(
                      imagePath: "${e["img"]}",
                      text1: "${e["nama"]}",
                      text2: "${e["arti"]}",
                      onTap: () {
                        e["rute"](context);
                      },
                      fontSize: _fontSize,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
