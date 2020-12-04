class Helper {
  static String getDate(DateTime date) => date.toString().substring(0, 10);

  static getFixedString(String n) {
    double d = double.tryParse(n.toString());
    if (d != null) {
      if (d.floor() == d) return d.toStringAsFixed(0);
      return d.toStringAsFixed(2);
    }
    return '';
  }
}
