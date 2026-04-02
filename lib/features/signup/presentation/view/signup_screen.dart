import 'package:currency_picker/currency_picker.dart';
import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:finwise/core/widgets/loader.dart';
import 'package:finwise/features/bottom_nav_bar/presentation/view/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/form_input.dart';
import '../../../login/presentation/view/login_screen.dart';
import '../../domain/entities/user_entity.dart';
import '../riverpod/sign_up_controller.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _currencyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  DateTime? _selectedDate;
  String? _selectedCurrency;

  Widget get _vSpace => const SizedBox(height: 10);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _currencyController.dispose();
    _dobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _onSignUpPressed() {
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match!")));
      return;
    }

    final user = UserEntity(
      userId: '',
      fullName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      countryName: _currencyController.text.trim(),
      currency: _selectedCurrency,
      dateOfBirth: _selectedDate ?? DateTime.now(),
    );

    ref
        .read(signUpControllerProvider.notifier)
        .signUp(password: _passwordController.text.trim(), user: user);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<UserEntity?>>(signUpControllerProvider, (prev, next) {
      next.whenOrNull(
        error: (error, _) => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString()))),
        data: (user) {
          if (user != null) {
            _formKey.currentState?.reset();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const AppBottomNavBar()),
              (path) => false,
            );
          }
        },
      );
    });

    final signUpState = ref.watch(signUpControllerProvider);

    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            flex: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      FormInput(
                        controller: _nameController,
                        hintText: "John Doe",
                        labelText: "Full Name",
                      ),
                      _vSpace,
                      FormInput(
                        controller: _emailController,
                        hintText: "example@gmail.com",
                        labelText: "Email",
                      ),
                      _vSpace,
                      FormInput(
                        onTap: () => _selectDate(context),
                        controller: _dobController,
                        hintText: "DD/MM/YYYY",
                        labelText: "Date of Birth",
                      ),
                      _vSpace,
                      _buildCurrencyRow(context),
                      _vSpace,
                      _buildPasswordField(
                        controller: _passwordController,
                        label: 'Password',
                        visible: _showPassword,
                        onToggle: () =>
                            setState(() => _showPassword = !_showPassword),
                      ),
                      _vSpace,
                      _buildPasswordField(
                        controller: _confirmPasswordController,
                        label: 'Confirm Password',
                        visible: _showConfirmPassword,
                        onToggle: () => setState(
                          () => _showConfirmPassword = !_showConfirmPassword,
                        ),
                      ),
                      _vSpace,
                      _buildTermsText(),
                      _vSpace,
                      signUpState.isLoading
                          ? const Loader()
                          : _buildSubmitButton(),
                      _vSpace,
                      _buildLoginRedirect(context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Expanded(
      flex: 3,
      child: SafeArea(
        child: Center(
          child: SizedBox(
            width: 300,
            child: AppText(
              'Create account',
              textAlign: TextAlign.center,
              size: TextSize.xxxxl,
              weight: AppFontWeight.bold,
              color: AppColors.cyprusGreen,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrencyRow(BuildContext context) {
    return Row(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: FormInput(
            controller: _currencyController,
            hintText: _currencyController.text.isNotEmpty
                ? _currencyController.text
                : "Select your country",
            labelText: "Your Nationality",
            readOnly: true,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.caribbeanGreen,
              size: 30,
            ),
            onTap: () => _currencyPickerBasedOnCountry(context),
          ),
        ),
        if (_selectedCurrency != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: AppText(
              _selectedCurrency!,
              weight: AppFontWeight.bold,
              size: TextSize.xxl,
              color: AppColors.textGreenColor,
            ),
          ),
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool visible,
    required VoidCallback onToggle,
  }) {
    return FormInput(
      controller: controller,
      labelText: label,
      hintText: "● ● ● ● ● ● ● ●",
      obscureText: !visible,
      suffixIcon: GestureDetector(
        onTap: onToggle,
        child: Icon(
          visible ? Icons.lock_open : Icons.lock,
          color: AppColors.textGreenColor,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) _onSignUpPressed();
      },
      child: AppText(
        'Sign Up',
        color: AppColors.textGreenColor,
        weight: AppFontWeight.bold,
        size: TextSize.xxl,
      ),
    );
  }

  void _currencyPickerBasedOnCountry(BuildContext context) {
    showCurrencyPicker(
      context: context,
      theme: CurrencyPickerThemeData(
        titleTextStyle: TextSize.xl.getStyle(
          weight: AppFontWeight.bold,
          color: AppColors.textGreenColor,
        ),
        subtitleTextStyle: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          fontFamily: GoogleFonts.aBeeZee().fontFamily,
          color: AppColors.textGreenColor,
        ),
        currencySignTextStyle: TextSize.xxl.getStyle(
          weight: AppFontWeight.bold,
          color: AppColors.textGreenColor,
        ),
        inputDecoration: InputDecoration(
          filled: true,
          fillColor: AppColors.honeydewGreen,
          hintText: "Search your country",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: AppColors.fenceGreen),
          ),
        ),
        backgroundColor: AppColors.lightGreen,
      ),
      onSelect: (Currency currency) {
        final nameParts = currency.name.split(' ');
        if (nameParts.length > 1) nameParts.removeLast();
        setState(() {
          _currencyController.text = nameParts.join(' ');
          _selectedCurrency = currency.symbol;
        });
      },
    );
  }

  Widget _buildRichTextButton({
    required String plainText,
    required String boldText,
    required VoidCallback onTap,
    Color? boldColor,
  }) {
    return TextButton(
      onPressed: onTap,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: plainText,
          style: TextStyle(
            fontFamily: GoogleFonts.leagueSpartan().fontFamily,
            color: AppColors.textGreenColor,
            fontSize: 13,
          ),
          children: [
            TextSpan(
              text: ' $boldText',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: boldColor ?? AppColors.textGreenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTermsText() => _buildRichTextButton(
    plainText: 'By continuing, you agree to',
    boldText: 'Terms of Use and Privacy Policy.',
    onTap: () {},
  );

  Widget _buildLoginRedirect(BuildContext context) => _buildRichTextButton(
    plainText: 'Already have an account?',
    boldText: 'Log In',
    boldColor: AppColors.vividBlue,
    onTap: () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    ),
  );
}
