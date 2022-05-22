import 'package:args/args.dart';
import 'dart:io';
import 'package:numbers/numbers.dart';

const size = 'size';

void main(List<String> arguments) {
  // Create parser for command line args
  var parser = ArgParser();
  // Add option (size) to ArgParser object (defaults to 10000)
  parser.addOption(size, defaultsTo: '10000');

  // Parse the command line args
  ArgResults argResults;

  try {
    argResults = parser.parse(arguments);
  } catch (e) {
    exit(1);
  }

  // Try to parse the 'size' command line arg
  int? parsedSize = int.tryParse(argResults[size]);
  // The final randomized list
  List<int> randomizedList;

  // Instantiate the Numbers class
  var numbers = Numbers();
  if (parsedSize != null && parsedSize > 0) {
    // If the parsedSize value is a positive integer, use it
    randomizedList = numbers.generate(size: parsedSize);
  } else {
    // Otherwise don't pass it (defaults to 10000)
    randomizedList = numbers.generate();
  }

  // Print the randomized list to stdout
  stdout.writeln(randomizedList);

  // Print results to stdout
  stdout.writeln('Generated (size: ${randomizedList.length})');
}
