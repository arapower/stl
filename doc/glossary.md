# Glossary

### Test Target

A test target refers to the shell script or command that is being tested using stl.
This is typically a script with actual functionality included in the project's main codebase.
For example, a file like `app/sample.sh` would be a test target.
The test target contains the features or behaviors that are verified by the tests, and stl's test code checks the accuracy and expected behavior of this target.

### Test Code File

A test code file is a file used to write tests for stl.
These files are usually saved with a `.sh` extension in the `stl/code` directory.
For example, a file name might be `stl/code/sample.sh`.
Test code files include test case functions, setup() and teardown() functions, and definitions of other auxiliary functions and variables necessary for testing.
These files are automatically detected and executed by stl's test execution script.

### Test Case Function

A test case function represents individual tests defined within a test code file.
These functions must always start with the `stl_` prefix.
For example, `stl_echo_test` or `stl_file_exists_test`.
Each test case function contains logic to test a specific feature or behavior, and typically uses one or more assertion functions to compare expected results with actual results.
stl automatically identifies and executes test case functions that follow this naming convention.

### Assertion Function

An assertion function is used to compare the expected value of a test with the actual result.
These functions play a crucial role in determining the success or failure of a test.
stl provides various types of assertion functions, such as `assert_equal`, `assert_not_equal`, `assert_match`, and others.
Assertion functions are used within test case functions to verify that the output or behavior of the test target is as expected.
If an assertion function fails, stl reports the test failure and displays the difference between the expected and actual values.

## Related Documents

- [User Manual](user_manual.md). Basic usage including naming conventions for test case functions
- [Reference: Assertion Functions](reference_assertion_functions.md). Detailed explanation of assertion functions
