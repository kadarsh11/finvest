import 'package:finvest/widgets/amount.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;

class TransactionChart extends StatelessWidget {
  const TransactionChart({
    super.key,
  });

  static const chartColor = Color(0xFFDCE4F2);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            _buildChart(),
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: screenWidth - (16 * 2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(2)),
            margin: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 16), // Add bottom padding if needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTimeFrameButton('1W'),
                _buildTimeFrameButton('1M'),
                _buildTimeFrameButton('3M'),
                _buildTimeFrameButton('6M', isSelected: true),
                _buildTimeFrameButton('YTD'),
                _buildTimeFrameButton('1Y'),
                _buildTimeFrameButton('ALL'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChart() {
    return SizedBox(
      height: 240,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: false,
            drawVerticalLine: false,
            verticalInterval: 0.2,
            getDrawingVerticalLine: (value) {
              return const FlLine(
                color: Color(0xFFC1CAE9),
                strokeWidth: 0.5,
              );
            },
          ),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 3),
                const FlSpot(1, 2),
                const FlSpot(2, 4),
                const FlSpot(3, 3),
                const FlSpot(4, 6),
                const FlSpot(5, 3),
                const FlSpot(6, 4),
              ],
              isCurved: true,
              color: const Color.fromARGB(255, 27, 55, 169),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                spotsLine: const BarAreaSpotsLine(
                  show: true,
                  flLineStyle: FlLine(
                    color: Color(0xFFC1CAE9),
                    strokeWidth: 0.5,
                  ),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFB1BFFF),
                    Color(0x00B3C1FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(math.pi / 4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeFrameButton(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 15, 63, 146)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFF071A34),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'BALANCE DUE',
            style: TextStyle(
                color: Color(0xFF697A93), fontSize: 12, letterSpacing: 0.3),
          ),
          SizedBox(height: 8),
          Amount(size: 40, amount: 245781),
        ],
      ),
    );
  }
}
