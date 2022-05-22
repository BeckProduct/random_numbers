import 'package:args/args.dart';
import 'dart:io';
import 'package:numbers/numbers.dart';

const size = 'size';
const help = 'help';

void main(List<String> arguments) {
  // Create parser for command line args
  var parser = ArgParser();

  // Add option (size) to ArgParser object (defaults to 10000)
  parser.addOption(size, defaultsTo: '10000');
  // Add flag (help) to ArgParser object (displays usage message)
  parser.addFlag(help);

  // Parse the command line args
  ArgResults argResults;
  try {
    // Parse the arguments
    argResults = parser.parse(arguments);
  } catch (e) {
    // On exception, print the help message
    printHelp();
    exit(1);
  }

  // If the help arg was included, print the help message
  if (argResults[help]) {
    printHelp();
    exit(0);
  }

  // Try to parse the 'size' command line arg
  int? parsedSize = int.tryParse(argResults[size]);
  // Call the run method to do the work
  List<int> randomizedList = run(parsedSize);
  // Print the randomized list to stdout
  stdout.writeln(randomizedList);
  // Print results to stdout
  stdout.writeln('Generated (size: ${randomizedList.length})');
}

List<int> run(int? size) {
  // The final randomized list
  List<int> randomizedList;

  // Instantiate the Numbers class
  var numbers = Numbers();
  if (size != null && size > 0) {
    // If the parsedSize value is a positive integer, use it
    randomizedList = numbers.generate(size: size);
  } else {
    // Otherwise don't pass it (defaults to 10,000)
    randomizedList = numbers.generate();
  }

  return randomizedList;
}

void printHelp() {
  stdout.writeln('A command-line utility for creating a list of random numbers');
  stdout.writeln();
  stdout.writeln('Usage: dart run bin/numbers.dart [arguments]');
  stdout.writeln();
  stdout.writeln('Global flags:');
  stdout.writeln('--help         Print this usage information.');
  stdout.writeln();
  stdout.writeln('Global options:');
  stdout.writeln('--size <int>   Specify the size of the shuffled list.');
  stdout.writeln();
}
