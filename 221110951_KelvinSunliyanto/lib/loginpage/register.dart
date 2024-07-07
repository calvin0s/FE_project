import 'package:flutter/material.dart';
import 'package:yosha/loginpage/login.dart';
import 'package:yosha/main.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Register",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "user name"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "email",
            )),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "password"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Text("REGISTER")),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Text(
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
