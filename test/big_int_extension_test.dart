import 'package:power_extensions/big_int_extension.dart';
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
      expect(powZero.powerOfTen, -1);
      expect(pow1.powerOfTen, 1);
      expect(pow2.powerOfTen, 9);
      expect(pow3.powerOfTen, 33);
      expect(noPow1.powerOfTen, -1);
      expect(noPow2.powerOfTen, -1);
      expect(noPow3.powerOfTen, -1);
      expect(noPow4.powerOfTen, -1);
      expect(noPow5.powerOfTen, 0);
    });

    test('Exponent Division Method', () {
      expect(powerOfTenDivision(powZero), -1);
      expect(powerOfTenDivision(pow1), 1);
      expect(powerOfTenDivision(pow2), 9);
      expect(powerOfTenDivision(pow3), 33);
      expect(powerOfTenDivision(noPow1), -1);
      expect(powerOfTenDivision(noPow2), -1);
      expect(powerOfTenDivision(noPow3), -1);
      expect(powerOfTenDivision(noPow4), -1);
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
  group('Precision', () {
    test('Standard Method', () {
      expect(powZero.precision, 1);
      expect(pow1.precision, 2);
      expect(pow2.precision, 10);
      expect(pow3.precision, 34);
      expect(noPow1.precision, 2);
      expect(noPow2.precision, 10);
      expect(noPow3.precision, 48);
      expect(noPow4.precision, 3);
      expect(noPow5.precision, 1);
    });
  });
  group('Scale', () {
    test('Standard Method', () {
      expect(powZero.scale, 0);
      expect(pow1.scale, -1);
      expect(pow2.scale, -9);
      expect(pow3.scale, -33);
      expect(noPow1.scale, 0);
      expect(noPow2.scale, 0);
      expect(noPow3.scale, -1);
      expect(noPow4.scale, -1);
      expect(noPow5.scale, 0);
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
  group('More Tests', () {
    test('Big Int Extension test', () {
      var bi = BigInt.from(0);
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 1);
      expect(bi.significand, BigInt.from(0));
      expect(bi.significandLength, 1);

      bi = BigInt.from(10);
      expect(bi.isPowerOfTen, isTrue);
      expect(bi.precision, 2);
      expect(bi.significand, BigInt.from(1));
      expect(bi.significandLength, 1);

      bi = BigInt.from(-10);
      expect(bi.isPowerOfTen, isTrue);
      expect(bi.precision, 2);
      expect(bi.significand, BigInt.from(1));
      expect(bi.significandLength, 1);

      bi = BigInt.from(1);
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 1);
      expect(bi.significand, BigInt.from(1));
      expect(bi.significandLength, 1);

      bi = BigInt.from(2);
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 1);
      expect(bi.significand, BigInt.from(2));
      expect(bi.significandLength, 1);

      bi = BigInt.from(20);
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 2);
      expect(bi.significand, BigInt.from(2));
      expect(bi.significandLength, 1);

      bi = BigInt.from(-120);
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 3);
      expect(bi.significand, BigInt.from(12));
      expect(bi.significandLength, 2);

      bi = BigInt.from(100000);
      expect(bi.isPowerOfTen, isTrue);
      expect(bi.precision, 6);
      expect(bi.significand, BigInt.from(1));
      expect(bi.significandLength, 1);

      bi = BigInt.from(1000001);
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 7);
      expect(bi.significand, BigInt.from(1000001));
      expect(bi.significandLength, 7);

      bi = BigInt.from(10020000);
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 8);
      expect(bi.significand, BigInt.from(1002));
      expect(bi.significandLength, 4);

      bi = BigInt.from(10).pow(6178);
      var initTime = DateTime.now();
      var result = bi.isPowerOfTen;
      var milliResult = DateTime.now().millisecondsSinceEpoch -
          initTime.millisecondsSinceEpoch;

      //print('Is power of ten: $result in $milliResult');
      expect(result, isTrue);
      expect(milliResult < 100, isTrue);
      expect(bi.precision, 6179);
      expect(bi.significand, BigInt.from(1));
      expect(bi.significandLength, 1);

      bi = BigInt.from(10).pow(6178) + BigInt.one;
      expect(bi.isPowerOfTen, isFalse);
      expect(bi.precision, 6179);
      expect(bi.significand, bi);
      expect(bi.significandLength, 6179);
    });
  });
}
