extension BigIntExtensionBase on BigInt {
  static BigInt ten = BigInt.from(10);

  /// powerOfTen
  ///
  /// Returns the exponent needed to obtain the number base 10 (also negative)
  /// or zero if is not a power of ten or if it is == one
  /// Ex. 10 ==> 1, 100 ==> 2, -1000 ==> -3, 1357 ==> 0, 1 ==> 0
  /// Please note that this method relies on the fact the BigInt.toString()
  /// does not contain thousand's separators
  int get powerOfTen {
    BigInt bigInt = isNegative ? -this : this;

    // Convert x to string.
    var s = bigInt.toString();

    // Check if string contains '1' followed by '0'-s.
    if (s[0] != '1' || s.length == 1) {
      return 0;
    }
    int i = 1;
    for (; i < s.length; ++i) {
      if (s[i] != '0') {
        return 0;
      }
    }
    return isNegative ? 1 - i : i - 1;
  }

  /// Is Power Of Ten
  ///
  /// Returns true if this big int is a power of 10 (1 return false)
  bool get isPowerOfTen => powerOfTen != 0;

  /// Precision
  ///
  /// Returns the total number of digits of this number
  /// Ex. 10 => 2, 1567 => 4, 100000 => 6
  int get precision => abs().toString().length;

  /// Significand String
  ///
  /// This method returns a string representing the "significand of this number"
  /// It is quite strange talking about a significand for an integer number.
  /// The meaning is, the digits that represent a number that can be
  /// multiplied for a power of ten to obtain the original number.
  /// For ex. 56 => 56. There is no difference between the number and
  ///                   the "significand"
  ///         200 = > 2 can be multiplied by 10^2 in order to obtain the
  ///                 original number.
  ///           0 =>  0 At least one digit is required.
  /// Simplifying is the original number without the (exceeding) trailing zeros.
  String get significandString {
    if (this == BigInt.zero) {
      return '0';
    }
    var s = isNegative ? (-this).toString() : toString();
    var idx = s.length - 1;
    for (; idx > 0; idx--) {
      if (s[idx] != '0') {
        return s.substring(0, idx + 1);
      }
    }
    return s.substring(0, 1);
  }

  /// Significand
  ///
  /// It is the significand of this number,
  /// (The number without the trailing zeros).
  BigInt get significand => BigInt.parse(significandString);

  /// Significand Length
  ///
  /// It is the number of digits of the significand of this number,
  /// (The number without the trailing zeros).
  /// When zero the method returns 1
  int get significandLength => significandString.length;
}
