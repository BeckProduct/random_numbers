import 'dart:math';

class Numbers {
  final _random = Random();

  List<int> generate({int size = 10000}) {
    return shuffleList(getOrderedList(size: size));
  }

  /*
  We need an ordered list to begin from. This method creates
  a strongly typed list with a capacity of 10,000
  */
  List<int> getOrderedList({int size = 10000}) {
    List<int> orderedList = <int>[];

    for (int i = 1; i <= size; i++) {
      orderedList.add(i);
    }

    return orderedList;
  }

  /*
  This method uses the Fisher-Yates shuffle algorithm to shuffle
  the list in place. It iterates the ordered list (passed in), then
  swaps an element at the current index with an element at a random
  index. It returns the randomized List.
  */
  List<int> shuffleList(orderedList) {
    for (int i = orderedList.length - 1; i > 0; i--) {
      var randomIndex = _random.nextInt(i);
      var randomValue = orderedList[randomIndex];
      orderedList[randomIndex] = orderedList[i];
      orderedList[i] = randomValue;
    }

    return orderedList;
  }
}
