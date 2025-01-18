# Unexpected Crash: Accessing Deallocated Object in Objective-C

This repository demonstrates a common Objective-C error: accessing a deallocated object.  This often results in unexpected crashes without clear error messages, especially in situations involving strong reference cycles.

The `bug.m` file shows code that creates a strong reference cycle, leading to objects not being deallocated. Accessing these objects after they should have been deallocated causes the crash.

The `bugSolution.m` file provides a solution using `weak` references to break the strong reference cycle and prevent the crashes.  This illustrates best practices for memory management in Objective-C to avoid this common issue.

## How to Reproduce

1. Clone this repository.
2. Open the project in Xcode.
3. Run the application. Observe the unexpected crash.
4. Examine and run `bugSolution.m` to see the resolved issue.

## Solution

The key is to use `weak` references where appropriate, breaking the retain cycles and enabling proper deallocation.