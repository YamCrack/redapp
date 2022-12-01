double fromNumber(String? value) {
  return value == null ? 0.0 : double.parse(value);
}

String? toNumber(double? value) {
  return value?.toStringAsFixed(4);
}

bool fromBool(dynamic value) {
  if (value == null || value is! bool) {
    return false;
  }

  return value;
}

int toBool(bool value) {
  return value ? 1 : 0;
}
