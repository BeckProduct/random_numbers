import 'dart:math';

final _random = Random();

List<int> generate() {
  List<int> orderedList = getOrderedList();
  return shuffleList(orderedList);
}

// We need an ordered list to begin with
List<int> getOrderedList() {
  // This creates a strongly typed list with a capacity of 10,000
  List<int> orderedList = <int>[];

  // Loop 10,000 times inserting integers into orderedList in sequence
  for (int i = 1; i <= 10000; i++) {
    orderedList.add(i);
  }

  // Return orderedList
  return orderedList;
}

// Use the Fisher-Yates shuffle algorithm to shuffle the array
List<int> shuffleList(orderedList) {
  // Create a list in which to place the items at random
  List<int> shuffledList = <int>[];

  // While there are still items in the ordered list, keep processing
  while (orderedList.length > 0) {
    // Randomly select an index within the bounds of the list
    var randomIndex = _random.nextInt(orderedList.length);
    // Pull an int from orderedList at the random index
    var selection = orderedList.removeAt(randomIndex);
    // Add the randomly selected int to the end of shuffledList
    shuffledList.add(selection);
  }

  // Return shuffledList
  return shuffledList;
}
