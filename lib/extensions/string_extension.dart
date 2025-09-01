extension StringExtension on String {
  //1.
  String get toCapitalFirst => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
  //2.
  String get toTitleCase => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalFirst).join(' ');
}
