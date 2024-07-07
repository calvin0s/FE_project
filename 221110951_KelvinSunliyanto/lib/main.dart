import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yosha/loginpage/login.dart';
import 'package:yosha/models/soal_model.dart';
import 'package:yosha/quiz.dart';
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
      child: const MaterialApp(home: Login()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      "nama": "Fruits",
      "arti": "Buah-buahan",
      "img": "lib/images/fruits/fruits.png",
      "rute": (BuildContext context) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Fruits()));
      }
    },
    {
      "nama": "Alphabet",
      "arti": "Abjad",
      "img": "lib/images/alphabets/alphabets.png",
      "rute": (BuildContext context) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Alphabets()));
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
          )),
          drawer: Drawer(
            backgroundColor: Color.fromARGB(255, 219, 219, 219),
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text("Profile",
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 17)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: const Text("Kelvin Sunliyanto \nkelvinsun@gmail.com"),
                  ),
                  onTap: () {},                
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  indent: 24,
                  endIndent: 24,
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  title: Text("Layout",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 17)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(                     
                      color: Colors.black, 
                      width: 1,
                    ),
                  color: Color.fromARGB(240, 240, 240, 240),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 6, 
                  ),
                    child: Column(
                      children: [          
                        ListTile(
                          leading: Icon(Icons.home),
                          title: const Text("Home",                            
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MyHomePage()));
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.book),
                          title: const Text("Quiz",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => QuizzScreen()));
                          },
                        ), 
                      ],
                    ),
                  ),
                ListTile(
                  title: Text("Others",
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 17)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(                     
                      color: Colors.black, 
                      width: 1,
                    ),
                  color: Color.fromARGB(240, 240, 240, 240),
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 6, 
                  ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: const Text("Settings",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {},
                        ),                 
                        ListTile(
                          leading: Icon(Icons.question_mark),
                          title: const Text("Info",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 190,
                ),
                ListTile(
                  title: const Text("Logout",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                )
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"))),
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
                          e["rute"](context);
                        }),
                  )
                ]),
          )),
    );
  }
}
