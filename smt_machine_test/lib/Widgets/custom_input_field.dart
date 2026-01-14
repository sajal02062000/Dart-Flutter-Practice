import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smt_machine_test/Constants/custom_colors.dart';

import 'custom_label_text.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final String? Function(String?)? validator;
  final bool isPassword;
  final int? maxLength;
  final bool isRequired;
  final bool disabled;
  final bool autofocus;
  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.textInputAction,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
    this.validator,
    this.isPassword = false,
    this.maxLength,
    this.isRequired = false,
    this.disabled = false,
    this.autofocus = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool isPassword = false;

  @override
  void initState() {
    super.initState();
    isPassword = widget.isPassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      enabled: !widget.disabled,
      onChanged: widget.onChanged,
      onFieldSubmitted: (value) => widget.onSubmitted(value),
      obscuringCharacter: '*',
      autocorrect: false,
      enableSuggestions: false,
      textCapitalization: TextCapitalization.none,
      maxLength: widget.maxLength,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: isPassword,
      decoration: InputDecoration(
        counterText: "",
        label: CustomLabelText(
          labelText: widget.label,
          isRequired: widget.isRequired,
        ),
        hintText: widget.hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor: CustomColors.whiteColor,
        filled: true,
        suffixIcon: widget.isPassword
            ? isPassword
                  ? IconButton(
                      onPressed: () => setState(() => isPassword = !isPassword),
                      icon: Icon(
                        isPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    )
                  : null
            : null,
      ),
      validator: widget.validator,
    );
  }
}
