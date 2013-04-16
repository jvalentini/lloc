Counts the logical lines of code in a PHP project by igoring lines like
- Opening and closing PHP tags
- File includes and requires
- Class and function declarations
- Standalone brackets

The idea behind this project is to help determine a more accurate line count so that code metrics are less misleading.

For example, imagine a file contains the following code:
function myFunc() { return doSomething(); }

And the code was refactored to:
function myFunc()
{
    return doSomething();
}

Then the source lines of code (SLOC) would increase from 1 to 3 even though no complexity was added. The goal is to ignore these changes as much as possible.

Currently, this project does not support counting "true" logical lines of code as something like:
foreach ($things as $thing) { return $thing ? "yes" : "no"; }

that gets refactored to:
foreach ($things as $thing) {
    return $thing ? "yes" : "no";
}

would still show an increase in SLOC from 1 to 2 (it ignore the closing bracket properly but still see counts return method as a new line).