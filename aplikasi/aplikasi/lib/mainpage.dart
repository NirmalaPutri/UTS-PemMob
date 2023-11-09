import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(fontFamily: 'ChakraPetch', fontSize: 28),
        ),
        backgroundColor: Color.fromARGB(255, 5, 158, 146),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Center(
                child: Text(
                  '10:00',
                  style: TextStyle(fontSize: 120, fontFamily: 'ChakraPetch'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 25, top: 25),
                            child: const Text(
                               'City: Gunung Bohong',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'ChakraPetch'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: const Text(
                              'Temperature: 25°C',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'ChakraPetch'),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 25, top: 5),
                            child: const Text(
                              'Condition: Cloudy',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontFamily: 'ChakraPetch'),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: Icon(Icons.cloud,
                                size: 70, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: Column(
                  children: [
                    const Text(
                      'Last Few Days',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'ChakraPetch',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: LineChart(
                        LineChartData(
                          gridData: const FlGridData(show: false),
                          titlesData: const FlTitlesData(show: false),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          minX: 0,
                          maxX: 6,
                          minY: 20,
                          maxY: 35,
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: false,
                              // Color: [const Color.fromARGB(255, 136, 27, 27)],
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(show: false),
                              spots: [
                                const FlSpot(0, 25),
                                const FlSpot(1, 24),
                                const FlSpot(2, 26),
                                const FlSpot(3, 28),
                                const FlSpot(4, 29),
                                const FlSpot(5, 27),
                                const FlSpot(6, 30),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '25°C',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          '24°C',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          '26°C',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          '28°C',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          '29°C',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          '27°C',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Text(
                          '30°C',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
