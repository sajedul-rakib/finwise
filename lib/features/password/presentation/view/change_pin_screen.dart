import 'dart:developer';

import 'package:finwise/core/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_btn.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _currentPinController;
  late TextEditingController _newPinController;
  late TextEditingController _confirmPinController;
  late bool _currentPinObscure;
  late bool _newPinObscure;
  late bool _confirmPinObscure;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _currentPinController = TextEditingController();
    _newPinController = TextEditingController();
    _confirmPinController = TextEditingController();
    _currentPinObscure = true;
    _newPinObscure = true;
    _confirmPinObscure = true;
  }

  @override
  dispose() {
    _currentPinController.dispose();
    _newPinController.dispose();
    _confirmPinController.dispose();
    _formKey.currentState?.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //checking password has bees set before time;
    final box = Hive.box('settings');
    final bool hasPin = box.get('hasPin', defaultValue: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(hasPin ? "Change Pin" : "Set Pin"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 30,
            children: [
              if (hasPin)
                FormInput(
                  hintText: "● ● ● ●",
                  labelText: "Current Pin",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentPinObscure = !_currentPinObscure;
                      });
                    },
                    child: Icon(
                      !_currentPinObscure
                          ? Icons.lock_open_outlined
                          : Icons.lock,
                    ),
                  ),
                  obscureText: _currentPinObscure,
                  controller: _currentPinController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please enter your current pin";
                    }
                    return null;
                  },
                ),
              FormInput(
                hintText: "● ● ● ●",
                labelText: "New Pin",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _newPinObscure = !_newPinObscure;
                    });
                  },
                  child: Icon(
                    !_newPinObscure ? Icons.lock_open_outlined : Icons.lock,
                  ),
                ),
                obscureText: _newPinObscure,
                controller: _newPinController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Please enter your new pin";
                  }
                  return null;
                },
                errorBuilder: (context, string) {
                  if (_newPinController.text.length < 4) {
                    return const Text("Pin must be 4 digits");
                  }
                  return SizedBox.shrink();
                },
              ),
              FormInput(
                hintText: "● ● ● ●",
                labelText: "Confirm Pin",
                obscureText: _confirmPinObscure,
                controller: _confirmPinController,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _confirmPinObscure = !_confirmPinObscure;
                    });
                  },
                  child: Icon(
                    !_confirmPinObscure ? Icons.lock_open_outlined : Icons.lock,
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(8),
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onChanged: (value) {
                  _formKey.currentState?.validate();
                },
                errorBuilder: (context, string) {
                  if (_confirmPinController.text.isEmpty) {
                    return const Text("Please enter your confirm pin");
                  }
                  if (_newPinController.text != _confirmPinController.text) {
                    return const Text("Pin Does Not Match");
                  }
                  if (_confirmPinController.text.length < 4) {
                    return const Text("Pin must be 4 digits");
                  }
                  return SizedBox.shrink();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your confirm pin";
                  }
                  if (value != _newPinController.text) {
                    return "Pin Does Not Match";
                  }
                  return null;
                },
              ),
              AppButton(
                title: hasPin ? "Change Pin" : "Set Pin",
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    log("Set pin successfully");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
