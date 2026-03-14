// Task 1: Number Analysis App
// Name: Markos Tigistu

// This function finds and returns the largest number in the list
int findMax(List<int> numbers) {
  int max = numbers[0]; // start with the first element

  for (int number in numbers) {
    if (number > max) {
      max = number; // update max if a bigger number is found
    }
  }

  return max;
}

// This function finds and returns the smallest number in the list
int findMin(List<int> numbers) {
  int min = numbers[0]; // start with the first element

  for (int number in numbers) {
    if (number < min) {
      min = number; // update min if a smaller number is found
    }
  }

  return min;
}

// This function calculates the total sum of all numbers in the list
int calculateSum(List<int> numbers) {
  int sum = 0; // accumulator variable

  for (int number in numbers) {
    sum += number; // add each number to sum
  }

  return sum;
}

// This function calculates the average of the list
double calculateAverage(List<int> numbers) {
  int sum = calculateSum(numbers); // reuse existing function
  return sum / numbers.length; // divide by number of elements
}

void main() {
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  int maxValue = findMax(numbers);
  int minValue = findMin(numbers);
  int sum = calculateSum(numbers);
  double average = calculateAverage(numbers);

  print('Number Analysis Results');
  print('========================');
  print('Numbers: $numbers');
  print('Maximum value : $maxValue');
  print('Minimum value : $minValue');
  print('Sum           : $sum');
  print('Average       : $average');
}

// Q1. What is the difference between List<int> and List<dynamic> in Dart?

//List<int> is a typed list that can only store integers. This helps Dart catch errors early because the compiler will not allow other data types like strings or doubles in the list.

//Q2. Why initialize the running maximum with the first element?

//In findMax() the running maximum is initialized with the first element of the list because that value is guaranteed to exist in the list.

//Q3. What design principle is shown by calling calculateSum() inside calculateAverage()?

//This demonstrates the principle of code reuse (modularity). Instead of rewriting the sum calculation again inside calculateAverage(), the program simply calls calculateSum().

//Q4. What does the for-in loop do in Dart?

//The for-in loop goes through each element in a collection (like a list) one by one.

//Q5. What happens if findMax() receives an empty list?

//f an empty list is passed, the program will try to access numbers[0]. Since the list has no elements, this will cause a runtime error.

//



