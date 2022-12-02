import 'package:easy_localization/easy_localization.dart';

String formatCurrency(double? value) {
  final formatCurrency = NumberFormat.simpleCurrency();
  return formatCurrency.format(value);
}

String formatNumber(double? value) {
  final numberFormat = NumberFormat.compact();
  return numberFormat.format(value);
}
