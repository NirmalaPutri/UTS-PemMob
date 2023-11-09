import 'package:aplikasi/currencyconverter.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<CurrencyPage> {
  final TextEditingController _controller = TextEditingController();

  void _updateCurrency(double balance, Function(double) callback) {
    setState(() {
      double addedBalance = double.parse(_controller.text);
      balance += addedBalance;
      _controller.clear();
      callback(balance);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CurrencyConverterPage(balanceInRupiah: balance),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Currency",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'IDR TO USD',
              style: TextStyle(
                color: Colors.black,
                fontSize: 58,
                fontFamily: 'ChakraPetch',
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount of Money',
                  border: OutlineInputBorder(),
                ),
                style: const TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Enter the amount of money',
                          style: TextStyle(
                              fontFamily: 'ChakraPetch', fontSize: 20),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'OK',
                              style: TextStyle(
                                  fontFamily: 'ChakraPetch', fontSize: 20),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  _updateCurrency(0, (balance) {});
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                "Convert",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontFamily: 'ChakraPetch',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
