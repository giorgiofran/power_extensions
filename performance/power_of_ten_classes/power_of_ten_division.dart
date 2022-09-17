import 'package:power_extensions/src/big_int_extension_base.dart';

bool isPowerOfTenDivision(BigInt value) => powerOfTenDivision(value) != 0;

int powerOfTenDivision(BigInt value) {
  bool isNegative = false;
  if (value.isNegative) {
    value = -value;
    isNegative = true;
  }
  for (int i = 0;; i++) {
    if (value == BigInt.zero) {
      return 0;
    }
    if (value == BigInt.one) {
      return isNegative ? -i : i;
    }
    if (value % BigIntExtension.ten != BigInt.zero) {
      return 0;
    }
    value ~/= BigIntExtension.ten;
  }
}
