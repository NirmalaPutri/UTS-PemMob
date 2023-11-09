import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController hasil = TextEditingController();
  double result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            controller: input1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "First Number",
            ),
            style: const TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
          ),
          TextField(
            controller: input2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Second Number",
            ),
            style: const TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  rumus('tambah');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  '+',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  rumus('kurang');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  '-',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  rumus('kali');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'x',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  rumus('bagi');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  '/',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  input1.clear();
                  input2.clear();
                  hasil.clear();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'C',
                  style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
            controller: hasil,
            readOnly: true,
            decoration: const InputDecoration(labelText: 'Result'),
            style: const TextStyle(fontFamily: 'ChakraPetch', fontSize: 24),
          ),
        ]),
      ),
    );
  }

  void rumus(String operasi) {
    double angka1 = double.parse(input1.text);
    double angka2 = double.parse(input2.text);
    double result = 0.0;

    if (operasi == 'tambah') {
      result = angka1 + angka2;
    } else if (operasi == 'kurang') {
      result = angka1 - angka2;
    } else if (operasi == 'kali') {
      result = angka1 * angka2;
    } else if (operasi == 'bagi') {
      if (angka2 != 0) {
        result = angka1 / angka2;
      } else {
        result = 0;
      }
    }

    setState(() {
      hasil.text = result.toString();
    });
  }
}
