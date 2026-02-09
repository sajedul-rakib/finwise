import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constant/app_colors.dart';

class FormInput extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final bool readOnly;

  const FormInput({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 8,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(letterSpacing: 0, fontSize: 16),
        filled: true,
        fillColor: AppColors.lightGreen,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  // Controller lifted to PinScreen to sync Keyboard and Input
  final TextEditingController _pinController = TextEditingController();

  void _onKeyTap(String key) {
    if (key == 'BACKSPACE') {
      if (_pinController.text.isNotEmpty) {
        _pinController.text = _pinController.text.substring(
          0,
          _pinController.text.length - 1,
        );
      }
    } else {
      // Limit to 4 digits as per your requirements
      if (_pinController.text.length < 4) {
        _pinController.text = _pinController.text + key;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SafeArea(
              child: Center(
                child: Text(
                  "Enter Pin",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textGreenColor,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  FormInput(
                    controller: _pinController,
                    hintText: "Enter Pin",
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                  ),
                  const Spacer(),
                  PermanentNumericKeyboard(onKeyTap: _onKeyTap),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PermanentNumericKeyboard extends StatelessWidget {
  final Function(String) onKeyTap;

  const PermanentNumericKeyboard({super.key, required this.onKeyTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildKeyboardRow(['1', '2', '3']),
          _buildKeyboardRow(['4', '5', '6']),
          _buildKeyboardRow(['7', '8', '9']),
          _buildKeyboardRow(['', '0', 'BACKSPACE']),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(List<String> keys) {
    return Row(
      children: keys.map((key) {
        if (key.isEmpty) return const Expanded(child: SizedBox());

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              elevation: 2,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () => onKeyTap(key),
                child: SizedBox(
                  height: 65,
                  child: Center(
                    child: key == 'BACKSPACE'
                        ? const Icon(
                            Icons.backspace_outlined,
                            color: Colors.redAccent,
                          )
                        : Text(
                            key,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textGreenColor,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
