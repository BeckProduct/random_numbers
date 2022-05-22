import 'package:numbers/numbers.dart';
import 'package:test_process/test_process.dart';
import 'package:test/test.dart';

void main() {
  late Numbers numbers;
  late TestProcess process;

  // Test to ensure command line args work correctly
  group('main method', () {
    // Does no args result in a random list of size 10000
    test('instantiate no args', () async {
      process = await TestProcess.start("dart", ["run", "bin/numbers.dart"]);
      String next;
      do {
        next = await process.stdout.next;
      } while (next != "Generated (size: 10000)");

      await process.shouldExit(0);
    });

    // Does args '--size 5' result in a random list of size 5
    test('instantiate size 5', () async {
      process = await TestProcess.start("dart", ["run", "bin/numbers.dart", "--size", "5"]);
      String next;
      do {
        next = await process.stdout.next;
      } while (next != "Generated (size: 5)");

      await process.shouldExit(0);
    });

    // Does args '--size -5' result in a random list of size 10000
    test('instantiate size -5', () async {
      process = await TestProcess.start("dart", ["run", "bin/numbers.dart", "--size", "-5"]);
      String next;
      do {
        next = await process.stdout.next;
      } while (next != "Generated (size: 10000)");

      await process.shouldExit(0);
    });

    // Does args '--size five' result in a random list of size 10000
    test('instantiate size five', () async {
      process = await TestProcess.start("dart", ["run", "bin/numbers.dart", "--size", "five"]);
      String next;
      do {
        next = await process.stdout.next;
      } while (next != "Generated (size: 10000)");

      await process.shouldExit(0);
    });

    // Does args '--bad' result in an exit code of 1
    test('instantiate bad', () async {
      process = await TestProcess.start("dart", ["run", "bin/numbers.dart", "--bad"]);
      await process.shouldExit(1);
    });
  });

  group('generate method', () {
    setUp(() {
      numbers = Numbers();
    });

    test('generate with length 5', () {
      expect(numbers.generate(size: 5).length, equals(5));
    });

    test('generate with length 100', () {
      expect(numbers.generate(size: 100).length, equals(100));
    });

    // NOTE: as size approaches 0 the chances of two runs producing
    // the same output get larger. Possible opportunity to refactor test.
    test('runs are not the same', () {
      expect(numbers.generate(), isNot(equals(numbers.generate())));
    });

    // NOTE: as size approaches 0 the chances of a shuffle producing
    // the same output as input gets larger. Possible opportunity to refactor test.
    test('get a shuffled list from a known list', () {
      expect(numbers.generate(size: 5), isNot(equals([1, 2, 3, 4, 5])));
    });

    test('does not contain 0 (beyond lower bound)', () {
      expect(numbers.generate(size: 5).indexOf(0), lessThan(0));
    });

    test('does not contain 6 (beyond upper bound)', () {
      expect(numbers.generate(size: 5).indexOf(6), lessThan(0));
    });

    test('does contain 2', () {
      expect(numbers.generate(size: 5).indexOf(2), greaterThanOrEqualTo(0));
    });

    test('does contain 4', () {
      expect(numbers.generate(size: 5).indexOf(4), greaterThanOrEqualTo(0));
    });
  });
}
