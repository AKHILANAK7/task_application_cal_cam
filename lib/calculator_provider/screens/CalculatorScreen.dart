import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_application_2/calculator_provider/provider/calc_provider.dart';

class CalculatorScreenProvider extends StatelessWidget {
  const CalculatorScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color(0xFFF7F3FF),
          title: const Text('RadicalStart'),
        ),
        body: Column(
          children: [
            // Calculator Display Section
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 231, 231),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      calculator.output,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      calculator.equation,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Calculator Buttons Section
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildButtonRow(context, ["C", "٪", "⌫", "÷"]),
                  _buildButtonRow(context, ["7", "8", "9", "x"]),
                  _buildButtonRow(context, ["4", "5", "6", "-"]),
                  _buildButtonRow(context, ["3", "2", "1", "+"]),
                  _buildButtonRow(context, [".", "0", "00", "="]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildButtonRow(BuildContext context, List<String> buttons) {
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
              style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
              onPressed: () => context.read<CalculatorProvider>().input(button),
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
  } else if (button == "÷" || button == "x" || button == "-" || button == "+") {
    return Colors.orange;
  } else if (button == "=") {
    return const Color.fromARGB(255, 55, 2, 248);
  } else {
    return const Color.fromARGB(255, 233, 244, 251);
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
