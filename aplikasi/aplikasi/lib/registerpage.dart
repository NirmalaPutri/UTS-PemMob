import 'package:aplikasi/homepage.dart';
import 'package:aplikasi/loginpage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Register(),
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "REGISTER",
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              fontFamily: 'ChakraPetch',
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: username,
            decoration: const InputDecoration(
              labelText: "Username",
            ),
            style: const TextStyle(fontFamily: 'ChakraPetch', fontSize: 20),
          ),
          TextFormField(
            controller: pass,
            decoration: const InputDecoration(
              labelText: "Password",
            ),
            style: const TextStyle(fontFamily: 'ChakraPetch', fontSize: 20),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    disabledForegroundColor: Colors.white.withOpacity(0.38),
                    disabledBackgroundColor: Colors.white.withOpacity(0.12),
                    side: const BorderSide(
                      color: Colors.black,
                    )),
                child: const Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'ChakraPetch',
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomePage();
                  }));
                },
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    disabledForegroundColor: Colors.black.withOpacity(0.38),
                    disabledBackgroundColor: Colors.black.withOpacity(0.12),
                    side: const BorderSide(
                      color: Colors.black,
                    )),
                onPressed: () {
                  if (username.text == "" || pass.text == "") {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Registration Failed",
                            style: TextStyle(
                              fontFamily: 'ChakraPetch',
                            ),
                          ),
                          content: const Text(
                            "Please complete your data.",
                            style: TextStyle(
                              fontFamily: 'ChakraPetch',
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                  fontFamily: 'ChakraPetch',
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  }
                },
                child: const Text(
                  "Confirm",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'ChakraPetch',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
