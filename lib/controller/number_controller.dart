import 'package:get/get.dart';

class NumbersController extends GetxController {
  var selectedRule = 'Odd'.obs;

  bool checkNumber(int number) {
    switch (selectedRule.value) {
      case 'Odd':
        return number.isOdd;
      case 'Even':
        return number.isEven;
      case 'Prime':
        return isNumPrime(number);
      case 'Fibonacci':
        return isNumFibonacci(number);
      default:
        return false;
    }
  }

  bool isNumPrime(int num) {
    if (num < 2) return false;
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  bool isNumFibonacci(int n) {
    int a = 0, b = 1, temp;
    while (b < n) {
      temp = a + b;
      a = b;
      b = temp;
    }
    return n == b || n == 0;
  }
}






