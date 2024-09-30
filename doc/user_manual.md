# User Manual

This manual explains the basic usage of stl.

## Basic Test Code and Operation of stl

stl is a testing library designed to simplify writing tests for shell scripts.
Here's a simple test example.

### Test Target

- Test target: `app/sample.sh`

```sh
#!/bin/sh
echo "$1"
```

### Test Code Example

- Test code: `stl/code/sample.sh`

```sh
setup() {
  target_script="${PRJ_ROOT_DIR}/app/sample.sh"
}

teardown() {
  :
}

stl_echo_test() {
  assert_equal "\"${target_script}\" hello" "hello"
}
```

### Test Execution Example

```
$ ./stl/start_stl.sh
[OK] sample.sh:10 stl_echo_test
```

The meaning of this output is as follows.

- `[OK]`: Indicates that the test case succeeded
- `sample.sh`: The name of the file where the test was executed
- `:10`: Indicates the line number where the assertion function was executed
- `stl_echo_test`: The name of the executed test case function

Here's an example of a failed test.

Add a failing test case function as follows.

```sh
stl_echo_test_ng() {
  assert_equal "\"${target_script}\" NG" "hello"
}
```

```
$ ./stl/start_stl.sh
[OK] sample.sh:10 stl_echo_test
[NG] sample.sh:14 stl_echo_test_ng
 [EXPECTED]
hello
 [ACTUAL]
NG
```

The meaning of this output is as follows.

- `[NG]`: Indicates that the test case failed
- `sample.sh`: The name of the file where the test was executed
- `:14`: Indicates the line number where the assertion function was executed
- `stl_echo_test_ng`: The name of the executed test case function

When a test fails, additional information is displayed.

- `[EXPECTED]`: Shows the expected result in the test
- `[ACTUAL]`: Shows the actual result obtained in the test

## setup and teardown

The `setup()` and `teardown()` functions have special roles.

- `setup()`: Called before each test case function is executed. It prepares for the test.
- `teardown()`: Called after each test case function is executed. It performs cleanup after the test.

These function definitions cannot be omitted.

## Available Assertion Functions

For usage of each assertion function, please refer to the following document.

- [Reference: Assertion Functions](./reference_assertion_functions.md)

## Determination of Test Code Files

All `*.sh` files found recursively under the `stl/code` directory are determined to be test code files.

## Naming Convention for Test Case Functions

Test case functions must start with the `stl_` prefix.
For example, function names like these.

- `stl_echo_test`
- `stl_file_exists_test`
- `stl_error_handling_test`

By following this naming convention, stl automatically identifies and executes test case functions.

## Recommended Criteria for Splitting Test Code Files

It is recommended to create test code files for each test target.
This makes test management easier and allows grouping of related test cases.

Grouping test case functions with long execution times is also one of the criteria for splitting.
You can reduce test execution time by running only specific test code files.

## Execution of Test Code

Test code execution follows the following flow.

1. Detection of test code files
2. Import for each test code file
   - Specifically, it is read with the shell command `.`
   - Normal shell script code such as function definitions and variable definitions in the test code file is executed at this stage
3. Sequential execution of test case functions in the test code file

## Difference between {} and () in Test Case Functions

The behavior changes depending on whether you use `{}` or `()` when defining test case functions.

### {}

Executes the function in the current shell environment. Variable changes affect other test case functions.

```sh
stl_echo_test() {
  assert_equal "\"${target_script}\" hello" "hello"
}
```

### ()

Executes the function in a subshell. Variable changes do not affect other test case functions.

```sh
stl_echo_test() (
  assert_equal "\"${target_script}\" hello" "hello"
)
```

To maintain test independence, it is generally recommended to use `()`.

Additionally, the following writing style is also possible.

```sh
stl_echo_test() {
  (
    assert_equal "\"${target_script}\" hello" "hello"
  )
}
```

## Options for Test Execution

### -f

- `-f <filename>`: Executes only the specified test case file.

```sh
# When executing a single test code file
$ ./stl/start_stl.sh -f ./stl/code/sample.sh

# When executing multiple test code files
$ ./stl/start_stl.sh -f ./stl/code/sample_1.sh -f stl/code/sample_2.sh
```

## List of Environment Variables Available in Test Code

The main environment variables available in test code are as follows.

- `PRJ_ROOT_DIR`: Absolute path of the parent directory of the `stl` directory (`STL_ROOT_DIR`)
- `STL_ROOT_DIR`: Absolute path of the stl root directory (`stl` directory)
- `STL_FUNCTION_DIR`: Absolute path of the `stl/func` directory where stl functions are stored
- `STL_TEST_CODE_DIR`: Absolute path of the `stl/code` directory where test code is stored
- `STL_TEST_DATA_DIR`: Absolute path of the `stl/data` directory where test data is stored
- `STL_MODULE_DIR`: Absolute path of the `stl/mod` directory where stl modules are stored

By using these environment variables, you can use relative paths in your test code that do not depend on the project structure.

## Related Documents

- [Reference: Assertion Functions](reference_assertion_functions.md). Detailed explanation of assertion functions
- [Design and Implementation of stl (Shell Testing Library)](design.md): Overview of stl's design philosophy, structure, and implementation features
- [Advanced Practical Guide](advanced_practical_guide.md). Advanced usage and practical techniques
