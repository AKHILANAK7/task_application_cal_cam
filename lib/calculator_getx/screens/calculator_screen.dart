import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_application_2/calculator_getx/providers/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color(0xFFF7F3FF),
          title: const Text('RadicalStart'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildButtonRow(["C", "٪", "⌫", "÷"]),
                  _buildButtonRow(["7", "8", "9", "x"]),
                  _buildButtonRow(["4", "5", "6", "-"]),
                  _buildButtonRow(["3", "2", "1", "+"]),
                  _buildButtonRow([".", "0", "00", "="]),
                ],
              ),
            ),
            Container(
              height: 210,
              child: Expanded(
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 231, 231),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.bottomRight,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(
                        () => Text(
                          controller.output.value,
                          style: const TextStyle(
                              fontSize: 48,
                              fontWeight:
                                  FontWeight.bold), // Style for the result
                        ),
                      ),
                      Obx(
                        () => Text(
                          controller.equation.value,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.grey), // Style for the equation
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((button) {
          Color buttonColor = _getButtonColor(button);
          Color textColor = _getTextColor(button);
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor, // Set button background color
                  shape: const CircleBorder(), // Make buttons circular
                ),
                onPressed: () => controller.input(button),
                child: Text(
                  button,
                  style: TextStyle(fontSize: 32, color: textColor),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getButtonColor(String button) {
    if (button == "C" || button == "٪" || button == "⌫") {
      return Colors.grey.shade300;
    } else if (button == "÷" ||
        button == "x" ||
        button == "-" ||
        button == "+") {
      return Colors.orange;
    } else if (button == "=") {
      return const Color.fromARGB(255, 55, 2, 248);
    } else {
      return const Color.fromARGB(255, 233, 244, 251);
    }
  }
}

Color _getTextColor(String button) {
  if (button == "C" || button == "٪" || button == "⌫") {
    return Colors.black; // Black text for utility buttons
  } else if (button == "=") {
    return Colors.white; // White text for equals button
  } else if (button == "÷" || button == "x" || button == "-" || button == "+") {
    return Colors.white; // White text for operators
  } else {
    return Colors.black; // Black text for numbers
  }
}
