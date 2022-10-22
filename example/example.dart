import 'package:power_extensions/power_extensions.dart';

void main() {
  BigInt bigInt = BigInt.from(-1000000000);
  BigInt bigInt2 = BigInt.from(-1000000001);

  // BigInt
  print(bigInt.powerOfTen); // -9
  print(bigInt.isPowerOfTen); // true
  print(bigInt2.significandString); //

  // String
  print('please cut here this string'.cut(15)); //'please cut here'
  print('please cut'.cut(15)); // 'please cut'

  print('please cut here this string'.cutAndAlign(15)); // 'please cut here'

  print('please cut'.cutAndAlign(15)); // 'please cut     '
  print('please cut'.cutAndAlign(15, leftAlign: false)); // '     please cut'
  print('please cut'.cutAndAlign(15, paddingChar: '*')); // 'please cut*****'
  print('please cut'.cutAndAlign(15,
      leftAlign: false, paddingChar: '*')); //   '*****please cut'

  print('5,769.34'.preserveOnlyChars('0123456789')); // '576934'
  print('5,769.34'
      .preserveOnlyChars('0123456789', replacementChar: ' ')); // '5 769 34'

  print('main'.capitalizeAndLowercase()); // 'Main'
  print('THETA'.capitalizeAndLowercase()); // 'Theta'
  print('jOhN'.capitalizeAndLowercase()); // 'John'

  print('27-12'.onlyContainsDigits()); // false
  print('1953'.onlyContainsDigits()); // true

  List<String> parts;
  parts = 'mollit est consequatur'.splitInLines(11);
  print(parts.length); // 2
  print(parts.first); // 'mollit est '
  print(parts.last); // 'consequatur'
}
