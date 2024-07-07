import 'package:flutter/material.dart';
import 'package:yosha/main.dart';
import 'package:yosha/loginpage/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  bool isLoading = false;

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
            "Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "email",
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "password"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(Duration(seconds: 1), () {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  });
                },
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text("LOGIN")),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              children: [
                const Text(
                  "Don't have an account? ",
                  textAlign: TextAlign.center,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(color: Colors.green),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
