# Reference: Assertion Functions

Test functions are available for use within test code files.
The following describes the behavior of each test function.

### assert_both_equal

- Arguments
  - 1: Command string to verify
  - 2: Expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output + standard error output) exactly matches argument 2

```sh
assert_both_equal "echo 'Hello, World!'" "Hello, World!"
```

### assert_both_not_equal

- Arguments
  - 1: Command string to verify
  - 2: Expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output + standard error output) does **not** exactly match argument 2

```sh
assert_both_not_equal "echo 'Hello, World!'" "Goodbye, World!"
```

### assert_equal

- Arguments
  - 1: Command string to verify
  - 2: Expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output) exactly matches argument 2

```sh
assert_equal "echo 'Hello'" "Hello"
```

### assert_not_equal

- Arguments
  - 1: Command string to verify
  - 2: Expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output) does **not** exactly match argument 2

```sh
assert_not_equal "echo 'Hello'" "World"
```

### assert_error_equal

- Arguments
  - 1: Command string to verify
  - 2: Expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard error output) exactly matches argument 2

```sh
assert_error_equal "command_that_fails" "sh: line 1: command_that_fails: command not found"
```

### assert_error_not_equal

- Arguments
  - 1: Command string to verify
  - 2: Expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard error output) does **not** exactly match argument 2

```sh
assert_error_not_equal "command_that_fails" "Different error message"
```

### assert_match

- Arguments
  - 1: Command string to verify
  - 2: Expected result (regular expression)
- Judgment
  - `OK` if the result of executing argument 1 (standard output) contains the regular expression in argument 2

```sh
assert_match "echo 'Hello, World!'" "Hello.*World"
```

### assert_not_match

- Arguments
  - 1: Command string to verify
  - 2: Expected result (regular expression)
- Judgment
  - `OK` if the result of executing argument 1 (standard output) does **not** contain the regular expression in argument 2

```sh
assert_not_match "echo 'Hello, World!'" "Goodbye"
```

### assert_error_match

- Arguments
  - 1: Command string to verify
  - 2: Expected result (regular expression)
- Judgment
  - `OK` if the result of executing argument 1 (standard error output) contains the regular expression in argument 2

```sh
assert_error_match "command_that_fails" "command not found"
```

### assert_error_not_match

- Arguments
  - 1: Command string to verify
  - 2: Expected result (regular expression)
- Judgment
  - `OK` if the result of executing argument 1 (standard error output) does **not** contain the regular expression in argument 2

```sh
assert_error_not_match "command_that_fails" "Different error.*"
```

### assert_both_equal_file

- Arguments
  - 1: Command string to verify
  - 2: Path to the file containing the expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output + standard error output) exactly matches the content of argument 2

```sh
expected=$(mktemp)
echo 'Expected output' > "${expected}"
assert_both_equal_file "echo 'Expected output'" "${expected}"
```

### assert_both_not_equal_file

- Arguments
  - 1: Command string to verify
  - 2: Path to the file containing the expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output + standard error output) does **not** exactly match the content of argument 2

```sh
unexpected=$(mktemp)
echo 'Unexpected output' > "${unexpected}"
assert_both_not_equal_file "echo 'Expected output'" "${unexpected}"
```

### assert_equal_file

- Arguments
  - 1: Command string to verify
  - 2: Path to the file containing the expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output) exactly matches the content of argument 2

```sh
expected=$(mktemp)
echo 'Expected output' > "${expected}"
assert_equal_file "cat ${expected}" "${expected}"
```

### assert_not_equal_file

- Arguments
  - 1: Command string to verify
  - 2: Path to the file containing the expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard output) does **not** exactly match the content of argument 2

```sh
unexpected=$(mktemp)
echo 'Unexpected output' > "${unexpected}"
assert_not_equal_file "${target_script}" "${unexpected}"
```

### assert_error_equal_file

- Arguments
  - 1: Command string to verify
  - 2: Path to the file containing the expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard error output) exactly matches the content of argument 2

```sh
expected_error=$(mktemp)
echo 'Expected error message' > "${expected_error}"
assert_error_equal_file "${target_script}" "${expected_error}"
```

### assert_error_not_equal_file

- Arguments
  - 1: Command string to verify
  - 2: Path to the file containing the expected result
- Judgment
  - `OK` if the result of executing argument 1 (standard error output) does **not** exactly match the content of argument 2

```sh
unexpected_error=$(mktemp)
echo 'Unexpected error message' > "${unexpected_error}"
assert_error_not_equal_file "command_that_fails" "${unexpected_error}"
```

## Related Documents

- [User Manual](user_manual.md). Basic usage including naming conventions for test case functions
- [Glossary](glossary.md): Definitions of key terms used in stl
