import 'package:flutter/material.dart';
import 'package:english_for_kids/loginpage/login.dart';
import 'package:english_for_kids/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Register Succses!"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            username: _usernameController.text,
                            email: _emailController.text,
                          )),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showBanner(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _login() {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _usernameController.text.isEmpty) {
      _showBanner("Please fill in all fields");
    } else if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty) {
      _showAlertDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Register",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            child: TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "user name"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "email",
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "password"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Tooltip(
            message: 'Click to register',
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    print('test');
                    _login();
                  },
                  child: const Text("REGISTER")),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
