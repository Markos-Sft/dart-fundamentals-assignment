
// Name: [MARKOS TIGISTU]

import 'dart:async';

class Calculator {
  final String name;
  // Constant for the simulated network delay
  static const Duration _networkDelay = Duration(seconds: 1, milliseconds: 500);

  Calculator(this.name);

  /// Adds two numbers synchronously
  double add(double a, double b) => a + b;

  /// Subtracts b from a synchronously
  double subtract(double a, double b) => a - b;

  /// Multiplies two numbers synchronously
  double multiply(double a, double b) => a * b;

  /// Divides a by b. Throws ArgumentError if b is zero.
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

  /// Simulates a remote calculation with a 1.5s delay
  Future<double> computeAsync(double a, double b, String op) async {
    double result;
    
    // Determine which sync method to call based on the operation string
    switch (op.toLowerCase()) {
      case 'add':
        result = add(a, b);
        break;
      case 'subtract':
        result = subtract(a, b);
        break;
      case 'multiply':
        result = multiply(a, b);
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw ArgumentError('Unknown operation: $op');
    }

    // Simulate network/server latency
    await Future.delayed(_networkDelay);
    return result;
  }

  /// Calls the async computer and handles formatting and errors
  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      print('$op($a, $b) = $result');
    } catch (e) {
      // Catch ArgumentErrors from divide() or unknown operations
      print('Error: ${e.toString().replaceFirst('Invalid argument(s): ', '')}');
    }
  }
}

Future<void> main() async {
  final calc = Calculator('MyCalculator');
  print('--- ${calc.name} ---');

  // Perform required operations
  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(10, 4, 'subtract');
  await calc.displayResult(10, 4, 'multiply');
  await calc.displayResult(10, 4, 'divide');
  await calc.displayResult(15, 3, 'divide');
  
  // Test error handling (Division by zero)
  await calc.displayResult(10, 0, 'divide');

  print('All calculations complete.');
}
//Q6. Difference between Sync and Async?

//A synchronous function blocks the program execution until it completes; the next line of code cannot run until the current function returns. An asynchronous function allows the program to initiate an operation and move on to other tasks while waiting for that operation to finish. In this class, divide() is synchronous because it performs a simple mathematical calculation that happens instantly in memory. computeAsync() is asynchronous because it simulates a "long-running" task (like a network request) that requires the program to wait without freezing the thread.

//Q7. Purpose of await?

//The await keyword tells Dart to pause execution within the async function until the Future completes, returning the actual value. If you forget await, the function returns an "uncompleted" Instance of 'Future<double>' immediately. Instead of the numerical result, your program would print something like add(10, 4) = Instance of 'Future<double>' because the calculation hasn't finished yet when the print statement runs.

//Q8. Purpose of try-catch?

//The try-catch block is used to intercept exceptions (like the ArgumentError thrown when dividing by zero) so the program can handle them gracefully. If you removed it and called divide(10, 0), the exception would go "uncaught," causing the application to crash or terminate abruptly with an error trace, preventing the "All calculations complete" message from ever appearing.

//Q9. Why throw ArgumentError instead of returning 0?

//Throwing an error is better because returning 0 is ambiguous—it could be a valid result of a calculation (e.g., 5 - 5). This reflects the Fail-Fast principle and Separation of Concerns. By throwing an error, the method signals that the input was invalid, forcing the caller to handle the logic error rather than proceeding with incorrect data.

//Q10. Why async on main()?

//The async keyword on main() allows us to use await inside the body of the function. This is necessary here because we want to wait for each calculation to finish before starting the next one to ensure the output appears in the correct order. Without making main() async, we could not use await, and all the displayResult calls would trigger simultaneously, likely printing the "All calculations complete" message before any actual results were returned.

