class PhoneAdapter {
  static String applyMask(String text) {
    final phone = text.replaceAll(RegExp(r'\D'), '');
    if (phone.isEmpty) return '';
    if (phone.length == 13) {
      return '+${phone.substring(0, 2)} (${phone.substring(2, 4)}) ${phone.substring(4, 9)}-${phone.substring(9)}';
    } else if (phone.length == 12) {
      return '+${phone.substring(0, 2)} (${phone.substring(2, 4)}) ${phone.substring(4, 8)}-${phone.substring(8)}';
    } else if (phone.length == 11) {
      return '(${phone.substring(0, 2)}) ${phone.substring(2, 4)}-${phone.substring(4)}';
    } else if (phone.length == 9) {
      return '${phone.substring(0, 5)}-${phone.substring(5)}';
    } else {
      return '${phone.substring(0, 4)}-${phone.substring(4)}';
    }
    //55 11 4002 8922
  }
}
