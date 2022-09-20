extension BigIntExtensionBase on BigInt {
  static BigInt ten = BigInt.from(10);

  /// powerOfTen
  ///
  /// Given a number this methods verifies if its is of type 10^n
  /// If yes it returns n, otherwise -1
  /// Ex. 10 ==> 1, 100 ==> 2, -1000 ==> 3, 1357 ==> -1, 1 ==> 0, 0 ==> -1
  /// Please note that this method relies on the fact the BigInt.toString()
  /// does not contain thousand's separators
  int get powerOfTen {
    if (this == BigInt.one) {
      return 0;
    }
    BigInt bigInt = isNegative ? -this : this;

    // Convert x to string.
    var s = bigInt.toString();

    // Check if string contains '1' followed by '0'-s.
    if (s[0] != '1' || s.length == 1) {
      return -1;
    }
    int i = 1;
    for (; i < s.length; ++i) {
      if (s[i] != '0') {
        return -1;
      }
    }
    return i - 1;
  }

  /// scale
  ///
  /// Given a number this methods verifies if it is of the form x * 10^-n
  /// If yes it returns n, for zero returns zero
  /// Note that, as we are talking about integers, n will always be negative
  /// Ex. 10 ==> -1, 100 ==> -2, -1000 ==> -3, 1357 ==> 0, 1 ==> 0, 0 ==> 0
  /// Please note that this method relies on the fact the BigInt.toString()
  /// does not contain thousand's separators
  int get scale {
    if (this == BigInt.zero) {
      return 0;
    }
    BigInt bigInt = isNegative ? -this : this;

    // Convert x to string.
    var s = bigInt.toString();

    int i = s.length - 1;
    for (; i >= 0; i--) {
      if (s[i] != '0') {
        return i + 1 - s.length;
      }
    }
    return 1 - s.length;
  }

  /// Is Power Of Ten
  ///
  /// Returns true if this big int is a power of 10 (1 return false)
  bool get isPowerOfTen => powerOfTen > 0;

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
