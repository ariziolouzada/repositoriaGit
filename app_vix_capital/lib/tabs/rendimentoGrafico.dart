import 'package:bezier_chart/bezier_chart.dart';
import 'package:flutter/material.dart';

class RendimentoGrafico extends StatelessWidget {
  final fromDate = DateTime(2019, 05, 22);
  final toDate = DateTime.now();

  final date1 = DateTime.now().subtract(Duration(days: 2));
  final date2 = DateTime.now().subtract(Duration(days: 3));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.greenAccent,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width * 0.9,
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
          series: const [
            BezierLine(
              data: const [
                DataPoint<double>(value: 0, xAxis: 0),
                DataPoint<double>(value: 130, xAxis: 5),
                DataPoint<double>(value: 150, xAxis: 10),
                DataPoint<double>(value: 160, xAxis: 15),
                DataPoint<double>(value: 175, xAxis: 20),
                DataPoint<double>(value: 160, xAxis: 25),
                DataPoint<double>(value: 155, xAxis: 30),
                DataPoint<double>(value: 145, xAxis: 35),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Theme.of(context).primaryColor,
            showVerticalIndicator: true,
            backgroundColor: Colors.grey[350],
            snap: false,
            xLinesColor: Theme.of(context).primaryColor,
            bubbleIndicatorColor: Theme.of(context).accentColor,
            //displayLinesXAxis: true,
            //showDataPoints: false,
            bubbleIndicatorLabelStyle: TextStyle(
              fontSize: 12,
            ),
            bubbleIndicatorValueStyle: TextStyle(
              fontSize: 12,
              color: Theme.of(context).primaryColor,
            ),
            displayDataPointWhenNoValue: true,
            yAxisTextStyle: TextStyle(fontSize: 10),
            xAxisTextStyle: TextStyle(fontSize: 10),
            verticalLineFullHeight: false,
          ),
        ),
      ),
    );

/*
    return Container(
      child: Container(
        color: Colors.red,
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          fromDate: fromDate,
          bezierChartScale: BezierChartScale.WEEKLY,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            BezierLine(
              label: "Duty",
              onMissingValue: (dateTime) {
                if (dateTime.day.isEven) {
                  return 15.0;
                }
                return 7.0;
              },
              data: [
                DataPoint<DateTime>(value: 10, xAxis: date1),
                DataPoint<DateTime>(value: 50, xAxis: date2),
              ],
            ),
          ],
          config: BezierChartConfig(
            verticalIndicatorStrokeWidth: 3.0,
            verticalIndicatorColor: Colors.black26,
            showVerticalIndicator: true,
            verticalIndicatorFixedPosition: false,
            backgroundColor: Colors.greenAccent,
            footerHeight: 30.0,
          ),
        ),
      ),
    );
*/
  }

/*
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
  */
}
