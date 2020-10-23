import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class Grafico4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: BezierChart(
        bezierChartScale: BezierChartScale.CUSTOM,
        xAxisCustomValues: const [0, 1, 2, 3, 4, 5, 6, 7, 8],
        series: const [
          BezierLine(
            lineColor: Colors.blue,
            label: "Capital+Rendto",
            data: const [
              DataPoint<double>(value: 10, xAxis: 0),
              DataPoint<double>(value: 10.3, xAxis: 1),
              DataPoint<double>(value: 10.5, xAxis: 2),
              DataPoint<double>(value: 11, xAxis: 3),
              DataPoint<double>(value: 11.5, xAxis: 4),
              DataPoint<double>(value: 12.2, xAxis: 5),
              DataPoint<double>(value: 12.5, xAxis: 6),
              DataPoint<double>(value: 13.5, xAxis: 7),
              DataPoint<double>(value: 14.1, xAxis: 8),
            ],
          ),
          BezierLine(
            lineColor: Colors.green,
            label: "Rendto",
            data: const [
              DataPoint<double>(value: 0, xAxis: 0),
              DataPoint<double>(value: 0.3, xAxis: 1),
              DataPoint<double>(value: 0.5, xAxis: 2),
              DataPoint<double>(value: 1, xAxis: 3),
              DataPoint<double>(value: 1.5, xAxis: 4),
              DataPoint<double>(value: 2.2, xAxis: 5),
              DataPoint<double>(value: 2.5, xAxis: 6),
              DataPoint<double>(value: 3.5, xAxis: 7),
              DataPoint<double>(value: 4.1, xAxis: 8),
            ],
          ),
        ],
        config: BezierChartConfig(
          verticalIndicatorStrokeWidth: 3.0,
          verticalIndicatorColor: Theme.of(context).accentColor,
          showVerticalIndicator: true,
          backgroundColor: Colors.grey[350],
          snap: false,
        ),
      ),
    );
  }
}
