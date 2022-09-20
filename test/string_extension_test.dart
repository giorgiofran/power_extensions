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
}
