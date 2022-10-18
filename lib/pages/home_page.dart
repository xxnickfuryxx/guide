import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:guide/models/index.dart';
import 'package:guide/models/open_data.dart';
import 'package:guide/pages/chart_page.dart';
import 'package:guide/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Chart? chart;
  List<OpenData>? openDatas;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 48,
          left: 16,
          right: 16,
          bottom: 32,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Valor de abertura: ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    child: const Text(
                      "ver gráfico",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChartPage(
                                  chart: chart!,
                                )),
                      );
                    },
                  ),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                cacheExtent: 3000,
                shrinkWrap: true,
                itemCount: openDatas?.length ?? 0,
                itemBuilder: (context, index) {
                  var openData = (openDatas ?? [])[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        openData.date.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        Utils.moneyFormat(openData.open.toString()),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetch() async {
    Future<Response<Map<String, dynamic>>> invoke = Dio().get(
        "https://query1.finance.yahoo.com/v8/finance/chart/PETR4.SA?region=BR&lang=pt-BR&includePrePost=false&interval=1h&useYfid=true&range=1mo&corsDomain=finance.yahoo.com&.tsrc=financ");
    var response = await invoke;
    var json = response.data!;
    var index = Index.fromJson(json);
    setState(() {
      chart = index.chart;
      var dates = chart?.result?.first.timestamp;
      var quotes = chart?.result?.first.indicators?.quote;
      openDatas = parseToSeries(dates, quotes);
    });
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
