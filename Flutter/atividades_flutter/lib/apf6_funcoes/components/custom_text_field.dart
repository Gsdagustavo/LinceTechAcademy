import 'package:flutter/material.dart';

/// Custom text field that will be used when registering or modifying a person
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.validator,
    required this.label,
    required this.iconData,
    required this.controller,
    required this.textInputType,
    this.initialValue,
  });

  final FormFieldValidator<String> validator;
  final String label;
  final IconData? iconData;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String? initialValue;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();

    /// If it has an initial value, then it means that this text field was used to change a person attribute
    /// Otherwise, it used to register a person
    if (widget.initialValue != null && widget.controller.text.isEmpty) {
      widget.controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          /// sets the validator function and the text controller
          validator: widget.validator,
          controller: widget.controller,

          keyboardType: widget.textInputType,

          textInputAction: TextInputAction.next,

          /// decoration
          decoration: InputDecoration(
            label: Text(widget.label),
            suffixIcon: Icon(widget.iconData),
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 50),
      ],
    );
  }
}
