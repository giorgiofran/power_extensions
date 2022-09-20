extension StringExtensionBase on String {
  String trimLeftChar(String c) {
    int i = 0;
    for (; i < length && this[i] == c; i++) {}
    return substring(i);
  }

  String trimRightChar(String c) {
    int i = length - 1;
    for (; i >= 0 && this[i] == c; i--) {}
    return substring(0, i + 1);
  }
}
