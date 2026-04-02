import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:finwise/core/widgets/app_toast.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/core/widgets/loader.dart';
import 'package:finwise/features/category/domain/entities/category_entity.dart';
import 'package:finwise/features/category/presentation/riverpod/category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/app_btn.dart';
import '../../domain/entities/transaction_entity.dart';
import '../riverpod/add_transaction_provider.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  String? selectedCategoryId;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    messageController.dispose();
    super.dispose();
  }

  // SR DEV: Reusable Date Picker Utility
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.caribbeanGreen,
              onPrimary: Colors.white,
              onSurface: AppColors.fenceGreen,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  void _onSave() {
    // 1. Validate Form (This will now show the red error messages)
    if (_formKey.currentState?.validate() ?? false) {
      // 2. Double check category selection (Secondary safety)
      if (selectedCategoryId == null) {
        AppToast.error(context, "Please select a category");
        return;
      }

      final amount = double.tryParse(amountController.text) ?? 0.0;

      final transaction = TransactionEntity(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: titleController.text,
        amount: amount,
        categoryId: selectedCategoryId!,
        type: TransactionType.expense,
        createdAt: selectedDate,
        updatedAt: DateTime.now(),
      );

      ref.read(transactionStateProvider.notifier).saveTransaction(transaction);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(transactionStateProvider, (previous, next) {
      next.whenOrNull(
        data: (_) => Navigator.pop(context),
        error: (err, _) => AppToast.error(context, err.toString()),
      );
    });

    final isLoading = ref.watch(transactionStateProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          "Add Expense",
          size: TextSize.xxl,
          weight: AppFontWeight.extraBold,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              decoration: BoxDecoration(
                color: AppColors.honeydewGreen,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Date Field (Now Interactive)
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: FormInput(
                            labelText: "Date",
                            hintText: "${selectedDate.toLocal()}".split(' ')[0],
                            suffixIcon: _buildCalendarIcon(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      // Category Dropdown
                      FormInput(
                        labelText: "Categories",
                        child: _buildCategoryDropdown(ref),
                      ),
                      const SizedBox(height: 25),

                      FormInput(
                        controller: amountController,
                        labelText: "Amount",
                        hintText: '0.00',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        validator: (value) => value!.isEmpty
                            ? "Enter your transaction amount"
                            : null,
                      ),
                      const SizedBox(height: 25),

                      FormInput(
                        controller: titleController,
                        labelText: "Expense Title",
                        hintText: 'Enter title',
                        validator: (value) =>
                            value!.isEmpty ? "Enter a related title" : null,
                      ),
                      const SizedBox(height: 25),

                      FormInput(
                        controller: messageController,
                        hintText: 'Enter Message',
                        hintColor: AppColors.caribbeanGreen,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 40),

                      AppButton(
                        title: isLoading ? 'Saving...' : 'Save',
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textGreenColor,
                        ),
                        onPressed: isLoading ? () {} : _onSave,
                      ),
                      const SizedBox(height: 30),
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

  Widget _buildCalendarIcon() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.caribbeanGreen,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        CupertinoIcons.calendar,
        size: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.textGreenColor,
      ),
    );
  }

  Widget _buildCategoryDropdown(WidgetRef ref) {
    final categoryState = ref.watch(categoryStateProvider);
    return categoryState.when(
      data: (categories) => DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        dropdownColor: AppColors.lightGreen,
        initialValue: selectedCategoryId,
        validator: (value) => value == null ? "Please select a category" : null,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightGreen,
          // Ensuring error text is styled clearly
          errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
        hint: AppText(
          "Select a category",
          size: TextSize.lg,
          color: AppColors.textGreenColor,
          weight: AppFontWeight.bold,
        ),
        icon: Icon(
          CupertinoIcons.chevron_down,
          size: 20,
          color: AppColors.caribbeanGreen,
        ),
        items: categories
            .where((cat) => cat.categoryType == CategoryType.expense)
            .map((category) {
              return DropdownMenuItem(
                value: category.categoryId,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/category-icons/${category.file}',
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            AppColors.fenceGreen,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        category.title,
                        style: TextStyle(
                          color: AppColors.textGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
            .toList(),
        onChanged: (value) => setState(() => selectedCategoryId = value),
      ),
      loading: () => const Loader(),
      error: (e, _) => const Text("Error loading categories"),
    );
  }
}
