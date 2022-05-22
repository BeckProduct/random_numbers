# Numbers

This command-line application generates a list of `n` numbers (defaults to `10,000`), in random order, each time it is run.  Each number in the list is unique and is between `1` and `n`, inclusive.

## Execution

The application can be run in either of the following ways:

`dart run` (must be run from project root)

`dart run bin/numbers.dart` (assumes run from project root)

`dart run bin/numbers.dart --size 5` (assumes run from project root)

> NOTE: using the first option to run the application will not allow the use of arguments

## CLI Arguments

The application takes a single argument to specify the max size of the list. If the argument is ommitted, it defaults to `10,000`

`dart run bin/numbers.dart --size 5`

> NOTE: if the argument is not a positive integer the application will use the default instead.

## Output

The application prints the results to `stdout` with no formatting. Example output:

```
❯ dart run bin/numbers.dart --size 5
[2, 3, 5, 1, 4]
```

