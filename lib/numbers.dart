import 'dart:math';

// This class has a single method that takes an optional integer <size> and
// generates a list of <size> numbers, in random order, each time it is run. It
// defaults to 10,000 if no <size> is provided.
class Numbers {
  // For generating a random index
  final _random = Random();

  // This method creates a strongly typed list with a capacity of <size> and
  // shuffles the list using the Fisher-Yates shuffle algorithm. It iterates
  // the ordered list swaping an element at the current index with an
  // element at a random index. Finally, it returns the randomized List.
  List<int> generate({int size = 10000}) {
    // Generate an ordered list using the List.generate() constructor
    List<int> orderedList = List<int>.generate(size, (int index) => index + 1);

    // Iterate the items in orderedList backwards
    for (int i = orderedList.length - 1; i > 0; i--) {
      // Create a random index between 0 and the list.length
      var randomIndex = _random.nextInt(i);
      // Get the value in the orderedList at the random index (randomIndex)
      var randomValue = orderedList[randomIndex];
      // Place the item at the selected index (i) at the selected random index (randomIndex) in the list
      orderedList[randomIndex] = orderedList[i];
      // Place the randomly selected item at the selected index (i) in the list
      orderedList[i] = randomValue;
    }

    // Return the shuffled list
    return orderedList;
  }
}
