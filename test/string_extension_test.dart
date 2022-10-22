import 'package:power_extensions/power_extensions.dart';
import 'package:test/test.dart';

void main() {
  setUp(() {});
  group('Trim', () {
    String s1 = 'abcefgh';
    String s2 = 'abcefg';
    String s3 = 'abcyyyyy';
    String s4 = 'abc';
    String s5 = 'ayyyyyyy';
    String s6 = 'yyyyyyyy';
    String sl2 = 'bcefgh';
    String sl3 = 'xxxxfgh';
    String sl4 = 'fgh';
    String sl5 = 'xxxxxxh';
    String sl6 = 'xxxxxxx';

    test('Left char', () {
      expect(s1.trimLeftChar('t'), s1);
      expect(s1.trimLeftChar('a'), sl2);
      expect(sl3.trimLeftChar('x'), sl4);
      expect(sl5.trimLeftChar('x'), 'h');
      expect(sl6.trimLeftChar('x'), '');
    });
    test('Right char', () {
      expect(s1.trimRightChar('t'), s1);
      expect(s1.trimRightChar('h'), s2);
      expect(s3.trimRightChar('y'), s4);
      expect(s5.trimRightChar('y'), 'a');
      expect(s6.trimRightChar('y'), '');
    });
  });
  group('Cut', () {
    setUp(() {});

    test('Cut ok', () {
      expect('please cut here this string'.cut(15), 'please cut here');
      expect('please cut'.cut(15), 'please cut');
    });

    test('Cut error', () {
      expect(() => 'please cut'.cut(-1), throwsRangeError);
    });
  });

  group('Cut And Align', () {
    setUp(() {});

    test('Cut And Align ok', () {
      expect('please cut here this string'.cutAndAlign(15), 'please cut here');
      expect(
          'please cut here this string'
              .cutAndAlign(15, leftAlign: false, paddingChar: '*'),
          'please cut here');
      expect('please cut'.cutAndAlign(15), 'please cut     ');
      expect('please cut'.cutAndAlign(15, leftAlign: false), '     please cut');
      expect('please cut'.cutAndAlign(15, paddingChar: '*'), 'please cut*****');
      expect('please cut'.cutAndAlign(15, leftAlign: false, paddingChar: '*'),
          '*****please cut');
    });

    test('Cut and Align error', () {
      //expect(() => null.cutAndAlign(15), throwsNoSuchMethodError);
      expect(
          () =>
              'please cut'.cutAndAlign(-1, leftAlign: false, paddingChar: '*'),
          throwsRangeError);
    });
  });

  group('Preserve only Chars', () {
    setUp(() {});

    test('Preserve only chars ok', () {
      expect('5,769.34'.preserveOnlyChars('0123456789'), '576934');
      expect('5,769.34'.preserveOnlyChars('0123456789', replacementChar: ' '),
          '5 769 34');
      expect('5,769.34'.preserveOnlyChars(''), '');
      expect('5,769.34'.preserveOnlyChars('0123456789', replacementChar: null),
          '576934');
    });
  });

  group('A group of tests', () {
    setUp(() {});

    test('Capitalize', () {
      expect('main'.capitalizeAndLowercase(), 'Main');
      expect(''.capitalizeAndLowercase(), isEmpty);
      expect('m'.capitalizeAndLowercase(), 'M');
      expect('M'.capitalizeAndLowercase(), 'M');
      expect('i'.capitalizeAndLowercase(), 'I');
      expect('THETA'.capitalizeAndLowercase(), 'Theta');
      expect('jOhN'.capitalizeAndLowercase(), 'John');
      //expect(() => null.capitalize(), throwsNoSuchMethodError);

      expect('main'.capitalizeRestUnchanged(), 'Main');
      expect(''.capitalizeRestUnchanged(), isEmpty);
      expect('m'.capitalizeRestUnchanged(), 'M');
      expect('M'.capitalizeRestUnchanged(), 'M');
      expect('i'.capitalizeRestUnchanged(), 'I');
      expect('THETA'.capitalizeRestUnchanged(), 'THETA');
      expect('jOhN'.capitalizeRestUnchanged(), 'JOhN');
    });
    test('Capitalize and lowercase Any Word', () {
      expect('main'.capitalizeAndLowercaseAnyWord(), 'Main');
      expect(''.capitalizeAndLowercaseAnyWord(), isEmpty);
      expect('m'.capitalizeAndLowercase(), 'M');
      expect('M'.capitalizeAndLowercaseAnyWord(), 'M');
      expect('i'.capitalizeAndLowercaseAnyWord(), 'I');
      expect('THETA'.capitalizeAndLowercaseAnyWord(), 'Theta');
      expect(
          'jOhN, iS FInE.'.capitalizeAndLowercaseAnyWord(), 'John, Is Fine.');
      expect(
          ' the quick brown fox jumps over the lazy dog. '
              .capitalizeAndLowercaseAnyWord(),
          'The Quick Brown Fox Jumps Over The Lazy Dog.');
    });

    test('Uncapitalize', () {
      expect('Main'.uncapitalizeRestUnchanged(), 'main');
      expect(''.uncapitalizeRestUnchanged(), isEmpty);
      expect('M'.uncapitalizeRestUnchanged(), 'm');
      expect('m'.uncapitalizeRestUnchanged(), 'm');
      expect('I'.uncapitalizeRestUnchanged(), 'i');
      expect('THETA'.uncapitalizeRestUnchanged(), 'tHETA');
      expect('JOhN'.uncapitalizeRestUnchanged(), 'jOhN');
    });

    test('Only digits', () {
      expect('Value'.onlyContainsDigits(), isFalse);
      expect(''.onlyContainsDigits(), isFalse);
      expect('A234'.onlyContainsDigits(), isFalse);
      expect('2712b'.onlyContainsDigits(), isFalse);
      expect('12T24'.onlyContainsDigits(), isFalse);
      expect('27-12'.onlyContainsDigits(), isFalse);
      expect('1953'.onlyContainsDigits(), isTrue);
    });
    test('Only alpha', () {
      expect('Value'.onlyContainsAlpha(), isTrue);
      expect(''.onlyContainsAlpha(), isFalse);
      expect('A234'.onlyContainsAlpha(), isFalse);
      expect('2712b'.onlyContainsAlpha(), isFalse);
      expect('12T24'.onlyContainsAlpha(), isFalse);
      expect('27-12'.onlyContainsAlpha(), isFalse);
      expect('1953'.onlyContainsAlpha(), isFalse);
      expect('en_US'.onlyContainsAlpha(), isFalse);
    });
    test('Dart Identifier', () {
      final source = '''
      enum _LanguageType{ dart, cPlusPlus, c, java, python}
      ''';

      expect(source.isDartIdentifier(12), isTrue);
      expect(source.isDartIdentifier(11), isTrue);
      expect(source.isDartIdentifier(10), isFalse);

      expect(source.getDartIdentifier(10), '');
      expect(source.getDartIdentifier(11), '_LanguageType');
      expect(source.getDartIdentifier(12), 'LanguageType');
    });

    test('SplitInLines', () {
      final test = 'Lorem ipsum dolor sit amet, consectetur adipisci elit, '
          'sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrum exercitationem ullamco '
          'laboriosam, nisi ut aliquid ex ea commodi consequatur. '
          'Duis aute irure reprehenderit in voluptate velit esse cillum '
          'dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat '
          'non proident, sunt in culpa qui officia deserunt mollit anim '
          'id est laborum.';
      // ignore: omit_local_variable_types
      List<String> parts = test.splitInLines(50);
      expect(parts.length, 10);
      expect(parts.first, 'Lorem ipsum dolor sit amet, consectetur adipisci ');
      expect(parts[5], 'aute irure reprehenderit in voluptate velit esse ');
      expect(parts.last, 'laborum.');
      // ignore: omit_local_variable_types
      List<String> extParts = test.splitInLines(50);
      expect(parts.length, extParts.length);
      expect(parts.first, extParts.first);
      expect(parts[5], extParts[5]);
      expect(parts.last, extParts.last);
      // ignore: omit_local_variable_types
      List<String> parts1 = test.splitInLines(50, separator: ',');
      expect(parts1.length, 11);
      expect(parts1.first, 'Lorem ipsum dolor sit amet,');
      expect(parts1[2], ' sed do eiusmod tempor incidunt ut labore et dolor');
      expect(parts1[3], 'e magna aliqua. Ut enim ad minim veniam,');
      expect(parts1.last, ' est laborum.');
      // ignore: omit_local_variable_types
      List<String> parts2 = test.splitInLines(50, firstLineDecrease: 12);
      expect(parts2.length, 10);
      expect(parts2.first, 'Lorem ipsum dolor sit amet, ');
      expect(parts2[5], 'consequatur. Duis aute irure reprehenderit in ');
      expect(parts2.last, 'mollit anim id est laborum.');
      expect(test, parts.join());
      expect(parts.join(), parts1.join());
      expect(parts.join(), parts2.join());
    });
    test('SplitInLines 1', () {
      const test1 = 'consequatur';
      // ignore: omit_local_variable_types
      List<String> parts1 = test1.splitInLines(10);
      expect(parts1.length, 2);
      expect(parts1.first, 'consequatu');
      expect(parts1.last, 'r');
      // ignore: omit_local_variable_types
      List<String> parts2 = test1.splitInLines(11);
      expect(parts2.length, 1);
      expect(parts2.first, 'consequatur');
      // ignore: omit_local_variable_types
      List<String> parts3 = test1.splitInLines(12);
      expect(parts3.length, 1);
      expect(parts3.first, 'consequatur');
      const test = 'Lorem amet';
      // ignore: omit_local_variable_types
      List<String> parts = test.splitInLines(10);
      expect(parts.length, 1);
      expect(parts.first, 'Lorem amet');
    });

    test('SplitInLines 2', () {
      const test1 = 'consequatur mollit est';
      // ignore: omit_local_variable_types
      List<String> parts1 = test1.splitInLines(10);
      expect(parts1.length, 3);
      expect(parts1.first, 'consequatu');
      expect(parts1[1], 'r mollit ');
      expect(parts1.last, 'est');
      // ignore: omit_local_variable_types
      List<String> parts2 = test1.splitInLines(11);
      expect(parts2.length, 2);
      expect(parts2.first, 'consequatur');
      expect(parts2.last, ' mollit est');
      // ignore: omit_local_variable_types
      List<String> parts3 = test1.splitInLines(12);
      expect(parts3.length, 2);
      expect(parts3.first, 'consequatur ');
      expect(parts3.last, 'mollit est');
      expect(test1, parts1.join());
      expect(test1, parts2.join());
      expect(test1, parts3.join());
    });

    test('SplitInLines 3', () {
      const test1 = 'mollit est consequatur';
      // ignore: omit_local_variable_types
      List<String> parts1 = test1.splitInLines(10);
      expect(parts1.length, 4);
      expect(parts1.first, 'mollit ');
      expect(parts1[1], 'est ');
      expect(parts1[2], 'consequatu');
      expect(parts1.last, 'r');
      // ignore: omit_local_variable_types
      List<String> parts2 = test1.splitInLines(11);
      expect(parts2.length, 2);
      expect(parts2.first, 'mollit est ');
      expect(parts2.last, 'consequatur');
      // ignore: omit_local_variable_types
      List<String> parts4 = test1.splitInLines(11, firstLineDecrease: 5);
      expect(parts4.length, 3);
      expect(parts4.first, 'mollit');
      expect(parts4[1], ' est ');
      expect(parts4.last, 'consequatur');
      // ignore: omit_local_variable_types
      List<String> parts3 = test1.splitInLines(12);
      expect(parts3.length, 2);
      expect(parts3.first, 'mollit est ');
      expect(parts3.last, 'consequatur');
      expect(test1, parts1.join());
      expect(test1, parts2.join());
      expect(test1, parts3.join());
      expect(test1, parts4.join());
    });

    test('startsAndEnds', () {
      expect('"test"'.startsAndEndsWith('"'), isTrue);
      expect('test'.startsAndEndsWith('"'), isFalse);
      expect('"test'.startsAndEndsWith('"'), isFalse);
      expect('test"'.startsAndEndsWith('"'), isFalse);
      expect(' "test"'.startsAndEndsWith('"'), isFalse);
      expect('"test" '.startsAndEndsWith('"'), isFalse);

      expect("'test'".startsAndEndsWith("'"), isTrue);
      expect("test'".startsAndEndsWith("'"), isFalse);
      expect("'test".startsAndEndsWith("'"), isFalse);
      expect(" 'test'".startsAndEndsWith("'"), isFalse);
      expect("'test' ".startsAndEndsWith("'"), isFalse);

      expect("'''test'''".startsAndEndsWith("'''"), isTrue);
      expect("''''test''''".startsAndEndsWith("'''"), isTrue);
      expect("test'''".startsAndEndsWith("'''"), isFalse);
      expect("'''test".startsAndEndsWith("'''"), isFalse);
      expect(" '''test'''".startsAndEndsWith("'''"), isFalse);
      expect("'''test''' ".startsAndEndsWith("'''"), isFalse);
    });

    test('trim delimiters', () {
      expect('"test"'.trimDelimiters('"'), 'test');
      expect('test'.trimDelimiters('"'), 'test');
      expect('"test'.trimDelimiters('"'), '"test');
      expect('test"'.trimDelimiters('"'), 'test"');
      expect(' "test"'.trimDelimiters('"'), ' "test"');
      expect('"test" '.trimDelimiters('"'), '"test" ');
      expect('"test"'.trimDelimiters('"'), 'test');

      expect('-test-'.trimDelimiters('-'), 'test');
      expect('-test'.trimDelimiters('-'), '-test');
      expect('test-'.trimDelimiters('-'), 'test-');
      expect(' -test-'.trimDelimiters('-'), ' -test-');
      expect('-test- '.trimDelimiters('-'), '-test- ');

      expect("'test'".trimDelimiters("'"), 'test');
      expect("test'".trimDelimiters("'"), "test'");
      expect("'test".trimDelimiters("'"), "'test");
      expect(" 'test'".trimDelimiters("'"), " 'test'");
      expect("'test' ".trimDelimiters("'"), "'test' ");

      expect("'''test'''".trimDelimiters("'''"), 'test');
      expect("''''test''''".trimDelimiters("'''"), "'test'");
      expect("test'''".trimDelimiters("'''"), "test'''");
      expect("'''test".trimDelimiters("'''"), "'''test");
      expect(" '''test'''".trimDelimiters("'''"), " '''test'''");
      expect("'''test''' ".trimDelimiters("'''"), "'''test''' ");
    });

    test('trim String delimiters', () {
      expect('"test"'.trimStringDelimiters(), 'test');
      expect('test'.trimStringDelimiters(), 'test');
      expect('"test'.trimStringDelimiters(), '"test');
      expect('test"'.trimStringDelimiters(), 'test"');
      expect(' "test"'.trimStringDelimiters(), ' "test"');
      expect('"test" '.trimStringDelimiters(), '"test" ');

      expect("'test'".trimStringDelimiters(), 'test');
      expect("test'".trimStringDelimiters(), "test'");
      expect("'test".trimStringDelimiters(), "'test");
      expect(" 'test'".trimStringDelimiters(), " 'test'");
      expect("'test' ".trimStringDelimiters(), "'test' ");

      expect("'''test'''".trimStringDelimiters(), 'test');
      expect("''''test''''".trimStringDelimiters(), "'test'");
      expect("test'''".trimStringDelimiters(), "test'''");
      expect("'''test".trimStringDelimiters(), "'''test");
      expect(" '''test'''".trimStringDelimiters(), " '''test'''");
      expect("'''test''' ".trimStringDelimiters(), "'''test''' ");
    });
  });
}
