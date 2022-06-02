import 'dart:convert';

import 'package:intl/intl.dart';

class DateRange {
  DateTime from;
  DateTime to;

  DateRange(this.from, this.to);

  Map<String, dynamic> toJson() {
    DateFormat formatter = DateFormat('yyyy-MM-dd ');

    return {
      'from': formatter.format(from),
      'to': formatter.format(to),
    };
  }

  @override
  String toString() => json.encode(toJson());
}
