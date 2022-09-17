import 'package:core_extensions/big_int_extension.dart';
import 'milliseconds_performance.dart';
import 'power_of_ten_classes/power_of_ten_division.dart';

BigInt powZero = BigInt.from(0);
BigInt pow1 = BigInt.from(10);
BigInt pow2 = BigInt.from(-1000000000);
BigInt pow3 = BigInt.parse('1000000000000000000000000000000000');
BigInt noPow1 = BigInt.from(15);
BigInt noPow2 = BigInt.from(-1000000001);
BigInt noPow3 =
    BigInt.parse('100034656500056560000560500000300500090000050320');

void main(List<String> args) {
  millisecondsPerformance('isPowerOfTen standard', () {
    for (int i = 0; i < 100000; i++) {
      powZero.isPowerOfTen;
      pow1.isPowerOfTen;
      pow2.isPowerOfTen;
      pow3.isPowerOfTen;
      noPow1.isPowerOfTen;
      noPow2.isPowerOfTen;
      noPow3.isPowerOfTen;
    }
  });

  millisecondsPerformance('isPowerOfTen division', () {
    for (int i = 0; i < 100000; i++) {
      isPowerOfTenDivision(powZero);
      isPowerOfTenDivision(pow1);
      isPowerOfTenDivision(pow2);
      isPowerOfTenDivision(pow3);
      isPowerOfTenDivision(noPow1);
      isPowerOfTenDivision(noPow2);
      isPowerOfTenDivision(noPow3);
    }
  });
}
