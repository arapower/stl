# Advanced Practical Guide

This guide introduces advanced techniques for writing effective test code using stl.

## Double Quotes and Variables in Assertion Functions

This section explains how to include variables and double quotes in the arguments of stl's assertion functions.

### Using Arguments with Double Quotes

When including double quotes in the arguments of assertion functions, you need to escape them with a backslash.

```sh
assert_equal "my_echo \"Hello, World!\"" "Hello, World!"
```

In this example, we're passing `"Hello, World!"` as an argument to the `my_echo` function.
Escaping the double quotes ensures that the shell interprets them as part of the string.

### Using Arguments with Variables

When including variables in the arguments of assertion functions, enclose the variable in `${}` and, if necessary, surround the entire argument with double quotes.

```sh
assert_equal "\"${target_script}\" hello" "hello"
```

In this example, we're combining the value of the `${target_script}` variable with the string `hello` that follows it.
Enclosing the variable in double quotes ensures correct interpretation even if the variable's value contains spaces.

### Practical Example: Double Quotes and Variables in Assertion Functions

Here's an example combining these techniques.

```sh
setup() {
  target_script="${PRJ_ROOT_DIR}/app/echo_script.sh"
}

test_echo_script() {
  # Test with argument containing double quotes
  assert_equal "\"${target_script}\" \"Hello, World!\"" "Hello, World!"

  # Test with argument containing a variable
  message="Good morning"
  assert_equal "\"${target_script}\" \"${message}\"" "Good morning"
}
```

## Testing Shell Functions

When testing shell functions, the following method is recommended.

1. Group functions in a separate file

Defining the functions to be tested in an independent file improves reusability and maintainability.

2. Use the `.` command in the setup function to load the file containing function definitions

```sh
setup() {
  . "${PRJ_ROOT_DIR}/app/functions.sh"
}
```

This makes the functions available in the test environment.

3. Test the execution results of various functions using assertion functions

```sh
test_my_function() {
  assert_equal "my_function arg1 arg2" "expected output"
}
```

### Practical Example: Testing Shell Functions

```sh
# app/functions.sh
my_echo() {
  echo "$1"
}
```

```sh
# stl/code/function_test.sh
setup() {
  . "${PRJ_ROOT_DIR}/app/functions.sh"
}

teardown() {
  :
}

test_my_echo() {
  assert_equal "my_echo 'Hello, World!'" "Hello, World!"
}
```

## Time-Consuming Tests

In large projects or complex test suites, some tests may take a long time to execute.
To handle such situations, the following approach is recommended.

1. Separate time-consuming tests into independent test code files
2. Use the `-f` option to run time-consuming tests as needed
   - By excluding time-consuming tests during normal test execution and running them only when necessary, you can maintain a rapid development cycle.

### Practical Example: Time-Consuming Tests

```sh
# Normal test execution (excluding time-consuming tests)
$ ./stl/start_stl.sh -f ./stl/code/quick_test_1.sh -f ./stl/code/quick_test_2.sh

# Execute all tests including time-consuming ones
$ ./stl/start_stl.sh
```

This approach allows for quick daily test execution while still enabling comprehensive testing when needed.

## stl Extension Features

stl provides flexible extensibility and features that allow easy integration of user-defined functions and scripts.

### Utilizing the func Directory

The `func` directory is used to store common functions and custom functions used in tests.
During test execution, files in the `func` directory are automatically loaded using the `.` command.
This allows these functions to be called directly within the test code.

```sh
# func/custom_functions.sh
get_date_time_str() {
  date '+%Y%m%d%H%M'
}
```

```sh
# code/test_example.sh
test_custom_function() {
  date_time_str=$(get_date_time_str)
  assert_match "${target_script}" "${date_time_str}"
}
```

### Utilizing the mod Directory

The `mod` directory is used to store various scripts and executable files.
The `mod` directory is automatically added to the `PATH` environment variable.
This allows these files to be executed directly within the test code.

```sh
# mod/custom_script.sh
#!/bin/sh
echo "Custom script executed at $(date '+%Y-%m-%d %H:%M')"
```

```sh
# code/test_example.sh
test_custom_script() {
  result=$(custom_script.sh)
  assert_match "${target_script}" "${result}"
}
```

## Related Documents

- [User Manual](user_manual.md). Basic usage including naming conventions for test case functions
- [Design and Implementation of stl (Shell Testing Library)](design.md): Overview of stl's design philosophy, structure, and implementation features
- [Reference: Assertion Functions](reference_assertion_functions.md). Detailed explanation of assertion functions
- [Glossary](glossary.md): Definitions of key terms used in stl
