import 'package:core_extensions/big_int_extension.dart';
import 'package:test/test.dart';
import '../performance/power_of_ten_classes/power_of_ten_division.dart';

void main() {
  late BigInt powZero;
  late BigInt pow1, pow2, pow3;
  late BigInt noPow1, noPow2, noPow3, noPow4, noPow5;
  setUp(() {
    powZero = BigInt.from(0);
    pow1 = BigInt.from(10);
    pow2 = BigInt.from(-1000000000);
    pow3 = BigInt.parse('1000000000000000000000000000000000');
    noPow1 = BigInt.from(15);
    noPow2 = BigInt.from(-1000000001);
    noPow3 = BigInt.parse('100034656500056560000560500000300500090000050320');
    noPow4 = BigInt.from(-110);
    noPow5 = BigInt.one;
  });
  group('Power of Ten', () {
    test('Exponent Standard Method', () {
      expect(powZero.powerOfTen, 0);
      expect(pow1.powerOfTen, 1);
      expect(pow2.powerOfTen, -9);
      expect(pow3.powerOfTen, 33);
      expect(noPow1.powerOfTen, 0);
      expect(noPow2.powerOfTen, 0);
      expect(noPow3.powerOfTen, 0);
      expect(noPow4.powerOfTen, 0);
      expect(noPow5.powerOfTen, 0);
    });

    test('Exponent Division Method', () {
      expect(powerOfTenDivision(powZero), 0);
      expect(powerOfTenDivision(pow1), 1);
      expect(powerOfTenDivision(pow2), -9);
      expect(powerOfTenDivision(pow3), 33);
      expect(powerOfTenDivision(noPow1), 0);
      expect(powerOfTenDivision(noPow2), 0);
      expect(powerOfTenDivision(noPow3), 0);
      expect(powerOfTenDivision(noPow4), 0);
      expect(powerOfTenDivision(noPow5), 0);
    });
    test('Is Power Of Ten Standard Method', () {
      expect(powZero.isPowerOfTen, isFalse);
      expect(pow1.isPowerOfTen, isTrue);
      expect(pow2.isPowerOfTen, isTrue);
      expect(pow3.isPowerOfTen, isTrue);
      expect(noPow1.isPowerOfTen, isFalse);
      expect(noPow2.isPowerOfTen, isFalse);
      expect(noPow3.isPowerOfTen, isFalse);
      expect(noPow4.isPowerOfTen, isFalse);
      expect(noPow5.isPowerOfTen, isFalse);
    });

    test('Is Power Of Ten Division Method', () {
      expect(isPowerOfTenDivision(powZero), isFalse);
      expect(isPowerOfTenDivision(pow1), isTrue);
      expect(isPowerOfTenDivision(pow2), isTrue);
      expect(isPowerOfTenDivision(pow3), isTrue);
      expect(isPowerOfTenDivision(noPow1), isFalse);
      expect(isPowerOfTenDivision(noPow2), isFalse);
      expect(isPowerOfTenDivision(noPow3), isFalse);
      expect(isPowerOfTenDivision(noPow4), isFalse);
      expect(isPowerOfTenDivision(noPow5), isFalse);
    });
  });

  group('Significand', () {
    test('String', () {
      expect(powZero.significandString, '0');
      expect(pow1.significandString, '1');
      expect(pow2.significandString, '1');
      expect(pow3.significandString, '1');
      expect(noPow1.significandString, '15');
      expect(noPow2.significandString, '1000000001');
      expect(noPow3.significandString,
          '10003465650005656000056050000030050009000005032');
      expect(noPow4.significandString, '11');
      expect(noPow5.significandString, '1');
    });
    test('Value', () {
      expect(powZero.significand, BigInt.zero);
      expect(pow1.significand, BigInt.one);
      expect(pow2.significand, BigInt.one);
      expect(pow3.significand, BigInt.one);
      expect(noPow1.significand, BigInt.from(15));
      expect(noPow2.significand, BigInt.parse('1000000001'));
      expect(noPow3.significand,
          BigInt.parse('10003465650005656000056050000030050009000005032'));
      expect(noPow4.significand, BigInt.from(11));
      expect(noPow5.significand, BigInt.one);
    });
    test('Digits length', () {
      expect(powZero.significandLength, 1);
      expect(pow1.significandLength, 1);
      expect(pow2.significandLength, 1);
      expect(pow3.significandLength, 1);
      expect(noPow1.significandLength, 2);
      expect(noPow2.significandLength, 10);
      expect(noPow3.significandLength, 47);
      expect(noPow4.significandLength, 2);
      expect(noPow5.significandLength, 1);
    });
  });
}
