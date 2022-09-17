import 'package:core_extensions/core_extensions.dart';

void main() {
  BigInt bigInt = BigInt.from(-1000000000);
  BigInt bigInt2 = BigInt.from(-1000000001);

  // BigInt
  print(bigInt.powerOfTen); // -9
  print(bigInt.isPowerOfTen); // true
  print(bigInt2.significandString); // 1000000001
  print(bigInt2.significand); // 1000000001
  print(bigInt2.significandLength); // 10
}
