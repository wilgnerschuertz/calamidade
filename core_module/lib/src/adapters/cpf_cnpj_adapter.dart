class CpfCnpjAdapter {
  static String applyMask(String text) {
    if (text.trim() == '') {
      return '';
    } else if (text.length == 11) {
      return '${text.substring(0, 3)}.${text.substring(3, 6)}.${text.substring(6, 9)}-${text.substring(9)}';
    } else {
      return '${text.substring(0, 2)}.${text.substring(2, 5)}.${text.substring(5, 8)}/${text.substring(8, 12)}-${text.substring(12, 14)}';
    }
  }
}
