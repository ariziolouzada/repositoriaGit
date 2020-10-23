import 'package:flutter/material.dart';
//import 'package:sprite_chart/sprite_chart_painter.dart';
//import 'package:sprite_chart/sprite_chart_widget.dart';
import 'package:multi_charts/multi_charts.dart';

class Grafico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue[100],
      child: PieChart(
        values: [84.5, 15.5],
        labels: ["Investimento", "Rendimento"],
        labelColor: Theme.of(context).primaryColor,
        showLegend: true,
        separateFocusedValue: true,
        legendTextColor: Theme.of(context).primaryColor,
        sliceFillColors: [
          Colors.deepOrange[200],
          Colors.greenAccent,
          //Colors.pink,
          //Colors.orange,
          //Colors.redAccent,
        ],
        animationDuration: Duration(milliseconds: 1500),
        legendPosition: LegendPosition.Top,
      ),
    );
  }
}

/*
class Grafico extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        //_buildMyLineChart(context),
        _buildMyLineChartTwo(context),
      ],
    );
  }

  Widget _buildMyLineChart(context) {
    Size size = Size(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height / 5 * 1.6);
    var linechart = SpriteChartwidget(
      fixYnum: 0,
      size: size,
      dataList: getListdatatwo(),
    );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      semanticContainer: true,
      color: Colors.white,
      child: linechart,
      clipBehavior: Clip.antiAlias,
    );
  }

  Widget _buildMyLineChartTwo(context) {
    Size size = Size(MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height / 5 * 1.6);
    var linechart = SpriteChartwidget(
      bgColor: Colors.brown,
      xyColor: Colors.white,
      lineWidth: 10,
      lineColor: Colors.white,
      ylabSize: 13,
      xlabSize: 13,
      xlabColor: Colors.white,
      ylabColor: Colors.white,
      zeroPointSize: 13,
      zeroPointColor: Colors.white,
      xywidth: 6,
      fixYnum: 1,
      yNum: 6,
      size: size,
      dataList: getListdatatwo(),
    );
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      semanticContainer: true,
      color: Colors.white,
      child: linechart,
      clipBehavior: Clip.antiAlias,
    );
  }

  List<ChartData> getListdata() {
    return [
      ChartData("1", 1),
      ChartData("q", 2),
      ChartData(" 3", 3),
      ChartData(" 4", 4),
      ChartData(" 5", -2),
      ChartData(" 王", 8),
      ChartData(" 7", -3),
      ChartData(" 无", 1),
      ChartData(" 9", 4),
      ChartData(" 10", -23),
      ChartData(" 11", 5),
      ChartData(" 12", 4),
      ChartData("13", 4.3),
      ChartData(" 14", -102.3),
      ChartData(" 15", 1),
      ChartData(" 16", 4),
      ChartData(" 17", -23),
      ChartData(" 18", 5),
      ChartData(" 19", 4),
    ];
  }

  List<ChartData> getListdatatwo() {
    return [
      /*
      ChartData("01", 1.000),
      ChartData("07", 1.500),
      ChartData("14", 1.900),
      ChartData("21", 1.120),
      ChartData("28", 1.150),

       */
      ChartData("1", 1.00),
      ChartData("2", 1.50),
      ChartData("3", 1.80),
      ChartData("4", 2.0),
      ChartData("5", 2.35),
      ChartData("6", 2.55),
      ChartData("7", 2.80),
      ChartData("8", 3.00),
      ChartData("9", 3.30),
      ChartData("10", 3.55),
      ChartData("11", 4),
      ChartData("12", 4.3),
      /*
      ChartData("q", 0.34),
      ChartData(" 3", 0.001),
      ChartData(" 4", 0.5),
      ChartData(" 5", 0),
      ChartData(" 王", 2),
      ChartData(" 7", -1.05),
      ChartData(" 无", 1),
      ChartData(" 9", 4),
      ChartData(" 10", -23),
      ChartData(" 11", 5),
      ChartData(" 12", 4),
      ChartData("13", 4.3),
      ChartData(" 14", -102.3),
      ChartData("q", 0.34),
      ChartData(" 3", 0.001),
      ChartData(" 4", 0.5),
      ChartData(" 5", 0),
      ChartData(" 王", 2),
      ChartData(" 7", -1.05),
      ChartData(" 无", 1),
      ChartData(" 9", 4),
      ChartData(" 10", -23),
      ChartData(" 11", 5),
      ChartData(" 12", 4),
      ChartData("13", 4.3),
      ChartData(" 14", -102.3),
      ChartData("q", 0.34),
      ChartData(" 3", 0.001),
      ChartData(" 4", 0.5),
      ChartData(" 5", 0),
      ChartData(" 王", 2),
      ChartData(" 7", -1.05),
      ChartData(" 无", 1),
      ChartData(" 9", 4),
      ChartData(" 10", -23),
      ChartData(" 11", 5),
      ChartData(" 12", 4),
      ChartData("13", 4.3),
      ChartData(" 14", -102.3),
      ChartData("q", 0.34),
      ChartData(" 3", 0.001),
      ChartData(" 4", 0.5),
      ChartData(" 5", 0),
      ChartData(" 王", 2),
      ChartData(" 7", -1.05),
      ChartData(" 无", 1),
      ChartData(" 9", 4),
      ChartData(" 10", -23),
      ChartData(" 11", 5),
      ChartData(" 12", 4),
      ChartData("13", 4.3),
      ChartData(" 14", -102.3),
      ChartData("q", 0.34),
      ChartData(" 3", 0.001),
      ChartData(" 4", 0.5),
      ChartData(" 5", 0),
      ChartData(" 王", 2),
      ChartData(" 7", -1.05),
      ChartData(" 无", 1),
      ChartData(" 9", 4),
      ChartData(" 10", -23),
      ChartData(" 11", 5),
      ChartData(" 12", 4),
      ChartData("13", 4.3),
      ChartData(" 14", -102.3),
      ChartData(" 15", 1),
      ChartData(" 16", 4),
      ChartData(" 17", -23),
      ChartData(" 18", 5),
      ChartData(" 19", 4),
      */
    ];
  }
}
*/
