# Design and Implementation of stl (Shell Testing Library)

## Design Philosophy

stl is designed based on the following principles.

1. Accessibility: Emphasizes the ability for developers with shell scripting experience to start using it immediately
2. Simplicity: Avoids complex dependencies and configurations, maintaining an intuitive structure
3. Portability: Prioritizes POSIX shell compatibility to work in various environments
4. Extensibility: Provides a flexible structure that allows users to add their own assertions and features

## Directory Structure

The main structure of the installed stl is as follows.

```
stl
├── code          # Directory to store test code files
├── data          # Directory to store data used in tests
├── doc           # Directory to store various documents
├── func          # Directory to store test function files
├── mod           # Directory to store various modules
└── start_stl.sh  # Script for test execution
```

### code/

This is the directory where user-created test codes are stored.
Each test file has a `.sh` extension.

### data/

This is the directory for storing various data files used in tests.
It stores input data needed for test cases and expected output data.

### doc/

This directory stores various documents related to stl.
It includes usage instructions, design philosophy, and API references.

### func/

This directory stores common functions used in tests and custom functions defined by users.
This facilitates the reuse of functions between test codes.

### mod/

This stores the core modules and library files of stl.

### start_stl.sh

This is the entry point script that starts the test execution.
It sets environment variables and calls the test runner.

## Implementation Features

1. POSIX Shell Compatibility: Uses POSIX shell-compatible syntax as much as possible to ensure operation in a wide range of environments
2. Modularization: Prepares separate scripts for each function, improving maintainability and extensibility
3. Utilization of Environment Variables: Sets information necessary for test execution as environment variables and shares them between scripts
4. Minimal Dependencies: Minimizes dependencies on external tools, allowing immediate use in many environments
5. Flexible Test Structure: Supports setup() and teardown() functions, making it easy to perform pre-processing and post-processing of tests

stl is developed based on these design philosophies and implementation policies, aiming to provide a simple yet effective test environment for shell scripts.
It also welcomes continuous improvement and feedback from the community, with the goal of evolving into an easier-to-use and more powerful tool.

## Related Documents

- [User Manual](user_manual.md). Basic usage including naming conventions for test case functions
- [Reference: Assertion Functions](reference_assertion_functions.md). Detailed explanation of assertion functions
- [Advanced Practical Guide](advanced_practical_guide.md). Advanced usage and practical techniques
- [Glossary](glossary.md): Definitions of key terms used in stl
