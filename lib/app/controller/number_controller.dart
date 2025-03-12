import 'package:get/get.dart';
import '../models/highlight_rule.dart';

class NumberController extends GetxController {
  var selectedRule = HighlightRule.odd.obs;
  var numbers = List.generate(100, (index) => index + 1).obs;

  void updateRule(HighlightRule rule) {
    selectedRule.value = rule;
    update();
  }

  bool isHighlighted(int number) {
    switch (selectedRule.value) {
      case HighlightRule.odd:
        return number % 2 != 0;
      case HighlightRule.even:
        return number % 2 == 0;
      case HighlightRule.prime:
        return _isPrime(number);
      case HighlightRule.fibonacci:
        return _isFibonacci(number);
      default:
        return false;
    }
  }

  bool _isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool _isFibonacci(int number) {
    int a = 0, b = 1;
    while (b < number) {
      int temp = b;
      b = a + b;
      a = temp;
    }
    return b == number;
  }
}
