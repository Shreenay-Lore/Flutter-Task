import 'package:flutter/material.dart';
import 'package:flutter_task/controller/number_controller.dart';
import 'package:get/get.dart';


class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NumbersController numbersController = Get.put(NumbersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRuleButton('Odd'),
                _buildRuleButton('Even'),
                _buildRuleButton('Prime'),
                _buildRuleButton('Fibonacci'),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10, 
              ),
              itemCount: 100,
              itemBuilder: (context, index) {
                int number = index + 1;
            
                return Obx(() {
                  bool isHighlighted = numbersController.checkNumber(number);
            
                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isHighlighted ? Colors.deepPurple : Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '$number',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRuleButton(String rule) {
    return Obx(() {
      final numbersController = Get.find<NumbersController>();

      return ElevatedButton(
        onPressed: () {
          numbersController.selectedRule.value = rule;
        },
        style: TextButton.styleFrom(
          foregroundColor: numbersController.selectedRule.value == rule
              ? Colors.deepPurple
              : Colors.black,
        ),
        child: Text(rule),
      );
    });
  }
}