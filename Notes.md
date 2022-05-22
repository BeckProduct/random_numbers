# Notes

Some additional thoughts:

- I think the entry script (in /bin) could be cleaned up a bit although entry scripts tend to get a bit unrully for command-line applications.
- More focus could be placed on the test coverage. I tried to catch edge cases and prove that all lines are exercised but I think there are specifics that could also be covered (such as ensuring output is correct, etc.).
- The Fisher-Yates algorithm relies on a stateless RNG in order to be trully random on each run. The built in Dart RNG is stateful therefore the randomization is not truly random.
- The RNG used here is the standard constructor (Random()). For better randomization (but less efficiency) the Random.secure() constructor could have been used.
- It would be nice to not have to generate an ordered list from which to work.