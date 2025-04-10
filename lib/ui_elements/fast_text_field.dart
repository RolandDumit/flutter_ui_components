import 'package:flutter/material.dart';

class FastTextField extends StatelessWidget {
  final String? title;
  final String? placeholder;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final int? maxLines;
  final Widget? suffix;
  final Function(String)? onChanged;

  const FastTextField({
    super.key,
    this.title,
    this.placeholder,
    this.obscureText,
    this.autocorrect,
    this.enableSuggestions,
    this.maxLines = 1,
    this.onChanged,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        TextField(
          textInputAction: TextInputAction.next,
          obscureText: obscureText ?? false,
          autocorrect: autocorrect ?? false,
          enableSuggestions: enableSuggestions ?? false,
          maxLines: maxLines,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffix: suffix,
            hintText: placeholder,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade500,
                ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }
}
