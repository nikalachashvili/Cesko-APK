import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:voters/core/theme/app_colors.dart';

/// Grey rounded input with a leading icon and centred text, as used on the
/// voter search form.
class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    this.hintWeight = FontWeight.w400,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.autofillHints,
    this.validator,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final FontWeight hintWeight;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onSubmitted;

  static const _iconSlot = 56.0;

  static OutlineInputBorder _border([BorderSide side = BorderSide.none]) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: side,
      );

  @override
  Widget build(BuildContext context) {
    final error = Theme.of(context).colorScheme.error;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      textAlign: TextAlign.center,
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.fieldFill,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.fieldIcon,
          fontSize: 15,
          fontWeight: hintWeight,
        ),
        prefixIcon: Icon(icon, color: AppColors.fieldIcon, size: 24),
        prefixIconConstraints: const BoxConstraints(
          minWidth: _iconSlot,
          minHeight: 48,
        ),
        suffixIcon: const SizedBox(width: _iconSlot),
        suffixIconConstraints: const BoxConstraints(minWidth: _iconSlot),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        errorMaxLines: 2,
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(
          const BorderSide(color: AppColors.green, width: 1.5),
        ),
        errorBorder: _border(BorderSide(color: error)),
        focusedErrorBorder: _border(BorderSide(color: error, width: 1.5)),
      ),
    );
  }
}
