import 'outlined_input_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.label,
    this.initialValue,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.textInputAction,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.keyboardType,
    this.autofillHints,
    this.readOnly = false,
  });

  final String? labelText;
  final Widget? label;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final bool readOnly;

  @override
  State createState() => _State();
}

class _State extends State<CustomTextFormField> {
  final _key = GlobalKey<FormFieldState>();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  bool _hasError = false;

  @override
  void initState() {
    super.initState();

    _controller.text = widget.initialValue ?? "";

    _controller.addListener(() {
      setState(() {
        // This causes rebuild so that we can update x mark icon
      });
    });

    _focusNode.addListener(() {
      setState(() {
        // This causes rebuild so that we can update x mark icon
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    final result = widget.validator?.call(value);

    bool newHasError = result != null;
    if (newHasError != _hasError) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          _hasError = newHasError;
        });
      });
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Widget? suffixIcon;

    if (widget.readOnly) {
      suffixIcon = null;
    } else {
      if (_hasError) {
        suffixIcon = const Icon(Icons.warning, color: Colors.red);
      } else if (_controller.text.isNotEmpty && _focusNode.hasFocus) {
        suffixIcon = Transform(
          transform: Matrix4.translationValues(0, 8, 0),
          child: IconButton(
            focusNode: FocusNode(skipTraversal: true),
            icon: const Icon(Icons.clear, color: Colors.black),
            onPressed: () {
              _controller.clear();
              widget.onChanged?.call("");
            },
          ),
        );
      } else {
        suffixIcon = null;
      }
    }

    return TextFormField(
      key: _key,
      controller: _controller,
      focusNode: _focusNode,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      validator: _validate,
      autovalidateMode: null,
      textCapitalization: widget.textCapitalization,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      autofillHints: widget.autofillHints,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.05),
        border: OutlinedInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        focusedBorder: widget.readOnly
            ? null
            : OutlinedInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.1),
                  width: 2,
                ),
                innerBorderSide: BorderSide(
                  color: Colors.black.withOpacity(0.05),
                  width: 1,
                ),
              ),
        labelText: widget.labelText,
        label: widget.label,
        labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
        floatingLabelStyle: const TextStyle(fontSize: 12, color: Colors.black),
        errorStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
        hintStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
        suffixIcon: suffixIcon,
        counter: const SizedBox.shrink(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}
