import 'package:astro/data_upload/model/sales_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChart extends StatelessWidget {
  final SalesData salesData;

  const SalesChart({super.key, required this.salesData});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final actualSalesColor = isDarkMode ? Colors.lightBlueAccent : Colors.blue;
    final forecastColor = isDarkMode ? Colors.grey : Colors.blueGrey;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        series: <CartesianSeries>[
          LineSeries<ActualSales, DateTime>(
            dataSource: salesData.actualSales!,
            xValueMapper: (ActualSales sales, _) => DateTime.parse(sales.ds!),
            yValueMapper: (ActualSales sales, _) => sales.salesTrend,
            color: actualSalesColor,
            name: 'Actual Sales',
          ),
          LineSeries<Forecast, DateTime>(
            dataSource: salesData.forecast!,
            xValueMapper: (Forecast forecast, _) =>
                DateTime.parse(forecast.ds!),
            yValueMapper: (Forecast forecast, _) => forecast.yhat1Trend,
            color: forecastColor,
            name: 'Forecast',
          ),
        ],
      ),
    );
  }
}
