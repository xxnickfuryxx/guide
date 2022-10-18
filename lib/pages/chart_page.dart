import 'package:flutter/material.dart';
import 'package:guide/models/index.dart';
import 'package:guide/models/open_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({
    required this.chart,
    super.key,
  });

  final Chart chart;

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<OpenData>? openDatas;

  @override
  void initState() {
    super.initState();
    var dates = widget.chart.result?.first.timestamp;
    var quotes = widget.chart.result?.first.indicators?.quote;
    openDatas = parseToSeries(dates, quotes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 48,
            left: 16,
            right: 16,
            bottom: 32,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Gráfico da abertura: ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    child: const Text(
                      "voltar",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              _createChart(widget.chart),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createChart(Chart? chart) {
    if (chart != null) {
      return SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: chart.result?.first.meta?.symbol ?? ""),
          legend: Legend(isVisible: false),
          tooltipBehavior: TooltipBehavior(enable: false),
          series: <ChartSeries<OpenData, String>>[
            LineSeries<OpenData, String>(
                dataSource: openDatas ?? [],
                xValueMapper: (OpenData openData, _) =>
                    openData.date.toString(),
                yValueMapper: (OpenData openData, _) => openData.open,
                name: chart.result?.first.meta?.symbol,
                dataLabelSettings: const DataLabelSettings(isVisible: false))
          ]);
    } else {
      return const SizedBox.shrink();
    }
  }

  List<OpenData> parseToSeries(List<int>? dates, List<Quote>? quotes) {
    List<OpenData> openDatas = [];
    dates?.forEach((date) {
      quotes?.forEach((quote) {
        quote.open?.forEach((open) {
          var openData =
              OpenData(DateTime.fromMillisecondsSinceEpoch(date * 1000), open);
          openDatas.add(openData);
        });
      });
    });

    return openDatas;
  }
}
