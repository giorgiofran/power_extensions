import 'package:power_extensions/src/big_int_extension_base.dart';

bool isPowerOfTenDivision(BigInt value) => powerOfTenDivision(value) > 0;

int powerOfTenDivision(BigInt value) {
  if (value.isNegative) {
    value = -value;
  }
  for (int i = 0;; i++) {
    if (value == BigInt.zero) {
      return -1;
    }
    if (value == BigInt.one) {
      return i;
    }
    if (value % BigIntExtensionBase.ten != BigInt.zero) {
      return -1;
    }
    value ~/= BigIntExtensionBase.ten;
  }
}
