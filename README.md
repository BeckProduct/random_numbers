# Numbers

This command-line application generates a list of `n` numbers (defaults to `10,000`), in random order, each time it is run.  Each number in the list is unique and is between `1` and `n`, inclusive.

## Execution

The command-line application can be executed by running `dart run` (from the project root) or `dart run bin/numbers.dart`.

> NOTE: using `dart run` to run the application will not allow the use of options or flags

### Help

Application help can be found by running: `dart run bin/numbers.dart --help`.

```
A command-line utility for creating a list of random numbers

Usage: dart run bin/numbers.dart [arguments]

Global flags:
--help         Print this usage information.

Global options:
--size <int>   Specify the size of the shuffled list.
```

### Size

The size option can be used by running: `dart run bin/numbers.dart --size <size>`. This option takes a positive integer as a single argument to specify the max size of the list. If the argument is ommitted, it defaults to `10000`.

> NOTE: if the argument is ommitted or is not a positive integer the application will use the default (10,000) instead.

## Output

The application prints the results to `stdout` with no formatting. Example output:

```
❯ dart run bin/numbers.dart --size 5
[2, 3, 5, 1, 4]
Generated (size: 5)
```

