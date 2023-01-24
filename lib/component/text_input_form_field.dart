import 'package:flutter/material.dart';

class TextInputFormField extends StatelessWidget {
  const TextInputFormField({
    super.key,
    required this.title,
    this.hintText,
    this.keyboardType,
    this.inputAction = TextInputAction.next,
    this.controller,
    this.enabled = true,
    this.hasError = false,
    this.length,
    this.onSubmitted,
    this.focusNode,
    this.capitalization = TextCapitalization.none,
  });
  final String title;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction inputAction;
  final TextEditingController? controller;
  final bool enabled;
  final bool hasError;
  final int? length;
  final VoidCallback? onSubmitted;
  final FocusNode? focusNode;
  final TextCapitalization capitalization;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: hasError ? Colors.redAccent : Colors.black45,
            ),
          ),
          TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            textCapitalization: capitalization,
            enabled: enabled,
            maxLength: length,
            textInputAction: inputAction,
            cursorColor: hasError ? Colors.redAccent : Colors.blueAccent,
            onEditingComplete: onSubmitted,
            focusNode: focusNode,
            onTap: () => Scrollable.ensureVisible(context),
            cursorHeight: 15,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              filled: true,
              fillColor: Colors.blueGrey.shade50,
              alignLabelWithHint: true,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black38,
                ),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              constraints: const BoxConstraints.tightForFinite(height: 30),
            ),
          ),
        ],
      ),
    );
  }
}
