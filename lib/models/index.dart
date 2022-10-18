class Index {
  Chart? chart;

  Index({
    this.chart,
  });

  Index.fromJson(Map<String, dynamic> json) {
    chart = (json['chart'] as Map<String, dynamic>?) != null
        ? Chart.fromJson(json['chart'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['chart'] = chart?.toJson();
    return json;
  }
}

class Chart {
  List<Result>? result;
  dynamic error;

  Chart({
    this.result,
    this.error,
  });

  Chart.fromJson(Map<String, dynamic> json) {
    result = (json['result'] as List?)
        ?.map((dynamic e) => Result.fromJson(e as Map<String, dynamic>))
        .toList();
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['result'] = result?.map((e) => e.toJson()).toList();
    json['error'] = error;
    return json;
  }
}

class Result {
  Meta? meta;
  List<int>? timestamp;
  Indicators? indicators;

  Result({
    this.meta,
    this.timestamp,
    this.indicators,
  });

  Result.fromJson(Map<String, dynamic> json) {
    meta = (json['meta'] as Map<String, dynamic>?) != null
        ? Meta.fromJson(json['meta'] as Map<String, dynamic>)
        : null;
    timestamp =
        (json['timestamp'] as List?)?.map((dynamic e) => e as int).toList();
    indicators = (json['indicators'] as Map<String, dynamic>?) != null
        ? Indicators.fromJson(json['indicators'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['meta'] = meta?.toJson();
    json['timestamp'] = timestamp;
    json['indicators'] = indicators?.toJson();
    return json;
  }
}

class Meta {
  String? currency;
  String? symbol;
  String? exchangeName;
  String? instrumentType;
  int? firstTradeDate;
  int? regularMarketTime;
  int? gmtoffset;
  String? timezone;
  String? exchangeTimezoneName;
  double? regularMarketPrice;
  double? chartPreviousClose;
  double? previousClose;
  int? scale;
  int? priceHint;
  CurrentTradingPeriod? currentTradingPeriod;
  List<dynamic>? tradingPeriods;
  String? dataGranularity;
  String? range;
  List<String>? validRanges;

  Meta({
    this.currency,
    this.symbol,
    this.exchangeName,
    this.instrumentType,
    this.firstTradeDate,
    this.regularMarketTime,
    this.gmtoffset,
    this.timezone,
    this.exchangeTimezoneName,
    this.regularMarketPrice,
    this.chartPreviousClose,
    this.previousClose,
    this.scale,
    this.priceHint,
    this.currentTradingPeriod,
    this.tradingPeriods,
    this.dataGranularity,
    this.range,
    this.validRanges,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currency = json['currency'] as String?;
    symbol = json['symbol'] as String?;
    exchangeName = json['exchangeName'] as String?;
    instrumentType = json['instrumentType'] as String?;
    firstTradeDate = json['firstTradeDate'] as int?;
    regularMarketTime = json['regularMarketTime'] as int?;
    gmtoffset = json['gmtoffset'] as int?;
    timezone = json['timezone'] as String?;
    exchangeTimezoneName = json['exchangeTimezoneName'] as String?;
    regularMarketPrice = json['regularMarketPrice'] as double?;
    chartPreviousClose = json['chartPreviousClose'] as double?;
    previousClose = json['previousClose'] as double?;
    scale = json['scale'] as int?;
    priceHint = json['priceHint'] as int?;
    currentTradingPeriod =
        (json['currentTradingPeriod'] as Map<String, dynamic>?) != null
            ? CurrentTradingPeriod.fromJson(
                json['currentTradingPeriod'] as Map<String, dynamic>)
            : null;
    tradingPeriods = json['tradingPeriods'] as List?;
    dataGranularity = json['dataGranularity'] as String?;
    range = json['range'] as String?;
    validRanges = (json['validRanges'] as List?)
        ?.map((dynamic e) => e as String)
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['currency'] = currency;
    json['symbol'] = symbol;
    json['exchangeName'] = exchangeName;
    json['instrumentType'] = instrumentType;
    json['firstTradeDate'] = firstTradeDate;
    json['regularMarketTime'] = regularMarketTime;
    json['gmtoffset'] = gmtoffset;
    json['timezone'] = timezone;
    json['exchangeTimezoneName'] = exchangeTimezoneName;
    json['regularMarketPrice'] = regularMarketPrice;
    json['chartPreviousClose'] = chartPreviousClose;
    json['previousClose'] = previousClose;
    json['scale'] = scale;
    json['priceHint'] = priceHint;
    json['currentTradingPeriod'] = currentTradingPeriod?.toJson();
    json['tradingPeriods'] = tradingPeriods;
    json['dataGranularity'] = dataGranularity;
    json['range'] = range;
    json['validRanges'] = validRanges;
    return json;
  }
}

class CurrentTradingPeriod {
  Pre? pre;
  Regular? regular;
  Post? post;

  CurrentTradingPeriod({
    this.pre,
    this.regular,
    this.post,
  });

  CurrentTradingPeriod.fromJson(Map<String, dynamic> json) {
    pre = (json['pre'] as Map<String, dynamic>?) != null
        ? Pre.fromJson(json['pre'] as Map<String, dynamic>)
        : null;
    regular = (json['regular'] as Map<String, dynamic>?) != null
        ? Regular.fromJson(json['regular'] as Map<String, dynamic>)
        : null;
    post = (json['post'] as Map<String, dynamic>?) != null
        ? Post.fromJson(json['post'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['pre'] = pre?.toJson();
    json['regular'] = regular?.toJson();
    json['post'] = post?.toJson();
    return json;
  }
}

class Pre {
  String? timezone;
  int? start;
  int? end;
  int? gmtoffset;

  Pre({
    this.timezone,
    this.start,
    this.end,
    this.gmtoffset,
  });

  Pre.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'] as String?;
    start = json['start'] as int?;
    end = json['end'] as int?;
    gmtoffset = json['gmtoffset'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['timezone'] = timezone;
    json['start'] = start;
    json['end'] = end;
    json['gmtoffset'] = gmtoffset;
    return json;
  }
}

class Regular {
  String? timezone;
  int? start;
  int? end;
  int? gmtoffset;

  Regular({
    this.timezone,
    this.start,
    this.end,
    this.gmtoffset,
  });

  Regular.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'] as String?;
    start = json['start'] as int?;
    end = json['end'] as int?;
    gmtoffset = json['gmtoffset'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['timezone'] = timezone;
    json['start'] = start;
    json['end'] = end;
    json['gmtoffset'] = gmtoffset;
    return json;
  }
}

class Post {
  String? timezone;
  int? start;
  int? end;
  int? gmtoffset;

  Post({
    this.timezone,
    this.start,
    this.end,
    this.gmtoffset,
  });

  Post.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'] as String?;
    start = json['start'] as int?;
    end = json['end'] as int?;
    gmtoffset = json['gmtoffset'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['timezone'] = timezone;
    json['start'] = start;
    json['end'] = end;
    json['gmtoffset'] = gmtoffset;
    return json;
  }
}

class Indicators {
  List<Quote>? quote;

  Indicators({
    this.quote,
  });

  Indicators.fromJson(Map<String, dynamic> json) {
    quote = (json['quote'] as List?)
        ?.map((dynamic e) => Quote.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['quote'] = quote?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Quote {
  List<double>? open;
  List<double>? close;
  List<double>? low;
  List<int>? volume;
  List<double>? high;

  Quote({
    this.open,
    this.close,
    this.low,
    this.volume,
    this.high,
  });

  Quote.fromJson(Map<String, dynamic> json) {
    open = (json['open'] as List?)
        ?.map((dynamic e) => (e ?? 0.0) as double)
        .toList();
    close = (json['close'] as List?)
        ?.map((dynamic e) => (e ?? 0.0) as double)
        .toList();
    low = (json['low'] as List?)
        ?.map((dynamic e) => (e ?? 0.0) as double)
        .toList();
    volume = (json['volume'] as List?)
        ?.map((dynamic e) => (e ?? 0) as int)
        .toList();
    high = (json['high'] as List?)
        ?.map((dynamic e) => (e ?? 0.0) as double)
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['open'] = open;
    json['close'] = close;
    json['low'] = low;
    json['volume'] = volume;
    json['high'] = high;
    return json;
  }
}
