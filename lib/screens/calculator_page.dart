import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _input = '';
  String _result = '';
  bool _resultShown = false; // Track if result is shown

  void _onPressed(String value) {
    setState(() {
      if (value == 'C') {
        _input = '';
        _result = '';
        _resultShown = false;
      } else if (value == '⌫') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (value == '=') {
        try {
          _result = _evaluateExpression(_input);
          _resultShown = true;
        } catch (e) {
          _result = 'Error';
          _resultShown = true;
        }
      } else {
        // If result was shown, start fresh input
        if (_resultShown) {
          _input = value;
          _result = '';
          _resultShown = false;
        } else {
          _input += value;
        }
      }
    });
  }

  // === Expression Evaluator ===
  String _evaluateExpression(String expr) {
    expr = expr.replaceAll('×', '*').replaceAll('÷', '/').replaceAll('%', '/100');

    // handle square root (√)
    expr = expr.replaceAllMapped(RegExp(r'√(\d+(\.\d+)?)'), (match) {
      double val = double.parse(match[1]!);
      return sqrt(val).toString();
    });

    // support ^ (power)
    expr = expr.replaceAllMapped(RegExp(r'(\d+(\.\d+)?)\^(\d+(\.\d+)?)'), (match) {
      double base = double.parse(match[1]!);
      double exp = double.parse(match[3]!);
      return pow(base, exp).toString();
    });

    try {
      // basic evaluator (only + - * /)
      List<String> tokens = expr.split(RegExp(r'([+\-*/])')).map((e) => e.trim()).toList();
      List<String> ops = RegExp(r'[+\-*/]').allMatches(expr).map((m) => m.group(0)!).toList();

      double total = double.parse(tokens[0]);
      for (int i = 0; i < ops.length; i++) {
        double next = double.parse(tokens[i + 1]);
        switch (ops[i]) {
          case '+':
            total += next;
            break;
          case '-':
            total -= next;
            break;
          case '*':
            total *= next;
            break;
          case '/':
            total /= next;
            break;
        }
      }

      if (total % 1 == 0) return total.toInt().toString();
      return total.toStringAsFixed(4).replaceFirst(RegExp(r'0+$'), '').replaceFirst(RegExp(r'\.$'), '');
    } catch (e) {
      return 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Dynamic first button: AC or backspace icon
    final String firstButton = (_input.isEmpty || _resultShown) ? 'C' : '⌫';

    final buttons = [
      [firstButton, '%', '√', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['0', '.', '^', '='],
    ];

    final flatButtons = buttons.expand((row) => row).toList();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF151E28),
                    const Color(0xFF1A2332),
                    const Color(0xFF1E2A38),
                  ]
                : [
                    const Color(0xFFFFFFFF),
                    const Color(0xFFF5FBFD),
                    const Color(0xFFEAF6FA),
                  ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  children: [
                    Text(
                      'Calculator',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? const Color(0xFFE8F0F5)
                            : const Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                ),
              ),

              // Calculator Body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),

                      // Display - Lebih kecil
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: isDark ? const Color(0xFF1E2A38) : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFA8D8EA).withOpacity(0.3),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isDark
                                  ? Colors.black.withOpacity(0.3)
                                  : const Color(0xFFA8D8EA).withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Input text - lebih kecil
                            SizedBox(
                              height: 30,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                reverse: true,
                                child: Text(
                                  _input.isEmpty ? '0' : _input,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: isDark
                                        ? const Color(0xFFB0BEC5)
                                        : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Result text - lebih kecil
                            Text(
                              _result,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? const Color(0xFFA8D8EA)
                                    : const Color(0xFF7AB8CE),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Buttons Grid - lebih kecil dan lebih rapat
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: flatButtons.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.0,
                          ),
                          itemBuilder: (context, index) {
                            final btn = flatButtons[index];

                            final isOperator = ['+', '-', '×', '÷', '=', '%', '√', '^'].contains(btn);
                            final isClear = btn == 'C';
                            final isBack = btn == '⌫';

                            Color bg;
                            Color fg;

                            if (isClear) {
                              bg = Colors.redAccent;
                              fg = Colors.white;
                            } else if (isBack) {
                              bg = const Color(0xFFFFC107);
                              fg = Colors.white;
                            } else if (isOperator) {
                              bg = const Color(0xFFA8D8EA);
                              fg = Colors.white;
                            } else {
                              bg = isDark ? const Color(0xFF1E2A38) : Colors.white;
                              fg = isDark ? const Color(0xFFE8F0F5) : Colors.black87;
                            }

                            return Material(
                              color: bg,
                              borderRadius: BorderRadius.circular(16),
                              elevation: 2,
                              shadowColor: isDark
                                  ? Colors.black.withOpacity(0.4)
                                  : Colors.grey.withOpacity(0.3),
                              child: InkWell(
                                onTap: () => _onPressed(btn),
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: btn == '⌫'
                                      ? Icon(
                                          Icons.backspace_outlined,
                                          size: 22,
                                          color: fg,
                                        )
                                      : Text(
                                          btn,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: fg,
                                          ),
                                        ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}