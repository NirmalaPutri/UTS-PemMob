import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GrafikTab extends StatefulWidget {
  const GrafikTab({super.key});

  @override
  State<GrafikTab> createState() => GrafikTabState();
}

class GrafikTabState extends State<GrafikTab> {
  List<Color> gradientColors = [Colors.green, Colors.yellow];
  int count = 0;
  late List<FlSpot> listData;
  TextEditingController inputController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = [
      const FlSpot(0, 20),
      const FlSpot(1, 34),
      const FlSpot(2, 56),
      const FlSpot(3, 26),
      const FlSpot(4, 67),
      const FlSpot(5, 46),
      const FlSpot(6, 69),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'GRAFIK DATA SENSOR',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.normal,
            color: Color.fromARGB(255, 142, 50, 158),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: inputController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Data Input'),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54),
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 50,
            width: double.maxFinite,
            child: TextButton(
              style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  backgroundColor: const Color.fromARGB(255, 142, 50, 158),
                  foregroundColor: Colors.white),
              onPressed: () {
                double lastData = double.parse(listData.length.toString());
                double valueInput =
                    double.parse(inputController.text.toString());

                try {
                  listData.insert(
                      lastData.toInt(),
                      FlSpot(double.parse(listData.length.toString()),
                          valueInput));
                  setState(() {});
                } catch (e) {
                  print('$e');
                }
              },
              child: const Text('Input'),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('SEP', style: style);
        break;
      case 4:
        text = const Text('OCT', style: style);
        break;
      case 7:
        text = const Text('NOV', style: style);
        break;
      case 10:
        text = const Text('Desember', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 25:
        text = '25%';
        break;
      case 50:
        text = '55%';
        break;
      case 75:
        text = '75%';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 10,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.yellow,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.green,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: listData.length.toDouble() - 1,
      minY: 0,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: listData,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
