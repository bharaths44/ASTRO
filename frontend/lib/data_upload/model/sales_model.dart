class SalesData {
  List<ActualSales>? actualSales;
  List<Forecast>? forecast;

  SalesData({this.actualSales, this.forecast});

  SalesData.fromJson(Map<String, dynamic> json) {
    if (json['actual_sales'] != null) {
      actualSales = <ActualSales>[];
      json['actual_sales'].forEach((v) {
        actualSales!.add(ActualSales.fromJson(v));
      });
    }
    if (json['forecast'] != null) {
      forecast = <Forecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(Forecast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (actualSales != null) {
      data['actual_sales'] = actualSales!.map((v) => v.toJson()).toList();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActualSales {
  String? ds;
  double? salesTrend;

  ActualSales({this.ds, this.salesTrend});

  ActualSales.fromJson(Map<String, dynamic> json) {
    ds = json['ds'];
    salesTrend = json['sales_trend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ds'] = ds;
    data['sales_trend'] = salesTrend;
    return data;
  }
}

class Forecast {
  String? ds;
  double? yhat1Trend;

  Forecast({this.ds, this.yhat1Trend});

  Forecast.fromJson(Map<String, dynamic> json) {
    ds = json['ds'];
    yhat1Trend = json['yhat1_trend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ds'] = ds;
    data['yhat1_trend'] = yhat1Trend;
    return data;
  }
}
