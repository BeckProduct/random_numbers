import 'package:numbers/numbers.dart';
import 'package:test/test.dart';

void main() {
  var numbers = Numbers();

  test('generate with length 5', () {
    expect(numbers.generate(size: 5).length, equals(5));
  });

  test('generate with length 100', () {
    expect(numbers.generate(size: 100).length, equals(100));
  });

  test('runs are not the same', () {
    expect(numbers.generate(), isNot(equals(numbers.generate())));
  });

  test('get an ordered list of length 5', () {
    expect(numbers.getOrderedList(size: 5).length, equals(5));
  });

  test('get an ordered list of length 100', () {
    expect(numbers.getOrderedList(size: 100).length, equals(100));
  });

  test('get a shuffled list from a known list', () {
    expect(
        numbers.shuffleList([1, 2, 3, 4, 5]), isNot(equals([1, 2, 3, 4, 5])));
  });

  test('does not contain 0 (beyond lower bound)', () {
    expect(numbers.shuffleList([1, 2, 3, 4, 5]).indexOf(0), lessThan(0));
  });

  test('does not contain 6 (beyond upper bound)', () {
    expect(numbers.shuffleList([1, 2, 3, 4, 5]).indexOf(6), lessThan(0));
  });

  test('does contain 2 (beyond lower bound)', () {
    expect(numbers.shuffleList([1, 2, 3, 4, 5]).indexOf(2),
        greaterThanOrEqualTo(0));
  });

  test('does contain 4 (beyond upper bound)', () {
    expect(numbers.shuffleList([1, 2, 3, 4, 5]).indexOf(4),
        greaterThanOrEqualTo(0));
  });
}
