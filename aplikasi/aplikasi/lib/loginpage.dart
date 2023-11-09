import 'package:aplikasi/homepage.dart';
import 'package:aplikasi/navigationpage.dart';
import 'package:aplikasi/registerpage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            "LOGIN",
            style: TextStyle(
              fontSize: 80,
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
                  if (username.text == "rinbee" && pass.text == "5678") {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const NavigationPage();
                    }));
                  } else {
                    username.text = "";
                    pass.text = "";
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "Gagal Login nich",
                            style: TextStyle(
                              fontFamily: 'CakraPetch',
                            ),
                          ),
                          content: const Text(
                            "Username atau password salah.",
                            style: TextStyle(
                              fontFamily: 'CakraPetch',
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                  fontFamily: 'CakraPetch',
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
                  }
                },
                child: Container(
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'ChakraPetch',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ),
              );
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account yet? Sign up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'ChakraPetch',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
