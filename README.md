# stl

- Repository: [https://github.com/arapower/stl](https://github.com/arapower/stl)

stl (Shell Testing Library) is a testing library designed to simplify writing tests for shell scripts.
It aims to use POSIX shell-compatible syntax as much as possible to ensure wide compatibility across various environments.

## Installation

To create a directory for stl, execute the following command in the desired location.

```sh
curl -fsSL https://raw.githubusercontent.com/arapower/stl/main/mod/setup_stl.sh | sh
```

Or,

```sh
wget -O - https://raw.githubusercontent.com/arapower/stl/main/mod/setup_stl.sh | sh
```

## Uninstallation

Simply delete the `stl` directory created by the installation command.

## Basic Usage

1. Save test code in the `code` directory
2. Run the `start_stl.sh` script
3. View the execution results

Test code is structured as follows.

```sh
setup() {
  # Preparation before the test
}

teardown() {
  # Cleanup after the test
}

stl_test_case() {
  # Test case
}
```

## Test Example

Here's a simple test example.

### Code to be Tested

- Test target: `app/sample.sh`

```sh
#!/bin/sh
echo "$1"
```

### Test Code

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

## Related Documents

- [User Manual](doc/user_manual.md): Basic usage including naming conventions for test case functions
- [Reference: Assertion Functions](doc/reference_assertion_functions.md): Detailed explanation of assertion functions
- [Design and Implementation of stl (Shell Testing Library)](doc/design.md): Overview of stl's design philosophy, structure, and implementation features
- [Advanced Practical Guide](doc/advanced_practical_guide.md): Advanced usage and practical techniques
