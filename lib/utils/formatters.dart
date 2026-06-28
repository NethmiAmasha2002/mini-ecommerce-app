/// Small formatting helpers shared across screens.
class Formatters {
  Formatters._();

  /// Formats a number as LKR currency, e.g. 8500 -> "LKR 8,500".
  /// Written manually (no intl package) to keep dependencies minimal
  /// for a small task like this.
  static String currency(double amount) {
    final intPart = amount.toInt();
    final str = intPart.toString();
    final buffer = StringBuffer();

    for (int i = 0; i < str.length; i++) {
      final posFromEnd = str.length - i;
      buffer.write(str[i]);
      if (posFromEnd > 1 && posFromEnd % 3 == 1) {
        buffer.write(',');
      }
    }

    return 'LKR ${buffer.toString()}';
  }
}
